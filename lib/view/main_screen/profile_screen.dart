import 'package:flutter/material.dart';
import 'package:tec/constants/my_colors.dart';
import 'package:tec/component/my_components.dart';
import 'package:tec/constants/my_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
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
        padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: Image.asset("assets/images/avatar.png").image,
              height: 100,
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  Image.asset("assets/icons/pen.png").image,
                  color: SolidColors.seeMore,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  MyStrings.imageProfileEdit,
                  style: textTheme.headline3,
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Text(
              MyStrings.imageProfileName,
              style: textTheme.headline4,
            ),
            Text(
              MyStrings.imageProfileEmail,
              style: textTheme.headline4,
            ),
            const SizedBox(
              height: 40,
            ),
            TechDivider(size: size),
            InkWell(
              onTap: () {},
              splashColor: SolidColors.primaryColor,
              child: const SizedBox(
                height: 45,
                child: Center(child: Text(MyStrings.favoriteText)),
              ),
            ),
            TechDivider(size: size),
            InkWell(
              onTap: () {},
              splashColor: SolidColors.primaryColor,
              child: const SizedBox(
                height: 45,
                child: Center(child: Text(MyStrings.favoritePodcast)),
              ),
            ),
            TechDivider(size: size),
            InkWell(
              onTap: () {},
              splashColor: SolidColors.primaryColor,
              child: const SizedBox(
                height: 45,
                child: Center(child: Text(MyStrings.logout)),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
