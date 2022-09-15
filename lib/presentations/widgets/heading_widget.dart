import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../src/utils/global_constants.dart';

class HeadingWidget extends StatelessWidget {
  final String headingText;

  const HeadingWidget({Key? key, this.headingText = "Your Country"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 37,
      padding: const EdgeInsets.only(left: hMargin),
      color: Theme.of(context).canvasColor,
      alignment: Alignment.centerLeft,
      child: Text(headingText,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Theme.of(context).primaryColorDark)),
    );
  }
}
