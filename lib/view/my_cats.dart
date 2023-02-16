import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tec/constants/my_colors.dart';
import 'package:tec/component/my_components.dart';
import 'package:tec/constants/my_strings.dart';
import 'package:tec/models/fake_data.dart';

class MyCats extends StatefulWidget {
  const MyCats({super.key});

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    // Get an instance of font styles of main.dart
    var textTheme = Theme.of(context).textTheme;

    // Get an instance of screen size
    var size = MediaQuery.of(context).size;

    // Margin
    double bodyMargin = size.width / 10;

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.fromLTRB(bodyMargin, 0, bodyMargin, bodyMargin),
          child: Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              SvgPicture.asset(
                "assets/images/techbot.svg",
                height: 100,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                MyStrings.successFulRegistration,
                style: textTheme.headline4,
              ),
              TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    alignLabelWithHint: true,
                    hintText: "نام و نام خانوادگی",
                    hintStyle: textTheme.headline4),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                MyStrings.selectYourFavoriteCats,
                style: textTheme.headline4,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
                child: SizedBox(
                  width: double.infinity,
                  child: SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: GridView.builder(
                        itemCount: tagList.length,
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                crossAxisCount: 2,
                                childAspectRatio: 0.3),
                        itemBuilder: ((context, index) {
                          return InkWell(
                              onTap: (() {
                                if (selectedTags.contains(tagList[index]) ==
                                    false) {
                                  selectedTags.add(tagList[index]);
                                }
                              }),
                              child: MainTags(
                                textTheme: textTheme,
                              ));
                        })),
                  ),
                ),
              ),
              Image.asset(
                "assets/icons/curve_arrow.png",
                height: size.height / 13.6,
              ),
              // Selected tags:
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
                child: SizedBox(
                  width: double.infinity,
                  child: SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: GridView.builder(
                        itemCount: selectedTags.length,
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                crossAxisCount: 2,
                                childAspectRatio: 0.3),
                        itemBuilder: ((context, index) {
                          return Container(
                            height: 60,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24)),
                              color: SolidColors.surfaceColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedTags
                                            .remove(selectedTags[index]);
                                      });
                                    },
                                    child: const Icon(CupertinoIcons.delete,
                                        color: Colors.grey),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(selectedTags[index].title,
                                      style: textTheme.headline4),
                                ],
                              ),
                            ),
                          );
                        })),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
