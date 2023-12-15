
import 'package:accessment/config/app_theme.dart';
import 'package:accessment/src/config.dart';
import 'package:accessment/view/screens/splash_screen.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const ProviderScope(child: MyApp())));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var themeProvider = ref.watch(themeViewModel);
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        // designSize:  Size(WidgetsBinding.instance.window.physicalSize.width/3, WidgetsBinding.instance.window.physicalSize.height/3),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            builder: BotToastInit(),
            title: AppStrings.appName,
            themeMode: themeProvider.themeMode,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            debugShowCheckedModeBanner: false,
            navigatorObservers: [BotToastNavigatorObserver()],
            home: child,

            ///home: ,
          );
        },
        child: const SplashScreen());
  }
}
