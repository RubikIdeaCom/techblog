import 'package:get/get.dart';
import 'package:tec/component/api_constants.dart';
import 'package:tec/models/article_model.dart';
import 'package:tec/services/dio_service.dart';

class ArticleController extends GetxController {
  late RxList<ArticleModel> articleList = RxList();

  RxBool loading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getList();
  }

  void getList() async {
    loading.value = true;

    // Server connection, await is required
    var response = await DioService().getMethod(ApiConstants.getArticleList);

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      loading.value = false;
    }
  }
}
