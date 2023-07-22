import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../../controller/bmi_controller.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

  BmiController controller = Get.put(BmiController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 3.h,),
              Text("Your BMI Result",style: TextStyle(fontSize: 30,color: Colors.white),),
              Container(
                height: 77.h,
                width: 90.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("${controller.bmiData.toUpperCase()} WEIGHT",style: TextStyle(fontSize: 25,color: Colors.green,fontWeight: FontWeight.bold),),
                    Text("${controller.bmiValue.ceilToDouble()}",style: TextStyle(fontSize: 80,color: Colors.white),),
                    Text("You have a ${controller.bmiData.toLowerCase()} body \n       weight Good Job",style: TextStyle(fontSize: 25,color: Colors.white),)
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
            controller.male.value= false;
            controller.female.value = false;
            controller.slider.value = 50.0;
            controller.weight.value = 0;
            controller.age.value = 0;
            Get.back();
          },
          child: Container(
            height: 9.h,
            width: 100.w,
            color: Colors.pink,
            alignment: Alignment.center,
            child: Text(
              "RE-CALCULATE",
              style: TextStyle(
                  fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
