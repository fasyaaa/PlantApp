import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_app/theme_constants.dart';

class ImageAndIcons extends StatelessWidget {
  const ImageAndIcons({super.key, required this.size,});
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
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios_new),
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSpacing.defaultPadding,
                        ),
                      ),
                    ),
                    Spacer(),
                    IconCard(icon: "assets/icons/sun.svg",),
                    IconCard(icon: "assets/icons/hygro.svg", color: Colors.green, ),
                    IconCard(icon: "assets/icons/temp.svg", color: Colors.green,),
                    IconCard(icon: "assets/icons/sun.svg", color: Colors.green,),
                    IconCard(icon: "assets/icons/wind.svg", color: Colors.green,),
                  ],
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

  const IconCard({
    Key? key,
    required this.icon,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 15),
            blurRadius: 22,
            color: AppColors.primary.withValues(alpha: 0.3),
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
        height: 24,
        width: 24,
      ),
    );
  }
}
