import 'package:get/get.dart';
import 'package:tec/component/api_constants.dart';
import 'package:tec/models/article_info_model.dart';
import 'package:tec/services/dio_service.dart';

class SingleArticleController extends GetxController {
  RxBool loading = false.obs;
  RxInt id = RxInt(-1);
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getArticleInfo();
  }

  void getArticleInfo() async {
    loading.value = true;
    // TODO: user id
    var userId = '';

    // Server connection, await is required
    var response = await DioService().getMethod(
        '${ApiConstants.baseUrl}article/get.php?command=info&id=$id&user_id=$userId');

    if (response.statusCode == 200) {
      articleInfoModel.value = ArticleInfoModel.fromJson(response.data);
      loading.value = false;
    } else {
      loading.value = false;
    }
  }
}
