import 'package:flutter/material.dart';
import 'package:foody_bite/controllers/cart_controller.dart';
import 'package:foody_bite/pages/home/main_food_page.dart';
import 'package:foody_bite/utils/app_constants.dart';
import 'package:foody_bite/utils/colors.dart';
import 'package:foody_bite/utils/dimensions.dart';
import 'package:foody_bite/widgets/app_icon.dart';
import 'package:foody_bite/widgets/big_text.dart';
import 'package:foody_bite/widgets/small_text.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height20 * 3,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize20,
                ),
                SizedBox(
                  width: Dimensions.width20 * 7,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const MainFoodPage());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize20,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_bag_outlined,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize20,
                )
              ],
            ),
          ),
          Positioned(
            top: Dimensions.height20 * 6,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(
                  builder: (cartController) {
                    return ListView.builder(
                        itemCount: cartController.getItems.length,
                        itemBuilder: (_, index) {
                          return Container(
                            height: 100,
                            width: double.maxFinite,
                            margin:
                                EdgeInsets.only(bottom: Dimensions.height10),
                            child: Row(children: [
                              Container(
                                width: Dimensions.width20 * 5,
                                height: Dimensions.height20 * 5,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(AppConstants.BASE_URL +
                                        AppConstants.UPLOAD_URL +
                                        cartController.getItems[index].img!),
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20),
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: Dimensions.width10,
                              ),
                              Expanded(
                                child: Container(
                                  height: Dimensions.height20 * 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      BigText(
                                          text: cartController
                                              .getItems[index].name!),
                                      const SmallText(
                                        text: "Spicy",
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(
                                            text: cartController
                                                .getItems[index].price
                                                .toString(),
                                            color: Colors.redAccent,
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: Dimensions.height10,
                                                horizontal: Dimensions.width10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius20),
                                              color: Colors.white,
                                            ),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    //popularProduct.setQuantity(false);
                                                  },
                                                  child: const Icon(
                                                    Icons.remove,
                                                    color: AppColors.signColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                    width:
                                                        Dimensions.width10 / 2),
                                                const BigText(
                                                  text: "0",
                                                ), //popularProduct.inCartItems.toString()),
                                                SizedBox(
                                                    width:
                                                        Dimensions.width10 / 2),
                                                GestureDetector(
                                                  onTap: () {
                                                    //popularProduct.setQuantity(true);
                                                  },
                                                  child: const Icon(
                                                    Icons.add,
                                                    color: AppColors.signColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                          );
                        });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
