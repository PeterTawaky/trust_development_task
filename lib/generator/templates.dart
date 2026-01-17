final Map<String, String> templates = {
  //! App Assets
  'app_assets.dart': '''
class AppAssets {
  AppAssets._();  //private constructor
  
}
''',
  //! App Colors
  'app_colors.dart': '''
import 'dart:ui';
import 'package:flutter/material.dart';
class AppColors {
 AppColors._();
 
 static const Color primaryColor = Color(0xFFC49E85);

 static const LinearGradient primaryGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF00D9FF), Color(0xFF0EA5E9)],
 );

 static Color getRandomColor(int index) {
  return randomColors[index % randomColors.length];
 }  

 static Color withOpacity(Color color, double opacity) {
 return color.withValues(alpha: opacity);
 }
 
 static LinearGradient createGradient({
 required Color startColor,
 required Color endColor,
 Alignment begin = Alignment.topLeft,
 Alignment end = Alignment.bottomRight,
 }) {
 return LinearGradient(
 begin: begin,
 end: end,
 colors: [startColor, endColor],
 );
 }
 
 static const List<Color> randomColors = [
 Color(0xFF00D9FF), // Cyan - Primary data series
 Color(0xFF10B981), // Green - Success/positive values
 Color(0xFFF59E0B), // Amber - Warning/neutral values
 Color(0xFFEF4444), // Red - Error/negative values
 ];
}
''',
  //! App Strings
  'app_strings.dart': '''
class AppStrings {
  AppStrings._();
 
}
//! App Logger
''',
  'app_logger.dart': '''
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AppLogger {
  static var logger = Logger();

  static void trace(String message) {
    if (kDebugMode) {
      logger.t(message);
    }
  }

  static void debug(String message) {
    if (kDebugMode) {
      logger.d(message);
    }
  }

  static void info(String message) {
    if (kDebugMode) {
      logger.i(message);
    }
  }

  static void error(String message) {
    if (kDebugMode) {
      logger.e(message);
    }
  }
}
''',
  //! App Shadows
  'app_shadows.dart': '''
class AppShadows {
// Box shadows file
  const AppShadows._();
}
''',
  //! Context Extensions
  'context_extensions.dart': '''
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension SizeLayoutExtension on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;

  double get blockWidth => screenWidth / 100; //1% of screen width
  double get blockHeight => screenHeight / 100; //1% of screen height

  bool get isMobileSize => screenWidth < 600;
  bool get isTabletSize => screenWidth >= 600 && screenWidth < 1024;
  bool get isDesktopSize => screenWidth >= 1024;

  double get statusBarHeight => MediaQuery.of(this).padding.top;

  bool get isLandscapeOrientation =>
      MediaQuery.of(this).orientation == Orientation.landscape;

  Orientation get deviceOrientation => MediaQuery.of(this).orientation;

  /// True when device orientation is portrait.
  bool get isPortraitOrientation =>
      MediaQuery.of(this).orientation == Orientation.portrait;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  bool get isDartk => theme.brightness == Brightness.dark;
}

/// System UI (status/nav bars) helpers
extension DeviceUtility on BuildContext {
  get hideKeyboard => FocusManager.instance.primaryFocus?.unfocus();

  Future<void> setStatusBarColor(
    Color color, {
    Brightness? iconBrightness,
  }) async {
    final inferred =
        ThemeData.estimateBrightnessForColor(color) == Brightness.dark
            ? Brightness.light
            : Brightness.dark;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: color,
        statusBarIconBrightness: iconBrightness ?? inferred, // Android
        statusBarBrightness: iconBrightness ?? inferred, // iOS
      ),
    );
  }

  /// Hide both status & navigation bars (sticky immersive).
  Future<void> hideStatusBarAndNavigationBar() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  /// Hide only the status bar (keep bottom/nav bar visible).
  Future<void> get hideStatusBar async =>
      await SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: const [SystemUiOverlay.bottom],
      );

  /// Full screen (hide all system overlays).
  get setFullScreen async => await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: const [],
  );

  /// Show only the status bar (top).
  get showStatusBar async => await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: const [SystemUiOverlay.top],
  );

  /// Show both status & navigation bars.
  get showSystemBars async => await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: SystemUiOverlay.values,
  );

  Future<void> lockOrientations(List<DeviceOrientation>? orientations) async {
    orientations ??= [DeviceOrientation.portraitUp];
    await SystemChrome.setPreferredOrientations(orientations);
  }

  /// Vibrate one or more times with a gap in between.
  Future<void> vibrate({
    int count = 1,
    Duration gap = const Duration(milliseconds: 60),
  }) async {
    for (var i = 0; i < count; i++) {
      await HapticFeedback.vibrate();
      if (i < count - 1) {
        await Future.delayed(gap);
      }
    }
  }
}

extension PlatformExtension on BuildContext {
  bool get isWebPlatform => kIsWeb;
  bool get isDesktopPlatform =>
      !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.windows ||
          defaultTargetPlatform == TargetPlatform.linux ||
          defaultTargetPlatform == TargetPlatform.macOS);

  /// True on mobile targets (Android/iOS), not web.
  bool get isMobile =>
      !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.android ||
          defaultTargetPlatform == TargetPlatform.iOS);

  /// Per-OS helpers (non-web)
  bool get isWindows =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.windows;
  bool get isLinux => !kIsWeb && defaultTargetPlatform == TargetPlatform.linux;
  bool get isMacOS => !kIsWeb && defaultTargetPlatform == TargetPlatform.macOS;
  bool get isAndroid =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.android;
  bool get isIOS => !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;
}

/// Connectivity (same heuristic as your original)
extension ConnectivityExtension on BuildContext {
  Future<bool> get hasInternetConnection async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result.first.rawAddress.isNotEmpty;
    } on SocketException {
      return false;
    }
  }
}

''',
  //! App Bloc Observer
  'app_bloc_observer': ''' 
import 'package:bloc/bloc.dart';
import 'package:template_project/core/constants/app_logger.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    AppLogger.trace('onCreate -- \${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    AppLogger.trace('onChange -- \${bloc.runtimeType}, \$change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    AppLogger.trace('onError -- \${bloc.runtimeType}, \$error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    AppLogger.trace('onClose -- \${bloc.runtimeType}');
  }
}

''',
  //! App Durations
  'app_durations.dart': '''
class AppDurations {
  AppDurations._();
  static const Duration t250 = Duration(milliseconds: 250);
  static const Duration t500 = Duration(milliseconds: 500);
  static const Duration t750 = Duration(milliseconds: 750);
  static const Duration t1000 = Duration(milliseconds: 1000);
}

''',
  //! App Dimensions
  'app_dimensions.dart': '''
class AppDimensions {
  const AppDimensions._();
}

''',
};
