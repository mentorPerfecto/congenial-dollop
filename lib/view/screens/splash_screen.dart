import 'dart:async';

import 'package:accessment/src/components.dart';
import 'package:accessment/src/packages.dart';
import 'package:accessment/src/screens.dart';
import 'package:accessment/src/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/app_images.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  startTimeout() => Timer(const Duration(seconds: 1), handleTimeout);

  void handleTimeout() => changeScreen();

  Future<void> changeScreen() async {
    Navigator.pushReplacement(context, FadeRoute(page: const HomeScreen()));
    //Show status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).canvasColor),
      child: Center(
          child: ImageView.svg(AppImages.icLogo,
              color: Theme.of(context).iconTheme.color,
              width: 150.sp,
              fit: BoxFit.fitWidth)),
    );
  }
}
