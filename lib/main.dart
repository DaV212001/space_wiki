import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:space_wiki/configs/constants.dart';
import 'package:space_wiki/screens/home_screen.dart';
import 'package:space_wiki/screens/main_layout_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'configs/config_preference.dart';
import 'constants/theme_constants.dart';
import 'controllers/theme_controller.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: Assets.supabase_url,
    anonKey: Assets.anon_key,
  );
  // init shared preference
  await ConfigPreference.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: appTheme(context, isDark: true),
      darkTheme: appTheme(context, isDark: true),
      themeMode: ThemeController.getThemeMode(),
      home:  MainLayoutScreen(),
    );
  }
}
