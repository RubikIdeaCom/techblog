import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:tec/component/my_colors.dart';
import 'package:tec/component/text_style.dart';
import 'package:tec/controller/home_screen_controller.dart';
import 'package:tec/models/fake_data.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.5,
      color: SolidColors.dividerColor,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}

// ignore: must_be_immutable
class MainTags extends StatelessWidget {
  MainTags({
    Key? key,
    required this.textTheme,
  }) : super(key: key);

  late int index;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          gradient: LinearGradient(
              colors: GradiantColors.tags,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ImageIcon(
              Image.asset(homePagePosterMap['hashtagUrl']).image,
              color: Colors.white,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(Get.find<HomeScreenController>().tagsList[index].title,
                style: textTheme.headline2),
          ],
        ),
      ),
    );
  }
}

void myLaunchUrl(String url) async {
  var uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    log("Could not launch ${uri.toString()}");
  }
}

PreferredSize appBar(String title) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Center(
              child: Text(
                'مقالات جدید',
                style: appBarTextStyle,
              ),
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: SolidColors.primaryColor.withBlue(100),
                shape: BoxShape.circle),
            child: const Icon(Icons.keyboard_arrow_right_rounded),
          ),
        ),
      ),
    ),
  );
}

SpinKitFadingCube loading() {
  return const SpinKitFadingCube(
    color: SolidColors.primaryColor,
    size: 32,
  );
}
