import 'dart:io';
import 'package:base_project/src/theme/base_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RoundImage extends StatelessWidget {
  final String imageUrl;
  final double radius;
  final File? fileImage;
  final bool profile;

  const RoundImage({
    this.imageUrl =
        'https://png.pngtree.com/png-vector/20200614/ourlarge/pngtree-businessman-user-avatar-character-vector-illustration-png-image_2242909.jpg',
    this.radius = 65.0,
    this.fileImage,
    this.profile = false,
  });

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(imageUrl);
    }
    return fileImage == null
        ? CachedNetworkImage(
            imageUrl: imageUrl,
            color: Colors.white,
            imageBuilder: (context, imageProvider) => Container(
              width: radius,
              height: radius,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                    color: profile ? Colors.blue : Colors.white, width: 3),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => Container(
              width: radius,
              height: radius,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/ysells_logo.png",
                  ),
                ),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              width: radius,
              height: radius,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: BaseTheme.primaryColor, width: 2),
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    "assets/ysells_logo.png",
                  ),
                ),
              ),
            ),
          )
        : Container(
            width: radius,
            height: radius,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: Colors.white, width: 3),
              image: fileImage == null
                  ? null
                  : DecorationImage(
                      image: FileImage(fileImage!),
                      fit: BoxFit.cover,
                    ),
            ),
          );
  }
}
