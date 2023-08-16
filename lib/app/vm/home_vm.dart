import 'package:flutter/cupertino.dart';
import 'package:opticash/app/models/signin_response.dart';
import 'package:opticash/app/routes/routes.dart';
import 'package:opticash/app/vm/base_vm.dart';
import '../../main.dart';
import '../enum/viewstate.dart';
import '../services/storage_service.dart';

class UserVM extends BaseVM {
  ViewState _userViewState = ViewState.idle;
  ViewState get userViewState => _userViewState;

  User? _user;
  User? get user => _user;

  setCurrentUser(User? currentUser) {
    _user = currentUser;
  }

  void setUserViewState(ViewState viewState) {
    _userViewState = viewState;
    notifyListeners();
  }

  logout() async {
    try {
      Navigator.pushNamedAndRemoveUntil(navigatorKey.currentContext!,
          AuthOnboardingRoute.sigin, (r) => false);
      StorageService.reset();
    } catch (_) {}
  }
}
