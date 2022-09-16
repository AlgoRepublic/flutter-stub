import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'category_data.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryData categoryData;

  const CategoryWidget({required this.categoryData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.25,
      height: Get.width * 0.25,
      child: Column(
        children: [
          SizedBox(
            width: Get.width * 0.13,
            height: Get.width * 0.13,
            child: Image.asset(
              categoryData.image,
            ),
            //  CachedNetworkImage(
            //   // imageUrl: "http://206.189.238.17/cms/" + categoryData.catImage,
            //   imageUrl: categoryData.image,
            //   placeholder: (context, url) =>
            //       Image.asset("assets/logo.jpg"),
            //   errorWidget: (context, url, error) =>
            //       Image.asset("assets/images/logo.jpg"),
            // ),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: AutoSizeText(
              categoryData.name,
              maxLines: 2,
              presetFontSizes: const [12, 10],
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 14,
                color: Color(0xff444444),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
