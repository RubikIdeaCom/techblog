import 'package:flutter/material.dart';
import 'package:tec/models/fake_data.dart';
import 'package:tec/my_colors.dart';

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

class MainTags extends StatelessWidget {
  MainTags({
    Key? key,
    required this.index,
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
            Text(tagList[index].title, style: textTheme.headline2),
          ],
        ),
      ),
    );
  }
}
