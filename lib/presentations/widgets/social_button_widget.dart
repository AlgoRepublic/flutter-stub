import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../src/theme/base_theme.dart';

class SocialButtonWidget extends StatelessWidget {
  final String text;
  final String iconPath;

  const SocialButtonWidget(
      {Key? key, required this.text, required this.iconPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 48,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Theme.of(context).canvasColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath),
          const SizedBox(
            width: 12,
          ),
          Text(text,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: BaseTheme.lightThemeTextLightColor,
                  )),
        ],
      ),
    );
  }
}
