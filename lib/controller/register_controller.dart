import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tec/component/api_constants.dart';
import 'package:tec/services/dio_service.dart';

class RegisterController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController activateCodeTextEditingController =
      TextEditingController();

  void register() async {
    Map<String, dynamic> map = {
      'email': emailTextEditingController.text,
      'command': 'register'
    };

    var response =
        await DioService().postMethod(map, ApiConstants.postRegister);

    print(response);
  }
}
