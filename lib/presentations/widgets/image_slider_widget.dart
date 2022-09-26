import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSliderWidget extends StatefulWidget {
  final List<String> bannerImages;

  const ImageSliderWidget({super.key, required this.bannerImages});

  @override
  _ImageSliderWidgetState createState() => _ImageSliderWidgetState();
}

class _ImageSliderWidgetState extends State<ImageSliderWidget> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CarouselSlider.builder(
              itemCount: widget.bannerImages.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return CachedNetworkImage(
                  imageUrl: widget.bannerImages[itemIndex],
                  // imageUrl:widget.bannerImages[itemIndex].image,
                  placeholder: (context, url) =>
                      Image.asset("assets/cover.png"),
                  errorWidget: (context, url, error) =>
                      Image.asset("assets/cover.png"),
                );
              },
              options: CarouselOptions(
                aspectRatio: 2 / 1,
                viewportFraction: 1.0,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 500),
                autoPlayCurve: Curves.linear,
                enlargeCenterPage: true,
                onPageChanged: (index, onPageChanged) {
                  pageIndex = index;
                  print(pageIndex);
                  setState(() {});
                },
                scrollDirection: Axis.horizontal,
              )),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: CarouselIndicator(
            count: pageIndex == 0 ? pageIndex + 1 : pageIndex,
            index: pageIndex,
            color: Colors.black.withOpacity(0.4),
          ),
        ),
      ],
    );
  }
}
