import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanzem/feature/Owner_MainScreen/view/owner_main_screen_view.dart';

import '../../Auth/view/signup_view.dart';


class MainScreenWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MainScreenWidget();
  }
}


class _MainScreenWidget extends State<MainScreenWidget>{
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Get.to(OwnerMainScreenView());
            },
            child:  Text(
              'Owner',
              style: TextStyle(
                fontSize: width*0.04,
                color: Color(0xFF18C5B6),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.to(SignUpView());
            },
            child:  Text(
              'Manager',
              style: TextStyle(
                fontSize: width*0.04,
                color: Color(0xFF18C5B6),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.to(SignUpView());
            },
            child:  Text(
              'Teacher',
              style: TextStyle(
                fontSize: width*0.04,
                color: Color(0xFF18C5B6),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.to(SignUpView());
            },
            child:  Text(
              'Parents',
              style: TextStyle(
                fontSize: width*0.04,
                color: Color(0xFF18C5B6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}