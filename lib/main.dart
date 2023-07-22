import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_6_animation/view/bmi_calculator/aplasj_screen.dart';
import 'package:pr_6_animation/view/bmi_calculator/home_screen.dart';
import 'package:pr_6_animation/view/bmi_calculator/resulrt_screen.dart';
import 'package:pr_6_animation/view/galaxy_planet/planet_home_screen.dart';
import 'package:pr_6_animation/view/galaxy_planet/planet_view_screen.dart';

import 'package:sizer/sizer.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // initialRoute: "splash",
        routes: {
          '/':(p0) => Panet_home(),
          'view':(p0) => Glaxy_view()


        },
      ),
    )
  );
}

