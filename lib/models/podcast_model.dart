import 'package:tec/constants/api_constants.dart';

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
    title = element['title'];
    poster = ApiUrlConstants.hostDlUrl + element['poster'];
    publisher = element['author'];
    view = element['view'];
    createdAt = element['created_at'];
  }
}
