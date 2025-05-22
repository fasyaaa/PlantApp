import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_app/theme_constants.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: AppSpacing.defaultPadding * 2,
        right: AppSpacing.defaultPadding * 2,
        bottom: AppSpacing.defaultPadding,
      ),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 35,
            color: AppColors.primary.withValues(alpha: 0.38),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/flower.svg", width: 20, height: 20, color: AppColors.primary),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/heart.svg", width: 20, height: 20, color: AppColors.primary,),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/user.svg", width: 20, height: 20, color: AppColors.primary,),
          ),
        ],
      ),
    );
  }
}
