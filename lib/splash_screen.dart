import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_poc/login.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation animation;
  late Animation<double> textAnimation;
  var twoDots=true;
  var firstText = false;
  var secondText = false;
  var car = false;
  
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
      lowerBound: 0,
      upperBound: 550,

    );
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller.forward();
    controller.addListener(() {
      setState(() {
        controller.value;
      });
    });

    // Add a delay using Future.delayed for tow dots
    Future.delayed(const Duration(seconds: 2), () {
      // Navigate to the next screen after 2 seconds
      setState(() {
        twoDots = false;
        firstText = true;
      });
    });
    Future.delayed(const Duration(seconds: 5), () {
      // Navigate to the next screen after 2 seconds
      setState(() {
        firstText = false;
        car = true;
      });
    });
    Future.delayed(const Duration(seconds: 7), () {
      // Navigate to the next screen after 2 seconds
      setState(() {
        secondText = true;
      });

    });
    Future.delayed(const Duration(seconds: 8, microseconds: 500), () {
      // Navigate to the next screen after 2 second
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Login(),
        ),
      );
    });


    // Text falling animation
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        firstText?Center(child: AnimatedTextKit( totalRepeatCount:1,animatedTexts: [
          TyperAnimatedText("Welcome to Jeet's app",textStyle: const TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
            speed: const Duration(milliseconds: 100), )
        ]),):const Text(''),
        twoDots?Center(
        child: LoadingAnimationWidget.staggeredDotsWave(

          size: 200, color: Colors.white,
        ),
      ):const Text(''),
        car?Hero(
        tag: 'logo',
        child: Container(
          height: controller.value-200<0?0:controller.value-200,
          width: controller.value-200<0?0:controller.value-200,

          // child: Image.network(
          //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHsGzFNwZ2GgPnkrHkEYi4UahGeLHmEMB19g&usqp=CAU',
          //   // width: 200, // specify width as needed
          //   // height: 200, // specify height as needed
          //   // fit: BoxFit.cover, // specify BoxFit as needed
          // ),
          child: Image.asset('assets/images/car1.png'),

        ),
      ):const Text(''),
        secondText?Container(
          alignment: Alignment.center,child: AnimatedTextKit( totalRepeatCount:1,animatedTexts: [
          TyperAnimatedText("Get in",textStyle: const TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,

          ),
            speed: const Duration(milliseconds: 100), )
        ]),):const Text('')
    ]);
  }
}


