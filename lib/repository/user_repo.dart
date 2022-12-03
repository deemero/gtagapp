import 'dart:developer';

import 'package:flutter/foundation.dart';
// import 'package:gtag_app/response/res_get_user.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../response/res_get_user.dart';

class UserRepo {
  Future<ResGetUser?> getUser({String? page}) async {
    try {
      // NOTE : GET request with query parameter
      var url = Uri.http("reqres.in", "/api/users", {"page": page});
      Response res = await http.get(url);
      return resGetUserFromJson(res.body);
    } catch (e, st) {
      if (kDebugMode) {
        log(st.toString());
      }
      log("error get user repo : $e");
    }
    return null;
  }
}
