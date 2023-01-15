import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tec/component/api_constants.dart';
import 'package:tec/component/storage_constants.dart';
import 'package:tec/services/dio_service.dart';
import 'package:tec/view/main_screen/main_screen.dart';

class RegisterController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController activateCodeTextEditingController =
      TextEditingController();

  var email = '';
  var userId = '';

  void register() async {
    Map<String, dynamic> map = {
      'email': emailTextEditingController.text,
      'command': 'register'
    };

    var response =
        await DioService().postMethod(map, ApiConstants.postRegister);

    email = emailTextEditingController.text;
    userId = response.data['user_id'];

    debugPrint(response);
  }

  void verify() async {
    Map<String, dynamic> map = {
      'email': email,
      'user_id': userId,
      'code': activateCodeTextEditingController.text,
      'command': 'verify'
    };

    debugPrint(map.toString());

    var response =
        await DioService().postMethod(map, ApiConstants.postRegister);

    if (response.data['response'] == 'verify') {
      var box = GetStorage();
      box.write(token, response.data['token']);
      box.write(userId, response.data['userId']);

      debugPrint('Read:: ${box.read(token)}');
      debugPrint('Read:: ${box.read(userId)}');

      Get.to(() => MainScreen());
    } else {
      log('Error');
    }

    debugPrint(response.data);
  }
}
