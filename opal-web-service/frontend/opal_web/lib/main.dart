import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opal/routes/home.dart';
import 'package:opal/routes/login.dart';
import 'package:opal/routes/signup.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(
    Main(),
  );
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var backgroundColor = Colors.white;
    // var transitionEffect = Transition.noTransition;
    return GetMaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        maxWidth: double.infinity,
        minWidth: 480,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(480, name: MOBILE),
          const ResponsiveBreakpoint.resize(800, name: TABLET),
          const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          const ResponsiveBreakpoint.resize(1920, name: 'XL'),
        ],
        background: Container(
          color: backgroundColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: "zi.wo_ok",
      theme: ThemeData(
        primaryColor: Color(0xffFF4848),
        // fontFamily: "Noto_Sans_KR",
      ),
      // darkTheme: ThemeData.dark(),
      initialRoute: '/login',
      getPages: [
        GetPage(
          name: '/',
          page: () => MyHome(),
          // transition: transitionEffect,
          popGesture: true,
        ),
        GetPage(
          name: '/signup',
          page: () => MySignUp(),
          // transition: transitionEffect,
          popGesture: true,
        ),
        GetPage(
          name: '/login',
          page: () => MyLogin(),
          // transition: transitionEffect,
          popGesture: true,
        ),
      ],
    );
  }
}
