import 'package:get/get.dart';
import 'package:seunghyun_todo/infra/router/base_navigator.dart';
import 'package:seunghyun_todo/routes/root/root_route.dart';

class SplashRouteController extends GetxController {
  // ! ---- core ----

  initialize() {
    return Future.delayed(const Duration(seconds: 4)).then((_) {
      return BaseNavigator.reset(const RootRoute());
    });
  }

  @override
  void onInit() {
    initialize();
    super.onInit();
  }
}
