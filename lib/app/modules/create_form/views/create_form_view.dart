import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/create_form_controller.dart';

class CreateFormView extends GetView<CreateFormController> {
  const CreateFormView({super.key});
  @override
  Widget build(BuildContext context) {
    CreateFormController controller= Get.put(CreateFormController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Form'),
        centerTitle: true,
        bottom: TabBar(
          controller: controller.tabController,
          tabs: [
            Tab(text: 'Login'),
            Tab(text: 'Register'),
            Tab(text: 'Details'),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: [

        Center(child: Text('Login'),),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: controller.nameController,
                  decoration: InputDecoration(
                    labelText: 'Name', 
                    border: OutlineInputBorder()        
                  ),                 
                ),
                SizedBox(height: 12,),
                TextFormField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 12,),
                TextFormField(
                  controller: controller.passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 12,),
                TextFormField(
                  controller: controller.confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 12,),
                TextFormField(
                  controller: controller.dobController,
                  decoration: InputDecoration(
                    labelText: 'Date of Birth',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context, 
                      initialDate: DateTime(2000),
                      firstDate: DateTime(1950 ), 
                      lastDate: DateTime.now(),

                    );
                    if(pickedDate != null){
                      controller.dobController.text="${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                    }
                  },
                ),
              
              ElevatedButton(
                  onPressed: () {
                    controller.registerUser();
                }, child: Text( 'Register')
              ),

              
              ],
            ),
          ),
        ),
        // Center(child: Text('Details'),)
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
      ]),
    );
  }
}
