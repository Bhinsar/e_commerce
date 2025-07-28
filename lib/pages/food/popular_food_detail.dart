import 'package:e_commerce/utils/dimensions.dart';
import 'package:e_commerce/widgets/app_icon.dart';
import 'package:flutter/material.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
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
              child:AppIcon(icon: Icons.arrow_back_ios, backgroundColor: Colors.white, iconColor: Colors.black, size: Dimensions.iconSize24,)
          )
        ],
      ),
    );
  }
}
