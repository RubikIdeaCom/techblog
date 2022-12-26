import 'package:flutter/material.dart';
import 'package:tec/models/fake_data.dart';
import 'package:tec/my_colors.dart';
import 'package:tec/view/profile_screen.dart';

import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey();

class _MainScreenState extends State<MainScreen> {
  var selectedPageIndex = 0;

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
                  onTap: () {},
                  title: Text(
                    "اشتراک گذاری تک بلاگ",
                    style: textTheme.headline4,
                  ),
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                ),
                ListTile(
                  onTap: () {},
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
              child: IndexedStack(
            index: selectedPageIndex,
            children: [
              HomeScreen(
                  size: size, textTheme: textTheme, bodyMargin: bodyMargin),
              ProfileScreen(
                  size: size, textTheme: textTheme, bodyMargin: bodyMargin),
            ],
          )),
          BottomNavigation(
            bodyMargin: bodyMargin,
            size: size,
            changeScreen: (int value) {
              setState(() {
                selectedPageIndex = value;
              });
            },
          ),
        ]),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
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
                    onPressed: (() => changeScreen(2)),
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
