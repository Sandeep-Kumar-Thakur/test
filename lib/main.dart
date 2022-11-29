import 'package:flutter/material.dart';
import 'package:team_invite/splash.dart';

import 'constants/color_constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  Map<int, Color> color =
  {
    50:ColorConstants.themeColor.withOpacity(.1),
    100:ColorConstants.themeColor.withOpacity(.2),
    200:ColorConstants.themeColor.withOpacity(.3),
    300:ColorConstants.themeColor.withOpacity(.4),
    400:ColorConstants.themeColor.withOpacity(.5),
    500:ColorConstants.themeColor.withOpacity(.6),
    600:ColorConstants.themeColor.withOpacity(.7),
    700:ColorConstants.themeColor.withOpacity(.8),
    800:ColorConstants.themeColor.withOpacity(.9),
    900:ColorConstants.themeColor.withOpacity(1),
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MaterialColor colorCustom = MaterialColor(0xFF0CABDF, color);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: colorCustom,
        bottomAppBarColor: colorCustom,
        scaffoldBackgroundColor: ColorConstants.backgroundColor,
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor:  ColorConstants.backgroundColor,
        )

        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
      ),
      home: Splash(),
    );
  }
}


