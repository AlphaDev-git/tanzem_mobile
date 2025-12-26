import 'package:flutter/material.dart';
import 'package:tanzem/Core/Utils/app.images.dart';
import 'package:tanzem/feature/Managers/view/owner_manager_view.dart';
import 'package:tanzem/feature/Home/view/owner_home_view.dart';
import 'package:tanzem/feature/Reports/view/owner_report_view.dart';
import 'package:tanzem/feature/Schools/view/owner_school_view.dart';
import 'package:tanzem/feature/Subscribes/view/owner_subscribe_view.dart';

class OwnerMainScreenWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OwnerMainScreenWidget();
  }
}

class _OwnerMainScreenWidget extends State<OwnerMainScreenWidget> {
  List<Widget> screens=[
    OwnerHomeView(),
    OwnerSchoolView(),
    OwnerManagerView(),
    OwnerSubscribeView(),
    OwnerReportView(),
  ];
  int _selected=0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // Set to RTL for Arabic
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: _buildBottomNav(),
        body: screens[_selected]
      ),
    );
  }

  // Basic Bottom Nav
  Widget _buildBottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.teal,
      unselectedItemColor: Colors.grey,
      backgroundColor: Color(0xFF0A5F5A),
      onTap: (index) => setState(() => _selected = index),
      selectedFontSize: 13,
      unselectedFontSize: 12,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(AppImages.home_un),
          label: "الرئيسية",
          activeIcon: Image.asset(AppImages.home_icon),
        ),
        BottomNavigationBarItem(
          icon: Image.asset(AppImages.school_un),
          label: "المدارس",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(AppImages.manager_un),
          label: "مديرو",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(AppImages.sub_un),
          label: "الاشتراكات",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(AppImages.report_un),
          label: "التقارير",
        ),
      ],
    );
  }
}
