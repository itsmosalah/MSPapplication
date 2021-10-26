import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:msp_ainshams/data/shared/constants/constants.dart';
import 'package:msp_ainshams/layout/main_layout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  void navigateToHome() async{
    await Future.delayed(const Duration(milliseconds: 6000),(){});
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const MainLayout()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage(
                "assets/images/MSP LOGO bright.png"
              ),
            ),
            verticalDivider(),
            const Text(
              'MSP - Ain Shams University',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                fontFamily: "RailWay",
              ),
            ),
          ],
        ),
      ),
    );
  }
}