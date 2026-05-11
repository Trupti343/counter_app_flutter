import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(title: const Text('Counter App'), centerTitle: true),
      body: Obx(
        () => Center(
          child: Text('${controller.count.value}', style: TextStyle(fontSize: 20)),
        ),
      ),

      floatingActionButton: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.values[1],
        children: [
          FloatingActionButton(
            onPressed: controller.increment,
            child: Icon(Icons.add),
          ),
     
          FloatingActionButton(
            onPressed: controller.decrement,
            child: Icon(Icons.remove),
          ),
         
                    FloatingActionButton(
            onPressed: controller.increment,
            child: Icon(Icons.add),
          ),

          FloatingActionButton(
            onPressed: controller.decrement,
            child: Icon(Icons.remove),
          ),

        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/home_controller.dart';

// class HomeView extends GetView<HomeController> {
//   const HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {

//     // Initialize controller (if not already in binding)
//     final HomeController controller = Get.put(HomeController());

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Counter App'),
//         centerTitle: true,
//       ),

//       body: Center(
//         child: Obx(() => Text(
//               '${controller.count.value}',
//               style: const TextStyle(fontSize: 40),
//             )),
//       ),

//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: controller.increment,
//             child: const Icon(Icons.add),
//           ),
//           const SizedBox(height: 10),
//           FloatingActionButton(
//             onPressed: controller.decrement,
//             child: const Icon(Icons.remove),
//           ),
//         ],
//       ),
//     );
//   }
// }
