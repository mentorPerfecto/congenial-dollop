import 'dart:async';

import 'package:accessment/src/packages.dart';
import 'package:accessment/src/screens.dart';
import 'package:accessment/src/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final baseViewModel = ChangeNotifierProvider((ref) => BaseViewModel());

class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  void setViewState(ViewState state) {
    _state = state;
    notifyListeners();
  }

  startTimeout(BuildContext context) async {
    return Timer(const Duration(seconds: 1),
        navigateReplace(context, const HomeScreen()));
  }
}
