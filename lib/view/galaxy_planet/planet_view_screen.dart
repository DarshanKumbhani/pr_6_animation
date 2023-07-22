import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../../controller/home_controller.dart';

class Glaxy_view extends StatefulWidget {
  const Glaxy_view({Key? key}) : super(key: key);

  @override
  State<Glaxy_view> createState() => _Glaxy_viewState();
}

class _Glaxy_viewState extends State<Glaxy_view>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    animationController!.repeat(reverse: false);
    animationController!.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  Planet homecontroller = Get.put(Planet());

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          leading: Icon(
            Icons.menu,
            size: 30,
            color: Colors.white,
          ),
          title: Text(
            "treva",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          actions: [
            Icon(
              Icons.search_rounded,
              size: 30,
              color: Colors.white,
            )
          ],
        ),
        backgroundColor: Color(0xff3E3963),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 30.h,
                        width: 100.w,
                        margin: EdgeInsets.only(top: 9.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.w),
                            color: Color(0xff434273)),
                        alignment: Alignment.bottomCenter,
                        padding: EdgeInsets.all(8.w),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "${homecontroller.planetlist[index].name}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.sp),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 0.5.h),
                              child: Text(
                                "Milkyway Galaxy",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey.shade400),
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      "assets/images/ic_distance.png",
                                      height: 2.h,
                                      width: 2.h,
                                      fit: BoxFit.fill,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text(
                                      "${homecontroller.planetlist[index].sundistance} m km",
                                      style: TextStyle(
                                          fontSize: 11.sp,
                                          color: Colors.grey.shade400,
                                          fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      "assets/images/ic_gravity.png",
                                      height: 2.h,
                                      width: 2.h,
                                      fit: BoxFit.fill,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text(
                                      "${homecontroller.planetlist[index].gravity} m/s",
                                      style: TextStyle(
                                          fontSize: 11.sp,
                                          color: Colors.grey.shade400,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Text(
                                      "2",
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.grey.shade400,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            Get.bottomSheet(
                              backgroundColor: Color(0xff434273),
                              Column(
                                children: [
                                  Container(
                                      height: 8.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(3.w),
                                              bottomRight:
                                                  Radius.circular(3.w)),
                                          gradient: LinearGradient(colors: [
                                            Colors.blue.shade400,
                                            Colors.lightBlue.shade300
                                          ])),
                                      alignment: Alignment.center,
                                      child: Text(
                                        " ${homecontroller.planetlist[index].name}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18.sp,
                                          color: Colors.white,
                                        ),
                                      )),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 3.h),
                                    child: AnimatedBuilder(
                                      animation: animationController!,
                                      builder: (context, child) {
                                        return Transform.rotate(
                                            angle: animationController!.value *
                                                pi *
                                                2,
                                            child: child);
                                      },
                                      child: Container(
                                        height: 17.h,
                                        width: 17.h,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "${homecontroller.planetlist[index].img}"),
                                                fit: BoxFit.fill),
                                            shape: BoxShape.circle),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    "Distance to Sun  HACKSPLAINING",
                                      style: TextStyle(
                                        fontSize: 12.sp, color: Colors.white60),
                                  ),
                                  Text(
                                    "${homecontroller.planetlist[index].sundistance} million km",
                                    style: TextStyle(
                                        fontSize: 22.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Text(
                                    homecontroller.planetlist[index].name ==
                                            "EARTH"
                                        ? ""
                                        : "Distance to Earth",
                                    style: TextStyle(
                                        fontSize: 12.sp, color: Colors.white60),
                                  ),
                                  Text(
                                    homecontroller.planetlist[index].name ==
                                            "EARTH"
                                        ? ""
                                        : "${homecontroller.planetlist[index].earthdistance} million km",
                                    style: TextStyle(
                                        fontSize: 22.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: AnimatedBuilder(
                            animation: animationController!,
                            builder: (context, child) {
                              return Transform.rotate(
                                  angle: animationController!.value * pi * 2,
                                  child: child);
                            },
                            child: Container(
                              height: 17.h,
                              width: 17.h,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "${homecontroller.planetlist[index].img}"),
                                      fit: BoxFit.fill),
                                  shape: BoxShape.circle),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 3.h),
                    child: Text(
                      "OVERVIEW",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp,
                          color: Colors.white),
                    ),
                  ),
                  Text(
                    "${homecontroller.planetlist[index].data}",
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white60,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            Container(
              height: 7.h,
              width: 100.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(3.w),
                      topRight: Radius.circular(3.w)),
                  gradient: LinearGradient(colors: [
                    Colors.blue.shade800,
                    Colors.lightBlue.shade300
                  ])),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 5.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 150, left: 20),
                    child: Text(
                      "₹2.8m",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    "Book Now",
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
