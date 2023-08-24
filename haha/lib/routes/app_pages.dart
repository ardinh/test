import 'package:haha/modules/index/index_binding.dart';
import 'package:haha/modules/index/index_detail.dart';
import 'package:haha/modules/index/index_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
        name: Routes.HOME,
        page: () => const IndexScreen(),
        binding: IndexBinding()),
    GetPage(
        name: Routes.detail,
        page: () => const IndexDetail(),
        binding: IndexBinding()),
  ];
}
