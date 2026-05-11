import 'package:counter_app_flutter/app/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateFormController extends GetxController with GetSingleTickerProviderStateMixin{
  //TODO: Implement CreateFormController

  late TabController tabController;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final dobController = TextEditingController();

  final count = 0.obs;
  var userList = <UserModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
  }


  void registerUser() {
    if(nameController.text.isEmpty || 
    emailController.text.isEmpty ||
    passwordController.text.isEmpty ||
    confirmPasswordController.text.isEmpty ||
    dobController.text.isEmpty) {
      Get.snackbar('Error', 'All fields are required');
      return;
    }
    if(passwordController.text != confirmPasswordController.text){
      Get.snackbar("Error", "Passwords do not match");
      return;
    }

    final user = UserModel(name: nameController.text, email: emailController.text, password: passwordController.text, dob: dobController.text);
    userList.add(user);

    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    dobController.clear();

    Get.snackbar("Registered", "User registered successfully");
    tabController.animateTo(2);

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    dobController.dispose();
    super.onClose();
  }

  // void increment() => count.value++;
}
