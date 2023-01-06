class PodcastModel {
  late String id;
  late String title;
  late String poster;
  late String publisher;
  late String view;
  late String createdAt;

  PodcastModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.publisher,
    required this.view,
    required this.createdAt,
  });

  PodcastModel.fromJson(Map<String, dynamic> element) {
    id = element['id'];
    id = element['title'];
    id = element['poster'];
    id = element['publisher'];
    id = element['view'];
    id = element['created_at'];
  }
}
