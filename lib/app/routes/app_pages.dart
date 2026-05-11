import 'package:get/get.dart';

import '../modules/create_form/bindings/create_form_binding.dart';
import '../modules/create_form/views/create_form_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/payment_demo/bindings/payment_demo_binding.dart';
import '../modules/payment_demo/views/payment_demo_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.CREATE_FORM;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_FORM,
      page: () => const CreateFormView(),
      binding: CreateFormBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_DEMO,
      page: () => const PaymentDemoView(),
      binding: PaymentDemoBinding(),
    ),
  ];
}
