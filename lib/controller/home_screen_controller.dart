import 'package:get/get.dart';
import 'package:tec/component/api_constants.dart';
import 'package:tec/models/article_model.dart';
import 'package:tec/models/podcast_model.dart';
import 'package:tec/models/poster_model.dart';
import 'package:tec/services/dio_service.dart';

class HomeScreenController extends GetxController {
  Rx<PosterModel> poster = PosterModel().obs;

  RxList tagList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastModel> topPodcast = RxList();

  RxBool loading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getHomeItems();
  }

  void getHomeItems() async {
    loading.value = true;

    var response = await DioService().getMethod(
        ApiConstants.getHomeItems); // Server connection, await is required

    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        topVisitedList.add(ArticleModel.fromJson(element));
      });

      response.data['top_podcast'].forEach((element) {
        topPodcast.add(PodcastModel.fromJson(element));
      });

      poster.value = PosterModel.fromJson(response.data['poster']);
      loading.value = false;
    }
  }
}
