import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tec/constants/api_constants.dart';
import 'package:tec/constants/commands.dart';
import 'package:tec/constants/storage_constants.dart';
import 'package:tec/controller/file_controller.dart';
import 'package:tec/models/article_info_model.dart';
import 'package:tec/models/article_model.dart';
import 'package:tec/models/tags_model.dart';
import 'package:tec/services/dio_service.dart';

class ManageArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList.empty();
  RxList<TagsModel> tagList = RxList.empty();
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel().obs;
  TextEditingController titleTextEditingController = TextEditingController();

  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getManageArticle();
  }

  void updateTitle() {
    articleInfoModel.update((val) {
      val!.title = titleTextEditingController.text;
    });
  }

  void storeArticle() async {
    var fileControler = Get.find<FilePickerController>();

    loading.value = true;

    Map<String, dynamic> map = {
      ApiArticleKeyConstant.title: articleInfoModel.value.title,
      ApiArticleKeyConstant.content: articleInfoModel.value.content,
      ApiArticleKeyConstant.catId: articleInfoModel.value.catId,
      ApiArticleKeyConstant.userId: GetStorage().read(StorageKey.userId),
      ApiArticleKeyConstant.image:
          await dio.MultipartFile.fromFile(fileControler.file.value.path!),
      ApiArticleKeyConstant.command: Commands.store,
      ApiArticleKeyConstant.tagList: '[]',
    };

    var response =
        await DioService().postMethod(map, ApiUrlConstants.articlePost);
    log(response.toString());
  }

  void getManageArticle() async {
    loading.value = true;
    // Server connection, await is required
    var response = await DioService().getMethod(
        ApiUrlConstants.publishedByMe + GetStorage().read(StorageKey.userId));

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
    } else {
      debugPrint("Error on loading data");
    }
    loading.value = false;
  }
}
