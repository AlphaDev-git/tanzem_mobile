import 'package:flutter/material.dart';

import '../../../Core/Utils/app.colors.dart';
import '../../../Core/Utils/app.images.dart';
import '../../../Core/Widgets/common_widgets.dart';



class SignUpWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SignUpWidget();
  }
}


class _SignUpWidget extends State<SignUpWidget>{
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary,
                  Color(0xFFEFFFFC),
                  Color(0xFFEFFFFC),
                  Color(0xFFEFFFFC),
                  Color(0xFFEFFFFC),
                  AppColors.primary,
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: SafeArea(child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SizedBox(height: height*0.07),
                  Image.asset(
                    AppImages.appPLogo2,
                    width: 120,
                  ),
                  Text(
                    ' أهلاً بك… تابع إدارة المدرسة بسهولة',
                    style: TextStyle(
                      fontSize: width*0.05,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: height*0.03),
                  buildTextField(
                    hint: 'البريد الإلكتروني',
                    icon: Icons.email_outlined,
                  ),
                  SizedBox(height: height*0.03),
                  buildTextField(
                    hint: 'اسم المدرسة',
                    icon: Icons.school,
                  ),
                  SizedBox(height: height*0.03),
                  buildTextField(
                    hint: 'اسم المدير',
                    icon: Icons.person,
                  ),
                  SizedBox(height: height*0.03),
                  buildTextField(
                    hint: 'الموقع',
                    icon: Icons.map,
                  ),
                  SizedBox(height: height*0.03),
                  buildTextField(
                    hint: 'رقم الهاتف',
                    icon: Icons.phone,
                  ),
                  SizedBox(height: height*0.03),
                  buildTextField(
                    hint: 'كلمة المرور',
                    icon: Icons.lock_outline,
                    isPassword: true,
                  ),

                  SizedBox(height: height*0.03),
                  buildTextField(
                    hint: 'تاكيد كلمة المرور',
                    icon: Icons.lock_outline,
                    isPassword: true,
                  ),
                  SizedBox(height: height*0.03),
                  SizedBox(
                    width: double.infinity,
                    height: height*0.05,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0A5F5A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      child:  Text(
                        'انشاء الحساب',
                        style: TextStyle(
                            fontSize: width*0.05,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ),
        )
    );
  }
}