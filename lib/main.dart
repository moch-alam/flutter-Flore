import 'package:firebase_auth/firebase_auth.dart';
import 'package:flores/app/modules/login/controllers/login_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flores/app/widgets/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/utils/loading.dart';

class MyApp extends StatelessWidget {
  final authC = Get.put(LoginController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 5)), // Delay for 5 seconds
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return splashscreen(); // You need to define your splash screen widget
        } else {
          return StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(), // Using Firebase onAuthStateChanged
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                User? user = snapshot.data;
                print(snapshot);
                return GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: "Application",
                  initialRoute: user != null && user.emailVerified == true
                      ? Routes.HOME
                      : Routes.LOGIN,
                  getPages: AppPages.routes,
                  theme: ThemeData(
                    primarySwatch: Colors.indigo,
                  ),
                );
              }
              return LoadingView();
            },
          );
        }
      },
    );
  }
}
