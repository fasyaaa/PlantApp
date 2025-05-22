import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/theme_constants.dart';

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: AppSpacing.defaultPadding * 2.5),
      height: size.height * 0.2,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: AppSpacing.defaultPadding, right: AppSpacing.defaultPadding, bottom: 36 + AppSpacing.defaultPadding),
            height: size.height * 0.2 - 27,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Row(
              children: <Widget>[
                Text(
                  'Hi Uishopy!',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                ClipOval(
                  child: Container(
                    width: 60,
                    height: 60,
                    color: Colors.white,
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: AppSpacing.defaultPadding),
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.defaultPadding,
              ),
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: AppColors.primary.withValues(alpha: 0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: AppColors.primary.withValues(alpha: 0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    "assets/icons/search.svg",
                    width: 20,
                    height: 20,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
