import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tec/component/api_constants.dart';
import 'package:tec/component/storage_constants.dart';
import 'package:tec/services/dio_service.dart';
import 'package:tec/view/main_screen/main_screen.dart';
import 'package:tec/view/register/register_intro.dart';

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

    var status = response.data['response'];

    switch (status) {
      case 'verified':
        var box = GetStorage();
        box.write(token, response.data['token']);
        box.write(userId, response.data['userId']);

        debugPrint('Read:: ${box.read(token)}');
        debugPrint('Read:: ${box.read(userId)}');

        Get.offAll(() => MainScreen());
        break;
      case 'incorrect_code':
        Get.snackbar('خطا', 'کد فعال سازی غلط است.');
        break;
      case 'expired':
        Get.snackbar('خطا', 'کد فعال سازی منقضی شده است.');
        break;
    }

    debugPrint(response.data.toString());
  }

  void toggleLogin() {
    if (GetStorage().read(token) == null) {
      // User is not verified
      Get.to(() => RegisterIntro());
    } else {
      // User verified
      routeToWriteBottomSheet();
    }
  }

  routeToWriteBottomSheet() {
    Container(
      height: Get.height / 3,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/images/techbot.svg",
                  height: 40,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text('دانسته هات رو با بقیه به اشتراک بگذار')
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
                'توی دنیای گیگ ها بیا و دانسته هات رو با بقیه به اشتراک بگذار'),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    debugPrint('write article');
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          "assets/icons/write_article.png",
                          height: 32,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text('مدیریت مقاله ها')
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('write podcast');
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/icons/write_podcast.png",
                          height: 32,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text('مدیریت پادکست ها')
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
