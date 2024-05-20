import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final emailController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  RxString userImagePath = "".obs;
  //-> Image Picker
  RxBool isImagePathSet = false.obs;
  File? image;
  ImagePicker picker = ImagePicker();
  chooseImageFromGallery() async {
    var pickImage = await picker.pickImage(source: ImageSource.gallery);
    image = File(pickImage!.path);
    if (image!.path.isNotEmpty) {
      userImagePath.value = image!.path;
      isImagePathSet.value = true;
    }
  }

  chooseImageFromCamera() async {
    var pickImage = await picker.pickImage(source: ImageSource.camera);
    image = File(pickImage!.path);
    if (image!.path.isNotEmpty) {
      userImagePath.value = image!.path;
      isImagePathSet.value = true;
    }
  }
}
