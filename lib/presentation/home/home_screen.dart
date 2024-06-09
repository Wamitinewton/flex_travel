import 'package:flextravel/constants.dart';
import 'package:flextravel/domain/avatar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  final ImageController imageController = Get.find<ImageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLynxWhite,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 15),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      imageController.pickImage();
                    },
                    child: Obx(
                      () => CircleAvatar(
                        radius: 38,
                        backgroundColor: Colors.green,
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 35,
                          backgroundImage:
                              imageController.imageFile.value != null
                                  ? FileImage(imageController.imageFile.value!)
                                  : (imageController.avatarUrl.value.isNotEmpty
                                          ? NetworkImage(
                                              imageController.avatarUrl.value)
                                          : const AssetImage(
                                              "assets/images/pic1.jpg"))
                                      as ImageProvider,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
