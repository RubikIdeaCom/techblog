import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tec/constants/api_constants.dart';
import 'package:tec/models/article_info_model.dart';
import 'package:tec/models/article_model.dart';
import 'package:tec/models/tags_model.dart';
import 'package:tec/services/dio_service.dart';
import 'package:tec/view/article/single.dart';

class SingleArticleController extends GetxController {
  RxBool loading = false.obs;
  RxInt id = RxInt(0);
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel().obs;
  RxList<TagsModel> tagList = RxList();
  RxList<ArticleModel> relatedList = RxList();

  @override
  void onInit() {
    super.onInit();
    getArticleInfo(id);
  }

  void getArticleInfo(var id) async {
    articleInfoModel = ArticleInfoModel().obs;

    loading.value = true;
    var userId = '';

    // Server connection, await is required
    var response = await DioService().getMethod(
        '${ApiUrlConstants.baseUrl}article/get.php?command=info&id=$id&user_id=$userId');
    if (response.statusCode == 200) {
      articleInfoModel.value = ArticleInfoModel.fromJson(response.data);
      loading.value = false;
    } else {
      // loading.value = true;
      debugPrint('Status code is not OK!');
    }

    tagList.clear();
    response.data['tags'].forEach((element) {
      tagList.add(TagsModel.fromJson(element));
    });

    relatedList.clear();
    response.data['related'].forEach((element) {
      relatedList.add(ArticleModel.fromJson(element));
    });

    Get.to(() => Single());
  }
}
