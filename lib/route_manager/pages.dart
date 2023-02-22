import 'package:get/get.dart';
import 'package:tec/route_manager/binding.dart';
import 'package:tec/route_manager/names.dart';
import 'package:tec/view/article/manage_article.dart';
import 'package:tec/view/article/single.dart';
import 'package:tec/view/article/single_manage_article.dart';
import 'package:tec/view/main_screen/main_screen.dart';
import 'package:tec/view/podcast/single_podcast.dart';
import 'package:tec/view/splash_screen.dart';

class Pages {
  Pages._();

  static List<GetPage<dynamic>> pages = [
    GetPage(
      name: NamedRoutes.initialRoute,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: NamedRoutes.routeMainScreen,
      page: () => MainScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: NamedRoutes.routeSingleArticle,
      page: () => Single(),
      binding: ArticleBinding(),
    ),
    GetPage(
      name: NamedRoutes.routeManageArticle,
      page: () => ManageArticle(),
      binding: ArticleManagerBinding(),
    ),
    GetPage(
      name: NamedRoutes.routeSingleManageArticle,
      page: () => SingleManageArticle(),
      binding: ArticleManagerBinding(),
    ),
    GetPage(
      name: NamedRoutes.routeSinglePodcast,
      page: () => PodcastSingle(),
    ),
  ];
}
