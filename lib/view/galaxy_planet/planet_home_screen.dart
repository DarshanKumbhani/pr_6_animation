import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../../controller/home_controller.dart';

class Panet_home extends StatefulWidget {
  const Panet_home({Key? key}) : super(key: key);

  @override
  State<Panet_home> createState() => _Panet_homeState();
}

class _Panet_homeState extends State<Panet_home>
    with SingleTickerProviderStateMixin {
  Planet homecontro = Get.put(Planet());

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
          body: ListView.builder(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.toNamed('view', arguments: index);
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 3.h, left: 5.w, right: 6.w),
                  child: Galaxy(
                      name: homecontro.planetlist[index].name,
                      img: homecontro.planetlist[index].img,
                      distance: homecontro.planetlist[index].sundistance,
                      gravity: homecontro.planetlist[index].gravity),
                ),
              );
            },
            itemCount: homecontro.planetlist.length,
          )),
    );
  }

  Widget Galaxy(
      {String? name, String? img, double? distance, double? gravity}) {
    return Container(
      height: 23.h,
      width: 100.w,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 20.h,
              width: 73.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.w),
                color: Color(
                  0xff434273,
                ),
              ),
              padding: EdgeInsets.only(
                  left: 19.w, top: 3.5.h, right: 5.w, bottom: 3.5.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "$name",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      ),
                      Icon(
                        Icons.more_vert_outlined,
                        size: 20.sp,
                        color: Colors.grey.shade400,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.5.h),
                    child: Text(
                      "Milkyway Galaxy",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  SizedBox(
                      width: 10.w,
                      child: Divider(
                        height: 1.h,
                        thickness: 2,
                        color: Colors.lightBlue,
                      )),
                  Spacer(),
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            "assets/images/ic_distance.png",
                            height: 2.h,
                            width: 2.h,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            width: 1.5.w,
                          ),
                          Text(
                            "$distance m Km",
                            style: TextStyle(
                                fontSize: 9.sp,
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            "assets/images/ic_gravity.png",
                            height: 2.1.h,
                            width: 2.1.h,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            "$gravity m/s",
                            style: TextStyle(
                              fontSize: 9.6.sp,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w300,
                            ),
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
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: AnimatedBuilder(
              animation: animationController!,
              builder: (context, child) {
                return Transform.rotate(
                  angle: animationController!.value * pi * 2,
                  child: child,
                );
              },
              child: Container(
                height: 16.h,
                width: 15.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("$img"),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
