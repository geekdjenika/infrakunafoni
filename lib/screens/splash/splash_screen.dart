import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infrakunafoni/constants.dart';
import 'package:lottie/lottie.dart';

import '../home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("InfraKunafoni".toUpperCase(), style: titregras(background),),
              SizedBox(height: MediaQuery.of(context).size.height / 10,),
              Lottie.asset("assets/json/loading.json", height: MediaQuery.of(context).size.height / 8, width: MediaQuery.of(context).size.width / 4,),
            ],
          ),
        ),
      ),
      duration: 5000,
      nextScreen: const Accueil(),
    );
  }
}
