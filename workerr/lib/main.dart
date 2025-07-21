import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workerr_app/core/colors.dart';
import 'package:workerr_app/presentation/admin/screens/admin_main_screen.dart';
import 'package:workerr_app/presentation/admin/authentication/admin_login.dart';
import 'package:workerr_app/presentation/user/screens/authentication/login.dart';
import 'package:workerr_app/presentation/user/screens/authentication/reg2.dart';
import 'package:workerr_app/presentation/user/screens/screen_main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.remove();
  await Firebase.initializeApp();
  
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');

  runApp(
    MaterialApp(
      title: 'Workerr',
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        scaffoldBackgroundColor: kc60,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black), // Updated
          bodyMedium: TextStyle(color: Colors.black), // Updated
        ),
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: kc60,
        primarySwatch: Colors.teal,
        // Removed backgroundColor, use scaffoldBackgroundColor instead
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white), // Updated
          bodyMedium: TextStyle(color: Colors.white), // Updated
        ),
      ),
      home: email == null ? const Login() : const ScreenMain(),
      routes: {
        'login': (ctx) => const Login(),
        'register': (ctx) => const Register2(),
        'adminLogin': (ctx) => const AdminLoginScreen(),
        'main': (ctx) => const ScreenMain(),
        'adminMain': (ctx) => const AdminScreenMain(),
      },
      debugShowCheckedModeBanner: false,
    ),
  );
}

Future initialization(BuildContext? context) async {
  // Your initialization code, if any
}
