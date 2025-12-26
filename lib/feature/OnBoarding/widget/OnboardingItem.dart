import 'package:flutter/material.dart';
import '../../../Core/Utils/app.colors.dart';

class OnboardingItem extends StatelessWidget {
  final String image;   // logo
  final String image2;  // background image
  final String title;
  final String subtitle;

  const OnboardingItem({
    super.key,
    required this.image,
    required this.image2,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: ClipPath(
            clipper: WaveClipper(),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  image2,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),

                /// Overlay gradient (light)
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.15),
                        Colors.transparent,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),

                /// Logo
               image==""?Text(""):Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      image,
                      width: 140,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        /// BOTTOM CONTENT
        Expanded(
          flex: 5,
          child: Padding(
            padding:  EdgeInsets.only(right: 18.0),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style:  TextStyle(
                          fontSize: width*0.09,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                        ),
                      ),
                    ],
                  ),
                   SizedBox(height: height*0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        subtitle,
                        style:  TextStyle(
                          fontSize: width*0.05,
                          height: 1.6,
                          color: AppColors.textLight,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height - 90);

    path.cubicTo(
      size.width * 0.45,
      size.height - 20,
      size.width * 0.95,
      size.height - 130,
      size.width,
      size.height - 90,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

