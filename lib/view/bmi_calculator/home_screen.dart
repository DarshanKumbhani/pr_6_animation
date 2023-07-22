import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pr_6_animation/controller/bmi_controller.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  BmiController controller = Get.put(BmiController());

  AnimationController? animationController;
  Animation? genderanimation;
  Animation? ageanimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    genderanimation =
        Tween<Alignment>(begin: Alignment(-40, 0), end: Alignment(0, 0))
            .animate(animationController!);
    ageanimation =
        Tween<Alignment>(begin: Alignment(40, 0), end: Alignment(0, 0))
            .animate(animationController!);
    animationController!.forward();
    animationController!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff3E3963),
          automaticallyImplyLeading: false,
          title: Text(
            "BMI CALCULATOR",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.refresh,
                size: 25,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 2.w),
          ],
        ),
        backgroundColor: Color(0xff3E3963),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      child: Align(
                        alignment: genderanimation!.value,
                        child: GestureDetector(
                          onTap: () {
                            controller.changeColorMale();
                          },
                          child: controller.male == false
                              ? gender(
                                  Icon(
                                    Icons.male,
                                    size: 90,
                                    color: Colors.white,
                                  ),
                                  "MALE")
                              : gender1(
                                  Icon(
                                    Icons.male,
                                    size: 90,
                                    color: Colors.pink,
                                  ),
                                  "MALE"),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Align(
                        alignment: ageanimation!.value,
                        child: GestureDetector(
                          onTap: () {
                            controller.changeColorFemale();
                          },
                          child: controller.female == false
                              ? gender(
                                  Icon(
                                    Icons.female,
                                    size: 90,
                                    color: Colors.white,
                                  ),
                                  "FEMALE")
                              : gender1(
                                  Icon(
                                    Icons.female,
                                    size: 90,
                                    color: Colors.pink,
                                  ),
                                  "FEMALE"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => Align(
                alignment: ageanimation!.value,
                child: Container(
                  height: 23.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white38,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "HEIGHT",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${controller.slider.toInt()}",
                            style: TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "cm",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                      Slider(
                        value: controller.slider.value,
                        max: 300,
                        min: 50,
                        activeColor: Colors.pink.shade200,
                        inactiveColor: Colors.white38,
                        thumbColor: Colors.pinkAccent,
                        onChanged: (value) {
                          controller.changeSlider(value);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      child: Align(
                        alignment: genderanimation!.value,
                        child: Container(
                          height: 23.h,
                          width: 43.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white38,
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "WEIGHT",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              Text(
                                "${controller.weight}",
                                style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FloatingActionButton(
                                    onPressed: () {
                                      controller.weightIncrease();
                                    },
                                    child: Icon(Icons.add),
                                    backgroundColor: Color(0xff3E3963),
                                  ),
                                  FloatingActionButton(
                                    onPressed: () {
                                      controller.weightDeIncrease();
                                    },
                                    child: Icon(Icons.remove),
                                    backgroundColor: Color(0xff3E3963),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Align(
                        alignment: ageanimation!.value,
                        child: Container(
                          height: 23.h,
                          width: 43.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white38,
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "AGE",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              Text(
                                "${controller.age}",
                                style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FloatingActionButton(
                                    onPressed: () {
                                      controller.ageIncrease();
                                    },
                                    child: Icon(Icons.add),
                                    backgroundColor: Color(0xff3E3963)
                                  ),
                                  FloatingActionButton(
                                    onPressed: () {
                                      controller.ageDeIncrease();
                                    },
                                    child: Icon(Icons.remove),
                                    backgroundColor: Color(0xff3E3963)
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
            if (controller.male == false && controller.female == false ||
                controller.slider == 50.0 ||
                controller.weight == 0 ||
                controller.age == 0) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.black26,
                    content: Text(
                      "Please select all input",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  );
                },
              );
            } else {
              controller.calculateBMI();
              Get.toNamed("result")?.then((value) {
                setState(() {});
              });
            }
          },
          child: Container(
            height: 9.h,
            width: 100.w,
            color: Colors.pink,
            alignment: Alignment.center,
            child: Text(
              "CALCULATE YOUR BMI",
              style: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Container gender(Icon icon, String data) {
    return Container(
      height: 19.h,
      width: 43.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white38,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          Text(
            "$data",
            style: TextStyle(fontSize: 20, color: Colors.white),
          )
        ],
      ),
    );
  }

  Container gender1(Icon icon, String data) {
    return Container(
      height: 19.h,
      width: 43.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white38,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          Text(
            "$data",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

