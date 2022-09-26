import 'package:auto_size_text/auto_size_text.dart';
import 'package:base_project/presentations/widgets/round_image.dart';
import 'package:base_project/src/theme/base_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../widgets/bottom_nav_bar/bottom_nav_bar.dart';
import '../widgets/category_data.dart';
import '../widgets/category_widget.dart';
import '../widgets/image_slider_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu_rounded,
          ),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: false,
        progressIndicator: const CircularProgressIndicator(
            // valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
            ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          AutoSizeText(
                            "Good Morning!",
                            maxLines: 1,
                            presetFontSizes: [16, 14, 12],
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              // color: WDTColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          AutoSizeText(
                            "Consider it Done",
                            maxLines: 1,
                            presetFontSizes: [14, 12, 10],
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: BaseTheme.primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                          height: 50,
                          width: 50,
                          child: RoundImage(
                            profile: true,
                          ))
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  // padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const ImageSliderWidget(
                    bannerImages: ['assets/cover.png'],
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 35,
                    width: 210,
                    decoration: const BoxDecoration(
                      color: BaseTheme.primaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x29000000),
                          offset: Offset(0, 5),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(7),
                    child: Container(
                        alignment: Alignment.center,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              "Find Service Provider".tr,
                              presetFontSizes: const [14, 12, 10],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                // fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 2),
                              child: Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Row(
                    children: [
                      AutoSizeText(
                        "Categories".tr,
                        presetFontSizes: const [15, 13, 11],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          height: 1.5,
                          color: BaseTheme.lightThemeBoxColor,
                        ),
                      )
                    ],
                  ),
                ),
                AnimationLimiter(
                  child: GridView.builder(
                      padding: const EdgeInsets.all(10),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1.3,
                        // crossAxisSpacing: Get.width * 0.05,
                        // mainAxisSpacing: Get.height * 0.04,
                        crossAxisSpacing: 0.1,
                        mainAxisSpacing: 0.1,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: categoriesList.length,
                      itemBuilder: (BuildContext ctx, index) {
                        CategoryData categoryData = categoriesList[index];
                        return AnimationConfiguration.staggeredGrid(
                          position: index,
                          columnCount: 2,
                          child: ScaleAnimation(
                            duration: const Duration(milliseconds: 500),
                            child: FadeInAnimation(
                              child: InkWell(
                                  onTap: () async {
                                    // model.setLoading(true);
                                    // await model.getServiceProvider(categoryModel.id);
                                    // if (model.categoriesList.isNotEmpty) {
                                    //   // model.setLoading(false);
                                    //   Get.to(
                                    //       () => CategoryNameView(
                                    //             catList: categoryData,
                                    //           ),
                                    //       duration:
                                    //           const Duration(milliseconds: 800),
                                    //       transition:
                                    //           Transition.leftToRightWithFade);

                                    //   print(
                                    //       "Category Id of index $index${categoryData.id}");
                                    // }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5,
                                          color: const Color(0xFFF5F5F5)),
                                    ),
                                    child: CategoryWidget(
                                      categoryData: categoryData,
                                    ),
                                  )),
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(height: 12),
                InkWell(
                    onTap: () {},
                    child: Container(
                      width: 100,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color(0xFF333333),
                      ),
                      child: const Center(
                        child: AutoSizeText(
                          "View All",
                          maxLines: 1,
                          presetFontSizes: [12, 10, 8],
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )),
                const SizedBox(height: 70),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Visibility(
        // visible: model.state == false?true:false,
        child: FloatingActionButton(
          onPressed: () {
            // Get.to(() => RequestQuoteView());
          },
          backgroundColor: Colors.white,

          //Color(0xffFBC500),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: BaseTheme.primaryColor,
                width: 2,
              ),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/ar.png"),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 0,
        onIndexChange: (index) {
          // model.state
          //     ? model.setSelectedIndexProvider(index)
          //     : model.setSelectedIndexUser(index);
        },
      ),
    );
  }
}

List<CategoryData> categoriesList = [
  CategoryData(
    image: 'assets/accounting.png',
    name: 'Accounting',
  ),
  CategoryData(
    image: 'assets/cleaning.png',
    name: 'Cleaning',
  ),
  CategoryData(
    image: 'assets/carpenter.png',
    name: 'Carpenter',
  ),
  CategoryData(
    image: 'assets/ac.png',
    name: 'AC Service',
  ),
  CategoryData(
    image: 'assets/electricity.png',
    name: 'Electricity',
  ),
  CategoryData(
    image: 'assets/plumber.png',
    name: 'Plumber',
  ),
  CategoryData(
    image: 'assets/holes.png',
    name: 'Holes',
  ),
  CategoryData(
    image: 'assets/security.png',
    name: 'Security',
  ),
  CategoryData(
    image: 'assets/renovation.png',
    name: 'Renovation',
  ),
];
