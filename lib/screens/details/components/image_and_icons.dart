import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/theme_constants.dart';

class ImageAndIcons extends StatelessWidget {
  const ImageAndIcons({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.defaultPadding * 3),
      child: SizedBox(
        height: size.height * 0.8,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppSpacing.defaultPadding * 3,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.arrow_back_ios_new),
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSpacing.defaultPadding,
                        ),
                      ),
                    ),
                    Spacer(),
                    IconCard(
                      icon: "assets/icons/sun.svg",
                      color: AppColors.primary,
                    ),
                    SizedBox(height: 20),
                    IconCard(
                      icon: "assets/icons/hygro.svg",
                      color: Colors.green,
                    ),
                    SizedBox(height: 20),
                    IconCard(
                      icon: "assets/icons/temp.svg",
                      color: Colors.green,
                    ),
                    SizedBox(height: 20),
                    IconCard(
                      icon: "assets/icons/sun.svg",
                      color: Colors.green,
                    ),
                    SizedBox(height: 20),
                    IconCard(
                      icon: "assets/icons/wind.svg",
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: size.height * 0.95,
              width: size.width * 0.85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(63),
                  topRight: Radius.circular(63),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 60,
                    color: AppColors.primary.withOpacity(0.29),
                  ),
                ],
                image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/img_main.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconCard extends StatelessWidget {
  final String icon;
  final Color? color;

  const IconCard({Key? key, required this.icon, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      height: 60,
      width: 60,
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 15),
            blurRadius: 22,
            color: AppColors.primary.withOpacity(0.3),
          ),
          BoxShadow(
            offset: Offset(-15, -15),
            blurRadius: 20,
            color: Colors.white,
          ),
        ],
      ),
      child: SvgPicture.asset(
        icon,
        color: color,
        height: 32,
        width: 32,
      ),
    );
  }
}
