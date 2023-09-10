import 'dart:async';

import 'package:flutter/material.dart';
import 'login_page.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  String? logo, color, appname;
  late Animation _logoAnimation;
  late AnimationController _logoController;

  @override
  void initState() {

    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _logoAnimation = CurvedAnimation(
      parent: _logoController,
      curve: Curves.fastOutSlowIn,
    );

    _logoAnimation.addListener(() {
      if (_logoAnimation.status == AnimationStatus.completed) {
        return;
      }
      setState(() {});
    });

    _logoController.forward();
    super.initState();
    startTime();
  }


  @override
  void dispose() {
    _logoController.dispose();
    super.dispose();
  }

  Widget _buildLogo() {
    return Center(
      child: SizedBox(
        // color:const Color(0xff138fb4),
        height: _logoAnimation.value * 250.0,
        width: _logoAnimation.value * 250.0,
        // child: Image.asset(
        //   "assets/images/bhadapay.png",
        //   fit: BoxFit.fitWidth,
        // ),
        child: logo != null
            ? Image.network(logo!)
            : Image.asset(
          "assets/images/logo.png",
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }


  Future<void> navigationPage(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
  // startTime() async {
  //   var _duration = const Duration(seconds: 3);
  //  return Timer(_duration, navigationPage(context));
  // }

  startTime() async {
    var _duration = const Duration(seconds: 3);
    return Timer(_duration, () {
      navigationPage(context); // Uncomment this line to navigate to LoginPage
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildLogo(),
    );
  }
}
