import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../../controller/home_controller.dart';

class Planet_view extends StatefulWidget {
  const Planet_view({Key? key}) : super(key: key);

  @override
  State<Planet_view> createState() => _Planet_viewState();
}

class _Planet_viewState extends State<Planet_view> {
  Planet gcontrol = Get.put(Planet());

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
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w),
          child: Column(children: [
            Stack(alignment: Alignment(0, -1), children: [
              Container(
                height: 30.h,
                width: 100.w,
                margin: EdgeInsets.only(top: 9.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.w),
                    color: Colors.indigo.shade500),
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.all(8.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${gcontrol.planetlist[index].name}",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 30.sp),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.h),
                      child: Text(
                        "Milkyway Galaxy",
                        style:
                            TextStyle(fontSize: 14.sp, color: Colors.white60),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              width: 2.w,
                            ),
                            Text(
                              "${gcontrol.planetlist[index].sundistance} m km",
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              "${gcontrol.planetlist[index].gravity} m/s",
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              "2",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.white60,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Image.asset(
                "${gcontrol.planetlist[index].img}",
                height: 150,
              ),
            ]),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "OVERVIEW",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 5,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                    width: 10.w,
                    child: Divider(
                      height: 1.h,
                      thickness: 2,
                      color: Colors.lightBlue,
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "${gcontrol.planetlist[index].data}",
              style: TextStyle(color: Colors.grey.shade400, fontSize: 18),
            )
          ]),
        ),
      ]),
    ));
  }
}
