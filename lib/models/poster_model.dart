import 'package:tec/constants/api_constants.dart';

class PosterModel {
  late String? id;
  late String? title;
  late String? image;

  PosterModel({
    this.id,
    this.title,
    this.image,
  });

  PosterModel.fromJson(Map<String, dynamic> element) {
    id = element['id'];
    title = element['title'];
    image = ApiUrlConstants.hostDlUrl + element['image'];
  }
}
