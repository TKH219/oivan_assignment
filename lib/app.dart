import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oivan_assignment/features/get_list_sof_users/page/get_list_sof_users_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.light,
      ),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: GetListSofUsersScreen(),
    );
  }
}
