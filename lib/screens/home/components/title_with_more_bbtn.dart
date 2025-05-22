import 'package:flutter/material.dart';
import 'package:plant_app/theme_constants.dart';

class TitleWithMoreBbtn extends StatelessWidget {
  const TitleWithMoreBbtn({
    super.key,
    required this.title,
    required this.press,
  });
  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.defaultPadding,
      ),
      child: Row(
        children: <Widget>[
          TitleWithCUstomUnderline(text: title),
          Spacer(),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            onPressed: press,
            child: Text('More', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class TitleWithCUstomUnderline extends StatelessWidget {
  const TitleWithCUstomUnderline({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: AppSpacing.defaultPadding / 4),
            child: Text(
              text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(right: AppSpacing.defaultPadding / 4),
              height: 7,
              color: AppColors.primary.withValues(alpha: 0.2),
            ),
          ),
        ],
      ),
    );
  }
}
