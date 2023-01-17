import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import 'package:tec/component/my_colors.dart';
import 'package:tec/component/my_components.dart';
import 'package:tec/component/my_strings.dart';
import 'package:tec/controller/register_controller.dart';
import 'package:tec/models/fake_data.dart';
import 'package:tec/view/main_screen/home_screen.dart';
import 'package:tec/view/main_screen/profile_screen.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  RxInt selectedPageIndex = 0.obs;

  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get an instance of font styles of main.dart
    var textTheme = Theme.of(context).textTheme;

    // Get an instance of screen size
    var size = MediaQuery.of(context).size;

    // Margin from right
    double bodyMargin = size.width / 10;

    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: SolidColors.scafoldBg,
          child: Padding(
            padding: EdgeInsets.fromLTRB(bodyMargin, 0, bodyMargin, 0),
            child: ListView(
              children: [
                DrawerHeader(
                    child: Center(
                  child: Image.asset(
                    "assets/images/splash-screen.png",
                    scale: 3,
                  ),
                )),
                ListTile(
                  onTap: () {},
                  title: Text(
                    "پروفایل کاربر",
                    style: textTheme.headline4,
                  ),
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                ),
                ListTile(
                  onTap: () {},
                  title: Text(
                    "درباره تک بلاگ",
                    style: textTheme.headline4,
                  ),
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                ),
                ListTile(
                  onTap: () async {
                    await Share.share(MyStrings.shareText);
                  },
                  title: Text(
                    "اشتراک گذاری تک بلاگ",
                    style: textTheme.headline4,
                  ),
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                ),
                ListTile(
                  onTap: () {
                    myLaunchUrl(MyStrings.techblogGithubUrl);
                  },
                  title: Text(
                    "تک بلاگ در گیت هاب",
                    style: textTheme.headline4,
                  ),
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                ),
              ],
            ),
          ),
        ),
        appBar: // Custom App bar
            AppBar(
          automaticallyImplyLeading: false, // Remove flutter exclusive drawer
          elevation: 0,
          backgroundColor: SolidColors.scafoldBg,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  _key.currentState!.openDrawer();
                },
                child: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
              // Create a responsive Logo
              Image.asset(
                "assets/images/splash-screen.png",
                height: size.height / 13.6,
              ),
              const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ],
          ),
        ),
        body: Stack(children: [
          Positioned.fill(
              child: Obx(() => IndexedStack(
                    index: selectedPageIndex.value,
                    children: [
                      HomeScreen(
                          size: size,
                          textTheme: textTheme,
                          bodyMargin: bodyMargin),
                      ProfileScreen(
                          size: size,
                          textTheme: textTheme,
                          bodyMargin: bodyMargin),
                    ],
                  ))),
          BottomNavigation(
            bodyMargin: bodyMargin,
            size: size,
            changeScreen: (int value) {
              selectedPageIndex.value = value;
            },
          ),
        ]),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  BottomNavigation({
    Key? key,
    required this.bodyMargin,
    required this.size,
    required this.changeScreen,
  }) : super(key: key);

  final double bodyMargin;
  final Size size;

  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 8,
      right: 0,
      left: 0,
      child: Padding(
        padding: EdgeInsets.fromLTRB(bodyMargin, 0, bodyMargin, 0),
        child: Container(
          height: size.height / 10,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: GradiantColors.bottomNavBg,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Container(
            height: size.height / 12,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                gradient: LinearGradient(
                    colors: GradiantColors.bottomNav,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: (() => changeScreen(0)),
                    icon:
                        ImageIcon(Image.asset(homePagePosterMap['home']).image),
                    color: Colors.white),
                IconButton(
                    onPressed: (() {
                      Get.find<RegisterController>().toggleLogin();
                    }),
                    icon: ImageIcon(
                        Image.asset(homePagePosterMap['write']).image),
                    color: Colors.white),
                IconButton(
                  onPressed: (() => changeScreen(1)),
                  icon: ImageIcon(Image.asset(homePagePosterMap['user']).image),
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
