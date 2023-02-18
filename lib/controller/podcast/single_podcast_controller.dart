import 'package:get/get.dart';
import 'package:tec/constants/api_constants.dart';
import 'package:tec/models/podcast_file_model.dart';
import 'package:tec/services/dio_service.dart';

class SinglePodcastController extends GetxController {
  var id;
  SinglePodcastController({this.id}); // Set id value in constructor

  RxBool loading = false.obs;

  Rx<PodcastsFileModel> podcastsFileModel = PodcastsFileModel().obs;
  RxList<PodcastsFileModel> podcastFileList = RxList();

  @override
  void onInit() {
    super.onInit();
    getPodcastFiles();
  }

  void getPodcastFiles() async {
    loading.value = true;
    var response =
        await DioService().getMethod(ApiUrlConstants.podcastFiles + id);
    if (response.statusCode == 200) {
      for (var element in response.data['files']) {
        //response.data is the API JSON response & files is an index of it.
        podcastFileList.add(PodcastsFileModel.fromJson(element));
      }
      loading.value = false;
    }
  }
}
