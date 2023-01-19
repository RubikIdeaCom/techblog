import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:tec/component/my_colors.dart';
import 'package:tec/component/my_components.dart';
import 'package:tec/controller/article/single_article_controller.dart';

// ignore: must_be_immutable
class Single extends StatelessWidget {
  var singleArticleController = Get.find<SingleArticleController>();

  Single({super.key});

  @override
  Widget build(BuildContext context) {
    //var id = Get.arguments[0];
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Obx(
        () => singleArticleController.articleInfoModel.value.title == null
            ? SizedBox(height: Get.height, child: loading())
            : Column(children: [
                Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          singleArticleController.articleInfoModel.value.image!,
                      imageBuilder: (((context, imageProvider) {
                        return Image(image: imageProvider);
                      })),
                      placeholder: (((context, url) => loading())),
                      errorWidget: (((context, url, error) =>
                          Image.asset('assets/images/avatar.jpg'))),
                    ),
                    Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 60,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  end: Alignment.bottomCenter,
                                  begin: Alignment.topCenter,
                                  colors: GradiantColors.singleAppbar)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                SizedBox(
                                  width: 20,
                                ),
                                Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                Expanded(
                                  child: SizedBox(),
                                ),
                                Icon(
                                  Icons.bookmark_outline,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Icon(
                                  Icons.share,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ]),
                        ))
                  ],
                ),
                Text(
                  singleArticleController.articleInfoModel.value.title!,
                  maxLines: 2,
                  style: textTheme.headline4,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image(
                        height: 30,
                        width: 30,
                        image: Image.asset('assets/images/avatar.png').image,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(singleArticleController
                          .articleInfoModel.value.author!),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(singleArticleController
                          .articleInfoModel.value.createdAt!),
                    ],
                  ),
                ),
                HtmlWidget(
                  singleArticleController.articleInfoModel.value.content!,
                  textStyle: textTheme.headline3,
                  enableCaching: true,
                  onLoadingBuilder: (context, element, loadingProgress) =>
                      loading(),
                ),
              ]),
      ),
    )));
  }
}
