import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/Internalization/languages.dart';
import 'package:getxdemo/Screens/counter_example.dart';
import 'package:getxdemo/Screens/favourite_app.dart';
import 'package:getxdemo/Screens/home.dart';
import 'package:getxdemo/Screens/image_app.dart';
import 'package:getxdemo/Screens/setting_screen.dart';
import 'package:getxdemo/Screens/switch_notification.dart';

import 'Screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      locale: const Locale("en", "US"),
      fallbackLocale: const Locale("en", "US"),
      translations: Languages(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      //home: Home(),
      getPages: [
        GetPage(
          name: "/",
          page: () => const Home(),
        ),
        GetPage(
          name: "/profile",
          page: () => const ProfileScreen(
            name: 'Muhammad Talha',
          ),
        ),
        GetPage(
          name: "/settings",
          page: () => const SettingScreen(),
        ),
        GetPage(
          name: "/favourite",
          page: () => const FavouriteApp(),
        ),
        GetPage(
          name: "/counter",
          page: () => const CounterApp(),
        ),
        GetPage(
          name: "/switch",
          page: () => const SwitchNotification(),
        ),
        GetPage(name: "/imagePicker", page: () => const ImagePickerApp())
      ],
    );
  }
}
