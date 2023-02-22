import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec/constants/my_colors.dart';
import 'package:tec/component/my_components.dart';
import 'package:tec/constants/my_strings.dart';
import 'package:tec/controller/home_screen_controller.dart';
import 'package:tec/main.dart';
import 'package:tec/models/fake_data.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  }) : super(key: key);

  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.only(left: 8),
          child: homeScreenController.loading.value == false
              ? Column(
                  children: [
                    poster(),
                    const SizedBox(
                      height: 16,
                    ),
                    // Tag list
                    tagsList(),
                    const SizedBox(
                      height: 32,
                    ),
                    SeeMoreBlog(
                        bodyMargin: bodyMargin,
                        homePagePosterMap: homePagePosterMap,
                        textTheme: textTheme),
                    topVisited(),
                    const SizedBox(
                      height: 32,
                    ),
                    SeeMorePodcast(
                        bodyMargin: bodyMargin,
                        homePagePosterMap: homePagePosterMap,
                        textTheme: textTheme),
                    topPodcasts(),
                    const SizedBox(
                      height: 60,
                    ),
                  ],
                )
              : SizedBox(height: Get.height, child: loading()),
        ),
      ),
    );
  }

  Widget topVisited() {
    return SizedBox(
      height: size.height / 3.5,
      child: Obx(
        () => ListView.builder(
          itemCount: homeScreenController.topVisitedList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            //Blog Item
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 12),
                  child:
                      //Blog List
                      SizedBox(
                    height: size.height / 4.5,
                    width: size.width / 2.5,
                    child: Stack(children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                          image: DecorationImage(
                              image: NetworkImage(homeScreenController
                                  .topVisitedList[index].image),
                              fit: BoxFit.cover),
                        ),
                        foregroundDecoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          gradient: LinearGradient(
                              colors: GradiantColors.blogPost,
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        bottom: 8,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              homeScreenController.topVisitedList[index].author,
                              style: textTheme.subtitle1,
                            ),
                            Row(
                              children: [
                                Text(
                                  homeScreenController
                                      .topVisitedList[index].view,
                                  style: textTheme.subtitle1,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Icon(
                                  Icons.remove_red_eye_sharp,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
                SizedBox(
                    width: size.width / 2.4,
                    child: Text(
                      homeScreenController.topVisitedList[index].title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    )),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget topPodcasts() {
    return SizedBox(
      height: size.height / 3.5,
      child: Obx(
        () => ListView.builder(
          itemCount: homeScreenController.topPodcast.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            //Blog Item
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(NamedRoutes.routeSinglePodcast,
                        arguments: homeScreenController.topPodcast[index]);
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.only(right: index == 0 ? bodyMargin : 12),
                    child:
                        //Blog List
                        SizedBox(
                      height: size.height / 5.3,
                      width: size.width / 2.4,
                      child: Stack(children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                                image: NetworkImage(homeScreenController
                                    .topPodcast[index].poster),
                                fit: BoxFit.cover),
                          ),
                          foregroundDecoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            gradient: LinearGradient(
                                colors: GradiantColors.blogPost,
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          bottom: 8,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                homeScreenController
                                    .topPodcast[index].publisher,
                                style: textTheme.subtitle1,
                              ),
                              Row(
                                children: [
                                  Text(
                                    homeScreenController.topPodcast[index].view,
                                    style: textTheme.subtitle1,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Icon(
                                    Icons.remove_red_eye_sharp,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
                SizedBox(
                    width: size.width / 2.4,
                    child: Text(
                      homeScreenController.topPodcast[index].title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    )),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget poster() {
    return Stack(
      children: [
        Container(
          width: size.width / 1.3,
          height: size.height / 4.2,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            image: DecorationImage(
                // Can not assign Image.asset to DecorationImage, we have to use ".image" after it.
                image:
                    Image.asset(homeScreenController.poster.value.image!).image,
                // Fit picture to the box to have rounded image box.
                fit: BoxFit.cover),
          ),
          foregroundDecoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            gradient: LinearGradient(
                colors: GradiantColors.homePosterCoverGradiant,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 8,
          right: 0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    homePagePosterMap['writer'] +
                        " . " +
                        homePagePosterMap['date'],
                    style: textTheme.subtitle1,
                  ),
                  Row(
                    children: [
                      Text(
                        homePagePosterMap['view'],
                        style: textTheme.subtitle1,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.remove_red_eye_sharp,
                        color: Colors.white,
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                homeScreenController.poster.value.title!,
                style: textTheme.headline1,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget tagsList() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tagList.length,
          itemBuilder: ((context, index) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 10),
                  child: MainTags(textTheme: textTheme),
                ),
              ],
            );
          })),
    );
  }
}

class SeeMorePodcast extends StatelessWidget {
  const SeeMorePodcast({
    Key? key,
    required this.bodyMargin,
    required this.homePagePosterMap,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  // ignore: prefer_typing_uninitialized_variables
  final homePagePosterMap;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, bodyMargin, 10),
      child: Row(
        children: [
          ImageIcon(
            Image.asset(homePagePosterMap['penUrl']).image,
            color: SolidColors.seeMore,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            MyStrings.viewHotesPodcasts,
            style: textTheme.headline3,
          ),
        ],
      ),
    );
  }
}

class SeeMoreBlog extends StatelessWidget {
  const SeeMoreBlog({
    Key? key,
    required this.bodyMargin,
    required this.homePagePosterMap,
    required this.textTheme,
    required String title,
  }) : super(key: key);

  final double bodyMargin;
  // ignore: prefer_typing_uninitialized_variables
  final homePagePosterMap;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, bodyMargin, 10),
      child: Row(
        children: [
          ImageIcon(
            Image.asset(homePagePosterMap['penUrl']).image,
            color: SolidColors.seeMore,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            MyStrings.viewHotesBlog,
            style: textTheme.headline3,
          ),
        ],
      ),
    );
  }
}
