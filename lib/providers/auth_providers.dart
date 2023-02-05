import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';
import '../utils/custom_exception.dart';

class AuthProvider with ChangeNotifier {
  String _authToken;
  String _userId;
  DateTime _expireIn;
  Timer _timer;

  bool get isAuthenticated {
    return _authToken != null;
  }

  String get authToken {
    if (_authToken != null && _expireIn != null && _expireIn.isAfter(DateTime.now())) {
      return _authToken;
    }
    return null;
  }

  String get userId {
    return _userId;
  }

  Future<void> _authenticate(String emailAddress, String password, String url) async {
    try {
      final response = await http.post(url,
          body: json.encode({
            'email': emailAddress,
            'password': password,
            'returnSecureToken': true,
          }));

      var responseBody = json.decode(response.body);
      print(responseBody);
      if (responseBody['error'] != null) {
        throw CustomException(responseBody['error']['message']);
      }

      _authToken = responseBody['idToken'];
      _userId = responseBody['localId'];
      _expireIn = DateTime.now().add(Duration(seconds: int.parse(responseBody['expiresIn'])));

      Constants.authToken = _authToken;
      Constants.userId = _userId;

      _autoLogout();
      notifyListeners();

      final pref = await SharedPreferences.getInstance();
      final userData = json.encode({
        'token': _authToken,
        'userId': _userId,
        'expireIn': _expireIn.toIso8601String(),
      });

      pref.setString('userData', userData);
      print(pref.getString('userData'));
    } catch (error) {
      throw error;
    }
  }

  Future<void> login(String emailAddress, String password) async {
    return _authenticate(emailAddress, password, Constants.AUTH_SIGNIN);
  }

  Future<void> signUp(String emailAddress, String password) async {
    return _authenticate(emailAddress, password, Constants.AUTH_SIGNUP);
  }

  Future<void> logout() async {
    _userId = null;
    _authToken = null;
    _expireIn = null;
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
    final pref = await SharedPreferences.getInstance();
    pref.clear();
    notifyListeners();
  }

  void _autoLogout() {
    if (_timer != null) {
      _timer.cancel();
    }
    final expireDate = _expireIn.difference(DateTime.now()).inSeconds;
    print('expireDate : $expireDate');
    _timer = Timer(Duration(seconds: expireDate), logout);
  }

  Future<bool> autoLogin() async {
    final pref = await SharedPreferences.getInstance();

    if (!pref.containsKey('userData')) {
      return false;
    }

    final userData = json.decode(pref.getString('userData')) as Map<String, Object>;
    final expireIn = DateTime.parse(userData['expireIn']);

    if (expireIn.isBefore(DateTime.now())) {
      return false;
    }

    _expireIn = expireIn;
    _authToken = userData['token'];
    _userId = userData['userId'];

    Constants.authToken = _authToken;
    Constants.userId = _userId;

    _autoLogout();
    notifyListeners();
    return true;
  }
}
