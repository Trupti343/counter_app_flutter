import 'package:get/get.dart';

import '../controllers/payment_demo_controller.dart';

class PaymentDemoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentDemoController>(
      () => PaymentDemoController(),
    );
  }
}
