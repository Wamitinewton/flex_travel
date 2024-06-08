import 'package:flextravel/domain/auth_controller.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<AuthController>(() => AuthController());
    // Get.lazyPut<AuthService>(() => AuthService());
  }
}