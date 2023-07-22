import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 5),
      () {
        Navigator.pushReplacementNamed(context, "/");
      },
    );

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 90),
                child: Container(
                  height: 30.h,
                  width: 30.w,
                  decoration:
                      BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.volunteer_activism,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
              ),
              Text(
                "BMI CALCULATOR",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                  letterSpacing: 3.sp,
                ),
              ),
              SizedBox(
                height: 270,
              ),
              CircularProgressIndicator(
                color: Colors.red,
              ),
              SizedBox(height: 30,),
              Text(
                "Check your BMI",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 18),
              )
            ],
          ),
        ),
        backgroundColor: Color(0xff3E3963),
      ),
    );
  }
}
