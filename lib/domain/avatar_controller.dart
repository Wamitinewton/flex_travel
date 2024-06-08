import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  final ImagePicker _imagePicker = ImagePicker();
  Rx<File?> imageFile = Rx<File?>(null);
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<void> pickeImage() async {
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
        Reference storageRef =
            _firebaseStorage.ref().child('user_images/$userId/avatar.jpg');
        UploadTask uploadTask = storageRef.putFile(file);

        await uploadTask.whenComplete(() async {
          String downloadUrl = await storageRef.getDownloadURL();
          await _saveDownloadUrlToDatabase(userId, downloadUrl);
          Get.snackbar('Success', 'Image uploaded successfully');
        });
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> _saveDownloadUrlToDatabase(
      String userId, String downloadUrl) async {
    try {
      await _firebaseFirestore.collection('users').doc(userId).set({
        'avatar_url': downloadUrl,
      }, SetOptions(merge: true));
    } catch (e) {
      Get.snackbar('Error', 'Failed to save url : $e');
    }
  }
}
