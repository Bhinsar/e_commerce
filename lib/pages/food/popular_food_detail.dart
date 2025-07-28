import 'package:e_commerce/utils/dimensions.dart';
import 'package:e_commerce/widgets/app_column.dart';
import 'package:e_commerce/widgets/app_icon.dart';
import 'package:e_commerce/widgets/expandable_text.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
              child: Container(
                width: double.maxFinite,
                height: screenHeight * 0.4, // 40% of screen height
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/image/food0.png"),
                  ),
                ),
              )
          ),
          Positioned(
            top: screenHeight * 0.05, // 5% from the top
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                ),
              ],
            )
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: screenHeight * 0.35, // 40% from the top
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.height20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(),
                  SizedBox(height: Dimensions.height20),
                  BigText(text: "Introduce"),
                  SizedBox(height: Dimensions.height10),
                  Expanded(child: SingleChildScrollView(child: ExpandableText(text: "This is a popular dish that has been enjoyed by many for generations. It is known for its rich flavors and unique ingredients. The dish is often prepared with a variety of spices and herbs, making it a favorite among food enthusiasts. Whether you are dining at a restaurant or preparing it at home, this dish is sure to delight your taste buds and leave you wanting more. Its popularity continues to grow as more people discover the joy of this culinary masterpiece.")))
                ],
              ),
          ),

          ),
        ]),
      bottomNavigationBar: Container(
        height: screenHeight * 0.1, // 10% of screen height
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width20, vertical: Dimensions.height10),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColors,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.height30, vertical: Dimensions.width20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(width: Dimensions.width10/2),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.width10/2),
                  Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.height30, vertical: Dimensions.width20),
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: BigText(text: "\$10 | Add to cart", color: Colors.white, ),
            )
          ],
        ),

      )
    );
  }
}
