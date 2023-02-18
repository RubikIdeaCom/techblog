class PodcastsFileModel {
  String? id;
  String? podcastId;
  String? file;
  String? title;
  String? length;

  PodcastsFileModel();

  PodcastsFileModel.fromJson(Map<String, dynamic> element) {
    id = element['id'];
    podcastId = element['podcast_id'];
    file = element['file'];
    title = element['title'];
    length = element['length'];
  }
}
