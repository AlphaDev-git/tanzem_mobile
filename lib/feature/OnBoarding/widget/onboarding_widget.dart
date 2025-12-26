import 'package:flutter/material.dart';
import 'package:tanzem/Core/Utils/app.images.dart';
import 'package:tanzem/feature/Auth/view/login_view.dart';

import '../../../Core/Utils/app.colors.dart';
import 'OnboardingItem.dart';



class OnBoardingWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _OnBoardingWidget();
  }
}



class _OnBoardingWidget extends State<OnBoardingWidget>{
  final PageController _controller = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> pages = [
    {
      "image": AppImages.appPLogo2,
      'image2':AppImages.onboard1,
      "title": "أهلاً بك في تنظيم",
      "subtitle": "كل ما تحتاجه لإدارة المدرسة\n في مكان واحد",
    },
    {
      "image": "",
      'image2':AppImages.onboard2,
      "title": "الغياب… أسهل من أي وقت",
      "subtitle": "المعلّم يسجّل الحضور والغياب\n مباشرة من خلال التطبيق",
    },
    {
      "image": "",
      'image2':AppImages.onboard3,
      "title": "صرف أسرع… تنظيم أفضل",
      "subtitle": "المصرف يدفع للطالب مباشرة\n من خلال تطبيق تنظيم",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primary,
              Color(0xFFD6F5F2),
              Color(0xFFD6F5F2),
              Color(0xFFD6F5F2),
              AppColors.primary,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() => currentIndex = index);
                },
                itemBuilder: (_, index) => OnboardingItem(
                  image: pages[index]['image']!,
                  image2: pages[index]['image2']!,
                  title: pages[index]['title']!,
                  subtitle: pages[index]['subtitle']!,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(
                      pages.length,
                          (index) => Container(
                        margin: const EdgeInsets.only(right: 6),
                        width: currentIndex == index ? 20 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: currentIndex == index
                              ? AppColors.secondary
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: () {
                      if (currentIndex == pages.length - 1) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) =>  LoginView()),
                        );
                      } else {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}