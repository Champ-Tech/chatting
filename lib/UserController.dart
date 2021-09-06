import 'package:champteks/User.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final user = User().obs;

  updateUser({int age = 0, String name = ''}) {
    user.update((val) {
      val!.age = user.value.age | age;
      val.name = name.isEmpty ? user.value.name : name;
    });
  }

}
