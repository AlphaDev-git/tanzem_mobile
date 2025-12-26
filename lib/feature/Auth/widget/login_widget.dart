import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanzem/Core/Utils/app.images.dart';
import 'package:tanzem/feature/Auth/view/signup_view.dart';
import '../../../Core/Utils/app.colors.dart';
import '../../../Core/Widgets/common_widgets.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool rememberMe = false;

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
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                   SizedBox(height: height*0.07),
                  Image.asset(
                    AppImages.appPLogo2,
                    width: 120,
                  ),
                  SizedBox(height: height*0.03),
                   Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                      fontSize: width*0.08,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0A3D3A),
                    ),
                  ),
                   Text(
                    ' أهلاً بك… تابع إدارة المدرسة بسهولة',
                    style: TextStyle(
                      fontSize: width*0.05,
                      color: Colors.grey,
                    ),
                  ),

                  SizedBox(height: height*0.03),
                  buildTextField(
                    hint: 'البريد الإلكتروني',
                    icon: Icons.email_outlined,
                  ),
                  SizedBox(height: height*0.03),
                  buildTextField(
                    hint: 'كلمة المرور',
                    icon: Icons.lock_outline,
                    isPassword: true,
                  ),

                  SizedBox(height: height*0.03),

                  Row(
                    children: [
                      Checkbox(
                        value: rememberMe,
                        activeColor: const Color(0xFF18C5B6),
                        onChanged: (value) {
                          setState(() {
                            rememberMe = value!;
                          });
                        },
                      ),
                       Text(
                        'تذكرني',
                        style: TextStyle(fontSize: width*0.03),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child:  Text(
                          'نسيت كلمة المرور؟',
                          style: TextStyle(
                            fontSize: width*0.03,
                            color: Color(0xFF18C5B6),
                          ),
                        ),
                      ),
                    ],
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
                        'تسجيل',
                        style: TextStyle(
                          fontSize: width*0.05,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(SignUpView());
                    },
                    child:  Text(
                      'ليس لديك حساب؟',
                      style: TextStyle(
                        fontSize: width*0.04,
                        color: Color(0xFF18C5B6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
