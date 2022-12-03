// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:flutter/material.dart';
// import 'package:gtag_app/repository/auth_repo.dart';
import 'package:gtagapp/repository/auth_repo.dart';

// import 'package:gtag_app/response/res_2login.dart';
import 'package:gtagapp/response/res_login.dart';

// import 'package:gtag_app/screen/homepage.dart';
import 'package:gtagapp/screen/main_menu.dart';

// import 'package:gtag_app/utils/nav_utils.dart';
import 'package:gtagapp/utils/nav_utls.dart';

// import 'package:gtag_app/utils/notifications_utils.dart';
import 'package:gtagapp/utils/nofications_utils.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = false;
  final AuthRepo _repo = AuthRepo();
  ResLogin? dataLogin;

  Future<void> login(BuildContext context,
      {required String email, required String password}) async {
    try {
      isLoading = true;
      notifyListeners();

      ResLogin? res = await _repo.userLogin(email, password);

      if (res!.status = true) {
        dataLogin = res;
        log(dataLogin!.status.toString());
        isLoading = false;
        notifyListeners();
        NotificationUtils.showSnackbar(context,
            message: "Login Successful", color: Colors.blue);
        Nav.toAll(context, page: MainMenuPage());
      } else {
        log(res.status.toString());
        isLoading = false;
        notifyListeners();
        NotificationUtils.showSnackbar(context,
            message: "Failed to Login", color: Colors.red);
      }
    } catch (e) {
      log(e.toString());
      isLoading = false;
      notifyListeners();
      NotificationUtils.showSnackbar(context,
          message: "Unknown Error?", color: Colors.deepPurple);
    }
  }
}
