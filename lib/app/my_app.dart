import 'package:flutter/material.dart';
import 'package:trust_development_task/core/routes/router_generator.dart';
import 'package:trust_development_task/core/utils/app_themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Doshka Burger',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.light,
      routerConfig: RouterGenerator.mainRouting,
    );
  }
}
