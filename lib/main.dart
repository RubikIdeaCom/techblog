import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tec/component/my_colors.dart';
import 'package:tec/view/my_cats.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: SolidColors.statusBarColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: SolidColors.systemNavigationBarColor,
      systemNavigationBarIconBrightness: Brightness.dark));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa', ''), // Farsi
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(width: 2),
            ),
            filled: true,
            fillColor: Colors.white),

        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                textStyle: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            // return textTheme.headline1;
            return const TextStyle(fontSize: 18);
          }
          // return textTheme.subtitle1;
          return const TextStyle(
            fontSize: 14,
          );
        }), backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return SolidColors.seeMore;
          }
          return SolidColors.primaryColor;
        }))),
        fontFamily: 'Mahsa',
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontFamily: 'Mahsa',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: SolidColors.posterTitle),
          subtitle1: TextStyle(
              fontFamily: 'Mahsa',
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: SolidColors.posterSubTitle),
          bodyText1: TextStyle(
              fontFamily: 'Mahsa', fontSize: 16, fontWeight: FontWeight.w300),
          headline2: TextStyle(
              fontFamily: 'Mahsa',
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w300),
          headline3: TextStyle(
              fontFamily: 'Mahsa',
              fontSize: 16,
              color: SolidColors.seeMore,
              fontWeight: FontWeight.w300),
          headline4: TextStyle(
              fontFamily: 'Mahsa',
              fontSize: 16,
              color: Colors.green,
              fontWeight: FontWeight.w700),
          headline5: TextStyle(
              fontFamily: 'Mahsa',
              fontSize: 14,
              color: SolidColors.hintTextColor,
              fontWeight: FontWeight.w700),
        ),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      // home: const SplashScreen(),
      home: const MyCats(),
    );
  }
}
