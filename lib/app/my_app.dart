import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localingo/localingo.dart';
import 'package:provider/provider.dart';
import 'package:trust_development_task/core/dependencies/service_locator.dart';
import 'package:trust_development_task/core/routes/router_generator.dart';
import 'package:trust_development_task/core/utils/app_themes.dart';
import 'package:trust_development_task/features/cart/presentation/managers/cubit/cart_cubit.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');
  ThemeMode _themeMode = ThemeMode.dark;

  @override
  void initState() {
    super.initState();
    // Set the navigator key in Localingo using the static key from RouterGenerator
    Localingo.setNavigatorKey(RouterGenerator.navigatorKey);
  }

  void _changeLocale(Locale newLocale) {
    setState(() {
      _locale = newLocale;
    });
  }

  void _changeThemeMode(ThemeMode newThemeMode) {
    setState(() {
      _themeMode = newThemeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<CartCubit>()..fetchCartTotalItems(),
        ),
      ],
      child: MultiProvider(
        providers: [
          Provider<Function(Locale)>.value(value: _changeLocale),
          Provider<Locale>.value(value: _locale),
          Provider<Function(ThemeMode)>.value(value: _changeThemeMode),
          Provider<ThemeMode>.value(value: _themeMode),
        ],
        child: MaterialApp.router(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            ...GlobalMaterialLocalizations.delegates,
          ],
          locale: _locale,
          supportedLocales: const [Locale('en'), Locale('ar')],
          title: 'Doshka Burger',
          debugShowCheckedModeBanner: false,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: _themeMode,
          routerConfig: RouterGenerator.mainRouting,
        ),
      ),
    );
  }
}
