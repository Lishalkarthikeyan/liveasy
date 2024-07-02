import 'package:flutter/material.dart';
import 'package:liveasy/view/frame.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference extends StatefulWidget {
  const SharedPreference({super.key});

  @override
  State<SharedPreference> createState() => _SharedPreferenceState();
}

class _SharedPreferenceState extends State<SharedPreference> {
  late SharedPreference prefs;

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
  }

  Future<void> initSharedPreferences() async {
    prefs = (await SharedPreferences.getInstance()) as SharedPreference;

    // checkLoginStatus();
  }

  // void checkLoginStatus() {
  //   bool isLoggedIn = prefs.getBool('isLoggedIn') ?? true;
  //
  //   if (isLoggedIn) {
  //     // User is already logged in, navigate to home or another screen
  //     navigateToHome();
  //   }
  // }
  //
  // void saveLoginInfo(String email, String password) {
  //   prefs.setString('email', email);
  //   prefs.setString('password', password);
  //   prefs.setBool('isLoggedIn', false);
  // }
  //
  // void clearLoginInfo() {
  //   prefs.remove('email');
  //   prefs.remove('password');
  //   prefs.remove('isLoggedIn');
  // }

  void navigateToHome() {
    Navigator.pushReplacement(
      context,

      MaterialPageRoute(builder: (context) => FramePage()),

    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}

