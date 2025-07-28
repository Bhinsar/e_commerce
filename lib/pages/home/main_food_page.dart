import 'package:e_commerce/widgets/big_text.dart';
import 'package:e_commerce/widgets/small_text.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 45, bottom: 15),
              padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(text: "India", color: AppColors.mainColor,),
                        Row(
                          children: [
                            SmallText(text: "Rajasthan" , color: Colors.black54,),
                            Icon(Icons.arrow_drop_down, color: Colors.black54,),
                          ],
                        )
                      ],
                    ),
                    Center(
                      child: Container(
                        width: (MediaQuery.of(context).size.width * 0.12).clamp(40.0, 60.0), // Responsive width
                        height: (MediaQuery.of(context).size.width * 0.12).clamp(40.0, 60.0),
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(15),
                      ),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

          ),
          Expanded(child: SingleChildScrollView(child:FoodPageBody(),)),
        ],
      ),
    );
  }
}
