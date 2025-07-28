import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/widgets/app_column.dart';
import 'package:e_commerce/widgets/big_text.dart';
import 'package:e_commerce/widgets/icon_and_text.dart';
import 'package:flutter/material.dart';
import '../../utils/dimensions.dart';
import '../../widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final scaleFactor = screenWidth / 360;

    return Column(
      children: [
        // Slider section
        Container(
          height: screenHeight * 0.4,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position, scaleFactor, screenHeight);
            },
          ),
        ),
        // Dots
        DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: Size.square(9.0 * scaleFactor),
            activeSize: Size(18.0 * scaleFactor, 9.0 * scaleFactor),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0 * scaleFactor),
            ),
          ),
        ),
        // Popular food section
        SizedBox(height: 30 * scaleFactor),
        Container(
          margin: EdgeInsets.only(
            left: 20 * scaleFactor,
            right: 20 * scaleFactor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular", color: AppColors.mainBlackColor),
              SmallText(text: "See all", color: AppColors.mainColor),
            ],
          ),
        ),
        // List of food and images
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return _ListItem(index, scaleFactor);
          },
        ),
      ],
    );
  }

  Widget _ListItem(int index, double scaleFactor) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
        left: 10 * scaleFactor,
        right: 10 * scaleFactor,
        bottom: 10 * scaleFactor,
      ),
      child: Row(
        children: [
          Container(
            width: 120 * scaleFactor,
            height: 120 * scaleFactor,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20 * scaleFactor),
              color: Colors.white,
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/image/food0.png"),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10 * scaleFactor),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(
                right: Radius.circular(20 * scaleFactor),
              ),
              color: Colors.white,
            ),
            width: screenWidth - (140 * scaleFactor),
            height: 100 * scaleFactor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BigText(text: "Chinese Side", color: AppColors.titleColor),
                SizedBox(height: Dimensions.height10 * scaleFactor),
                Row(
                  children: [
                    Wrap(
                      children: List.generate(5, (index) {
                        return Icon(
                          Icons.star,
                          color: AppColors.mainColor,
                          size: 15 * scaleFactor,
                        );
                      }),
                    ),
                    SizedBox(width: Dimensions.width10 ),
                    SmallText(text: "4.5"),
                    SizedBox(width: Dimensions.width10 ),
                    IconAndText(
                      icon: Icons.chat_bubble,
                      text: "1208",
                      iconColor: AppColors.mainColor,
                    ),
                  ],
                ),
                SizedBox(height: (Dimensions.height10 / 2)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconAndText(
                      icon: Icons.circle_sharp,
                      text: "Normal",
                      iconColor: AppColors.iconColor1,
                    ),
                    IconAndText(
                      icon: Icons.location_on,
                      text: "1.7km",
                      iconColor: AppColors.mainColor,
                    ),
                    IconAndText(
                      icon: Icons.watch_later_outlined,
                      text: "32min",
                      iconColor: AppColors.iconColor2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageItem(int index, double scaleFactor, double screenHeight) {
    final height = screenHeight * 0.3; // Moved height calculation here
    Matrix4 getPageMatrix(double currScale) {
      var currTrans = height * (1 - currScale) / 2;
      return Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0.0, currTrans, 0.0);
    }

    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      matrix = getPageMatrix(currScale);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      matrix = getPageMatrix(currScale);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale =
          _scaleFactor + (index - _currentPageValue + 1) * (1 - _scaleFactor);
      matrix = getPageMatrix(currScale);
    } else {
      matrix = getPageMatrix(_scaleFactor);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: height,
            margin: EdgeInsets.only(
              left: 10 * scaleFactor,
              right: 10 * scaleFactor,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30 * scaleFactor),
              color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/image/food0.png"),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120 * scaleFactor,
              margin: EdgeInsets.only(
                left: 40 * scaleFactor,
                right: 40 * scaleFactor,
                bottom: 10 * scaleFactor,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30 * scaleFactor),
                color: Colors.white.withOpacity(0.8),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5 * scaleFactor,
                    offset: Offset(0, 5 * scaleFactor),
                    spreadRadius: 1 * scaleFactor,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5 * scaleFactor, 0),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.all(15 * scaleFactor),
                child: AppColumn()
              ),
            ),
          ),
        ],
      ),
    );
  }
}