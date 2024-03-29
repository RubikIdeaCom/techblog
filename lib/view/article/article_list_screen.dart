import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec/component/my_components.dart';
import 'package:tec/controller/article/list_article_controller.dart';
import 'package:tec/controller/article/single_article_controller.dart';

// ignore: must_be_immutable
class ArticleListScreen extends StatelessWidget {
  ArticleListScreen({super.key});

  var listArticleController = Get.find<ListArticleController>();
  var singleArticleController = Get.find<SingleArticleController>();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      appBar: appBar('مقالات جدید'),
      body: SizedBox(
        child: Obx(
          () => ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: listArticleController.articleList.length,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: (() => {
                        singleArticleController.getArticleInfo(
                            listArticleController.articleList[index].id),
                      }),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: Get.width / 3,
                          height: Get.height / 6,
                          child: CachedNetworkImage(
                            imageUrl:
                                listArticleController.articleList[index].image,
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(16)),
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover)),
                              );
                            },
                            placeholder: (((context, url) {
                              return loading();
                            })),
                            errorWidget: (context, url, error) {
                              return const Icon(
                                  Icons.image_not_supported_outlined,
                                  size: 50);
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Get.width / 2,
                              child: Text(
                                listArticleController.articleList[index].title,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  listArticleController
                                      .articleList[index].author,
                                  style: textTheme.caption,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  '${listArticleController.articleList[index].view} بازدید',
                                  style: textTheme.caption,
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              })),
        ),
      ),
    ));
  }
}
