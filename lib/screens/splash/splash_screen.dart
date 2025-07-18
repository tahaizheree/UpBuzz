import 'package:flutter/material.dart';
import 'package:upalerts/appAssets/assets.dart';
import 'package:upalerts/routes/routes.dart';
import 'package:upalerts/firebase_auth/auth.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    moveToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(child: Image.asset(Assets.splashBackground)),
          Center(
            child: Image.asset(Assets.companyLogo),
          )
        ],
      ),
    );
  }

  void moveToNextScreen() {
    if(Auth().currentUser!=null){
      Future.delayed(const Duration(seconds:3),(){
          router.go(Routes.onDashboard);
      });
    }
    else{
    Future.delayed(const Duration(seconds: 3), () {
      router.go(Routes.onBoardingRoute);
    });
    }
  }
}
