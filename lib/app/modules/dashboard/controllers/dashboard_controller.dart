import 'package:counter_app_flutter/app/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class DashboardController extends GetxController
    with GetSingleTickerProviderStateMixin {

  late TabController tabController;

  /// 🔹 Form Controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final dobController = TextEditingController();

  /// 🔹 User List
  var userList = <UserModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
  }

  /// 🔹 Register Function
  void registerUser() {

    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty ||
        dobController.text.isEmpty) {

      Get.snackbar("Error", "All fields are required");
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar("Error", "Passwords do not match");
      return;
    }

    final user = UserModel(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      dob: dobController.text,
    );

    userList.add(user);

    /// Clear fields
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    dobController.clear();

    /// Switch to Details Tab
    tabController.animateTo(2);

    Get.snackbar("Success", "User Registered");
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}

