import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/payment_demo_controller.dart';

class PaymentDemoView extends GetView<PaymentDemoController> {
  const PaymentDemoView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PaymentDemo'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Payment Demo',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
