import 'package:tec/constants/api_constants.dart';

class ArticleModel {
  late String id;
  late String title;
  late String image;
  late String catId;
  late String catName;
  late String author;
  late String view;
  late String status;
  late String createdAt;

  ArticleModel();

  ArticleModel.fromJson(Map<String, dynamic> element) {
    id = element['id'];
    title = element['title'];
    image = ApiUrlConstants.hostDlUrl + element['image'];
    catId = element['cat_id'];
    catName = element['cat_name'];
    author = element['author'];
    view = element['view'];
    status = element['status'];
    createdAt = element['created_at'];
  }
}
