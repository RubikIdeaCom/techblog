import 'package:tec/models/data_models.dart';

Map homePagePosterMap = {
  "imageUrl": "assets/images/poster.jpg",
  "hashtagUrl": "assets/icons/hashtag.png",
  "penUrl": "assets/icons/pen.png",
  "home": "assets/icons/home.png",
  "user": "assets/icons/user.png",
  "write": "assets/icons/write.png",
  "writer": "ملیکا عزیزی",
  "date": "یک روز پیش",
  "title": "دوازده قدم برنامه نویسی یک دوره...",
  "view": "251",
};

List<HashTagModel> tagList = [
  HashTagModel(title: "جاوا"),
  HashTagModel(title: "کاتلین"),
  HashTagModel(title: "وب"),
  HashTagModel(title: "هوش مصنوعی"),
  HashTagModel(title: "IoT"),
  HashTagModel(title: "دارت"),
];

List<HashTagModel> selectedTags = [];

List<BlogModel> blogList = [
  BlogModel(
      id: 1,
      title: "وقتی روی رویا پردازی تمرکز نداری نمی توانی به چشمانت اعتماد کنی",
      imageUrl: "http://rubikidea.com/assets/img/testimonials/1.jpg",
      writer: "مارک تواین",
      writerImageUrl: "",
      date: "1 ساعت پیش",
      content: "متن خبر اینجا می آید",
      views: "100"),
  BlogModel(
      id: 2,
      title: "طراحی یعنی چطور نمایش داده می شود و چطور کار می کند",
      imageUrl: "http://rubikidea.com/assets/img/testimonials/2.jpg",
      writer: "استیو جابز",
      writerImageUrl: "",
      date: "2 ساعت پیش",
      content: "متن خبر اینجا می آید",
      views: "200"),
  BlogModel(
      id: 3,
      title: "ویژگی اصلی هوشمندی رویا پردازی است نه اطلاعات",
      imageUrl: "http://rubikidea.com/assets/img/testimonials/3.jpg",
      writer: "آلبرت انیشتین",
      writerImageUrl: "",
      date: "3 ساعت پیش",
      content: "متن خبر اینجا می آید",
      views: "300"),
  BlogModel(
      id: 4,
      title:
          "تنها راه شروع کردن کارها، کنار گذاشتن حرف ها و انجام دادن کارهاست",
      imageUrl: "http://rubikidea.com/assets/img/testimonials/4.jpg",
      writer: "والت دیزنی",
      writerImageUrl: "",
      date: "4 ساعت پیش",
      content: "متن خبر اینجا می آید",
      views: "400"),
];
