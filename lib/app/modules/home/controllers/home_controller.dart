import 'package:get/get.dart';

class HomeController extends GetxController {

  var count = 0.obs;

  void increment() => count.value++;
  void decrement() => count.value--;

  @override
  void onInit() {
    super.onInit();
  }

 
}
