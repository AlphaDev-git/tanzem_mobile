import 'package:flutter/material.dart';
import 'package:tanzem/Core/Utils/app.images.dart';


class OwnerMainScreenWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _OwnerMainScreenWidget();
  }
}


class _OwnerMainScreenWidget extends State<OwnerMainScreenWidget>{
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // Set to RTL for Arabic
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: _buildBottomNav(),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                SizedBox(height: 20),
                _buildSearchBar(),
                SizedBox(height: 25),
                _buildSectionTitle("الأرقام الحالية"),
                _buildStatsGrid(),
                SizedBox(height: 25),
                _buildSectionTitle("أحدث المدارس", showViewAll: true),
                _buildSchoolsList(),
                SizedBox(height: 25),
                _buildSectionTitle("الاشتراكات"),
                _buildSubscriptionChart(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- UI Components ---

  Widget _buildHeader() {
    return Row(
      children: [
        CircleAvatar(radius: 25, backgroundImage: AssetImage(AppImages.owner_pic)),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("مرحباً، موسي", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF2D5D64))),
            Text("مالك", style: TextStyle(color: Colors.grey)),
          ],
        ),
        Spacer(),
        InkWell(
            onTap: (){},
            child: Image.asset(AppImages.notification)),
        InkWell(
          onTap: (){},
            child: Image.asset(AppImages.profile_setting)),
      ],
    );
  }

  Widget _buildStatsGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      childAspectRatio: 1.2,
      children: [
        _statCard("12", "مدارس مسجلة", AppImages.schools),
        _statCard("15", "مديرو مدارس", AppImages.person),
        _statCard("85", "معلمون نشطون", AppImages.teachers),
         _statCard("1,250", "إجمالي عدد الطلاب", AppImages.students),
      ],
    );
  }

  Widget _statCard(String value, String label, String icon) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.teal.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(icon),
          Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF2D5D64))),
          Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildSubscriptionChart() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 150, width: 150,
                child: CircularProgressIndicator(value: 0.7, strokeWidth: 20, color: Colors.green, backgroundColor: Colors.red.withOpacity(0.2)),
              ),
              Column(
                children: [
                  Text("120,000 ج.م", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("إجمالي السداد", style: TextStyle(fontSize: 12)),
                ],
              )
            ],
          ),
          SizedBox(height: 20),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     _chartLegend("متأخر 30%", Colors.red),
          //     _chartLegend("مستحق 25%", Colors.yellow),
          //     _chartLegend("تم السداد 35%", Colors.green),
          //   ],
          // )
        ],
      ),
    );
  }

  // --- Helpers ---
  Widget _iconButton(IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
      child: Icon(icon, color: color),
    );
  }

  Widget _buildSectionTitle(String title, {bool showViewAll = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF2D5D64))),
          if (showViewAll) Text("شاهد الكل ←", style: TextStyle(color: Colors.grey)),
        ],
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
      items: [
        BottomNavigationBarItem(
            icon: Image.asset(AppImages.home_un), label: "الرئيسية",
          activeIcon: Image.asset(AppImages.home_icon)
        ),
        BottomNavigationBarItem(icon: Image.asset(AppImages.school_un), label: "المدارس"),
        BottomNavigationBarItem(icon: Image.asset(AppImages.manager_un), label: "مديرو"),
        BottomNavigationBarItem(icon: Image.asset(AppImages.sub_un), label: "الاشتراكات"),
        BottomNavigationBarItem(icon: Image.asset(AppImages.report_un), label: "التقارير"),
      ],
    );
  }


  // Empty stubs for brevity
  Widget _buildSearchBar() => Row(children: [Expanded(child: TextField(decoration: InputDecoration(hintText: "بحث...", border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))))), SizedBox(width: 10),InkWell(
      onTap: (){},
      child: Image.asset(AppImages.fillter)),]);
  Widget _buildSchoolsList() => Container(height: 180, child: ListView(scrollDirection: Axis.horizontal, children: [Text("School Cards Here...")]));
}