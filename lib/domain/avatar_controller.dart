import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flextravel/hive/cached_data.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hive/hive.dart';

class ImageController extends GetxController {
  final ImagePicker _imagePicker = ImagePicker();
  Rx<File?> imageFile = Rx<File?>(null);
  RxString avatarUrl = ''.obs;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  late Box<CachedData> cacheBox;

  @override
  void onInit() {
    super.onInit();
    cacheBox = Hive.box<CachedData>('cacheBox');
    _loadInitialAvatarUrl();
  }

  Future<void> _loadInitialAvatarUrl() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        CachedData? cachedData = cacheBox.get('avatar_url');
        if (cachedData != null) {
          avatarUrl.value = cachedData.data;
        } else {
          DocumentSnapshot userDoc =
              await _firebaseFirestore.collection('users').doc(user.uid).get();
          var userData = userDoc.data() as Map<String, dynamic>?;
          if (userDoc.exists &&
              userData != null &&
              userData.containsKey('avatar_url')) {
            avatarUrl.value = userData['avatar_url'];
            cacheBox.put(
                'avatar_url', CachedData()..data = userData['avatar_url']);
          }
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load avatar URL: $e');
    }
  }

  Future<void> pickImage() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
      await uploadImageToFirebase(imageFile.value!);
    } else {
      Get.snackbar('Error', 'No image selected');
    }
  }

  Future<void> uploadImageToFirebase(File file) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        String userId = user.uid;
        String? existingImageUrl = await _getExistingImageUrl(userId);
        if (existingImageUrl != null) {
          await _deleteExistingImage(existingImageUrl);
        }
        Reference storageRef =
            _firebaseStorage.ref().child('user_images/$userId/avatar.jpg');
        UploadTask uploadTask = storageRef.putFile(file);

        await uploadTask.whenComplete(() async {
          String downloadUrl = await storageRef.getDownloadURL();
          avatarUrl.value = downloadUrl;
          cacheBox.put('avatar_url', CachedData()..data = downloadUrl);
          await _saveDownloadUrlToDatabase(userId, downloadUrl);
          Get.snackbar('Success', 'Image uploaded successfully');
        });
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> _deleteExistingImage(String imageUrl) async {
    try {
      Reference storageRef = _firebaseStorage.refFromURL(imageUrl);
      await storageRef.delete();
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete existing image: $e');
    }
  }

  Future<String?> _getExistingImageUrl(String userId) async {
    try {
      DocumentSnapshot userDoc =
          await _firebaseFirestore.collection('users').doc(userId).get();
      var userData = userDoc.data() as Map<String, dynamic>?;
      if (userDoc.exists &&
          userData != null &&
          userData.containsKey('avatar_url')) {
        return userData['avatar_url'];
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to get existing image URL: $e');
    }
    return null;
  }

  Future<void> _saveDownloadUrlToDatabase(
      String userId, String downloadUrl) async {
    try {
      await _firebaseFirestore.collection('users').doc(userId).set({
        'avatar_url': downloadUrl,
      }, SetOptions(merge: true));
    } catch (e) {
      Get.snackbar('Error', 'Failed to save URL: $e');
    }
  }
}
