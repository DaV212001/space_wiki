import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:space_wiki/constants/app_constants.dart';
import 'package:space_wiki/screens/main_layout_screen.dart';
import 'package:space_wiki/screens/sign_up.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<Widget> futureCall() async {
    var supabase = Supabase.instance.client;

    bool isFirstLaunch = supabase.auth.currentUser == null;

    return isFirstLaunch
        ? Future.value(const SignUpWidget())
        : Future.value(const MainLayoutScreen());
  }

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(KDefImageJ),
      logoWidth: 200,
      title: null,
      showLoader: false,
      loadingText: Text("Loading...",
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
          )),
      futureNavigator: futureCall(),
      durationInSeconds: 0,
    );
  }
}
