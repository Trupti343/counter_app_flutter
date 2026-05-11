import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Application Dashboard'),
        centerTitle: true,
        bottom: TabBar(
          controller: controller.tabController,
          tabs: const [
            Tab(text: "Login"),
            Tab(text: "Register"),
            Tab(text: "Details"),
          ],
        ),
      ),

      body: TabBarView(
        controller: controller.tabController,
        children: [

          /// 🔹 LOGIN TAB
          const Center(child: Text("Login Screen")),

          /// 🔹 REGISTER TAB
          Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [

                  TextFormField(
                    controller: controller.nameController,
                    decoration: const InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12,),

                  TextFormField(
                    controller: controller.emailController,
                    decoration: const InputDecoration(  
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),

                  TextFormField(
                    controller: controller.passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),

                  TextFormField(
                    controller: controller.confirmPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Confirm Password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),

                  /// 📅 DOB FIELD
                  TextFormField(
                    controller: controller.dobController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: "Date of Birth",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2000),
                        firstDate: DateTime(1950),
                        lastDate: DateTime.now(),
                      );

                      if (pickedDate != null) {
                        controller.dobController.text =
                            "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
                      }
                    },
                  ),
                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      controller.registerUser();
                    },
                    child: const Text("Register"),
                  ),
                ],
              ),
            ),
          ),

          /// 🔹 DETAILS TAB
          Obx(() {
            if (controller.userList.isEmpty) {
              return const Center(child: Text("No Data Available"));
            }

            return ListView.builder(
              itemCount: controller.userList.length,
              itemBuilder: (context, index) {
                final user = controller.userList[index];

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(user.name),
                    subtitle: Text(
                      "Email: ${user.email}\nDOB: ${user.dob}",
                    ),
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}