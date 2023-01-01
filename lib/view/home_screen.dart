import 'package:flutter/material.dart';
import 'package:tec/component/my_colors.dart';
import 'package:tec/component/my_components.dart';
import 'package:tec/component/my_strings.dart';
import 'package:tec/models/data_models.dart';
import 'package:tec/models/fake_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Column(
          children: [
            HomePagePoster(
                size: size,
                homePagePosterMap: homePagePosterMap,
                textTheme: textTheme),
            const SizedBox(
              height: 16,
            ),
            // Tag list
            HomePageTagList(
                bodyMargin: bodyMargin,
                homePagePosterMap: homePagePosterMap,
                textTheme: textTheme),
            const SizedBox(
              height: 32,
            ),
            SeeMoreBlog(
                bodyMargin: bodyMargin,
                homePagePosterMap: homePagePosterMap,
                textTheme: textTheme),
            HomePageBlogList(
                size: size,
                blogList: blogList,
                bodyMargin: bodyMargin,
                textTheme: textTheme),
            const SizedBox(
              height: 32,
            ),
            SeeMorePodcast(
                bodyMargin: bodyMargin,
                homePagePosterMap: homePagePosterMap,
                textTheme: textTheme),
            HomePagePodcastList(
                size: size,
                blogList: blogList,
                bodyMargin: bodyMargin,
                textTheme: textTheme),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}

class HomePagePodcastList extends StatelessWidget {
  HomePagePodcastList({
    Key? key,
    required this.size,
    required this.blogList,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  List<BlogModel> blogList;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        itemCount: blogList
            .getRange(0, blogList.length > 5 ? 5 : blogList.length)
            .length,
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
                            image: NetworkImage(blogList[index].imageUrl),
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
                            blogList[index].writer,
                            style: textTheme.subtitle1,
                          ),
                          Row(
                            children: [
                              Text(
                                blogList[index].views,
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
                    blogList[index].title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  )),
            ],
          );
        },
      ),
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

class HomePageBlogList extends StatelessWidget {
  const HomePageBlogList({
    Key? key,
    required this.size,
    required this.blogList,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final blogList;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        itemCount: blogList
            .getRange(0, blogList.length > 5 ? 5 : blogList.length)
            .length,
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
                            image: NetworkImage(blogList[index].imageUrl),
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
                            blogList[index].writer,
                            style: textTheme.subtitle1,
                          ),
                          Row(
                            children: [
                              Text(
                                blogList[index].views,
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
                    blogList[index].title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  )),
            ],
          );
        },
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
  }) : super(key: key);

  final double bodyMargin;
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

class HomePageTagList extends StatelessWidget {
  const HomePageTagList({
    Key? key,
    required this.bodyMargin,
    required this.homePagePosterMap,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final homePagePosterMap;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
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
                  child: MainTags(index: index, textTheme: textTheme),
                ),
              ],
            );
          })),
    );
  }
}

class HomePagePoster extends StatelessWidget {
  const HomePagePoster({
    Key? key,
    required this.size,
    required this.homePagePosterMap,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final homePagePosterMap;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width / 1.3,
          height: size.height / 4.2,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            image: DecorationImage(
                // Can not assign Image.asset to DecorationImage, we have to use ".image" after it.
                image: Image.asset(homePagePosterMap['imageUrl']).image,
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
                homePagePosterMap['title'],
                style: textTheme.headline1,
              ),
            ],
          ),
        )
      ],
    );
  }
}
