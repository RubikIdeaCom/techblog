import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tec/constants/api_constants.dart';
import 'package:tec/models/article_model.dart';
import 'package:tec/services/dio_service.dart';

class ListArticleController extends GetxController {
  late RxList<ArticleModel> articleList = RxList();

  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getList();
  }

  void getArticleListByTagId(String id) async {
    articleList.clear();
    loading.value = true;

    final queryParam = {
      'command': 'get_articles_with_tag_id',
      'tag_id': id,
      'user_id': '',
    };

    final uri =
        Uri.https(ApiUrlConstants.baseUrl, 'article/get.php?', queryParam);

    // Server connection, await is required
    var response = await DioService().getMethod(uri.toString());

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      loading.value = false;
    } else {
      loading.value = false;
      debugPrint("Error on loading data");
    }
  }

  void getList() async {
    loading.value = true;

    // Server connection, await is required
    var response = await DioService().getMethod(ApiUrlConstants.getArticleList);

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      loading.value = false;
    } else {
      loading.value = false;
      debugPrint("Error on loading data");
    }
  }
}
