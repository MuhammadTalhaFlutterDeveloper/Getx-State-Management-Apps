import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/Screens/image_controller.dart';
import 'package:getxdemo/components/constant.dart';

class ImagePickerApp extends StatefulWidget {
  const ImagePickerApp({super.key});

  @override
  State<ImagePickerApp> createState() => _ImagePickerAppState();
}

class _ImagePickerAppState extends State<ImagePickerApp> {
  //controller
  final ImagePickerController imagePickerController =
      Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: purpleColor,
        title: const Text("Image Picker"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: imagePickerController.imagePath.isNotEmpty
                  ? FileImage(File(imagePickerController.imagePath.toString()))
                  : null,
            ),
          ),
          TextButton(
              onPressed: () {
                imagePickerController.getImage();
              },
              child: const Text("Image Picker"))
        ],
      ),
    );
  }
}
