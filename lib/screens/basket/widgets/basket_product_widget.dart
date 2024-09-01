import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/AppIconsPath.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';
import 'package:flutter_application_1/models/products_model/parent_category_model.dart';
import 'package:flutter_application_1/screens/basket/BasketPage.dart';
import 'package:flutter_svg/flutter_svg.dart';
bool isSelected = false;
// ignore: must_be_immutable
class BasketProductWidget extends StatefulWidget {
  BasketProductWidget({required this.model, super.key});
  ParentCategoryModel model;
  @override
  State<BasketProductWidget> createState() => _BasketProductWidgetState();
}

class _BasketProductWidgetState extends State<BasketProductWidget> {
  
  int productCount = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      width: MediaQuery.of(context).size.width,
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(
                height: 24,
                width: 24,
                child: Checkbox(
                  checkColor: Colors.white,
                  activeColor: AppColors.green,
                  value: isSelected,
                  onChanged: (value) {
                    setState(() {
                      isSelected = value!;
                      if (isSelected) {
                        selectedProducts.add(widget.model);
                      } else {
                        selectedProducts.remove(widget.model);
                      }
                    });
                  },
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              SizedBox(
                height: 90,
                width: 60,
                child: Image.network(
                  widget.model.variations[0].files[0].url,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            '182 132 сум',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: AppColors.yellow,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            child: const Text(
                              'x 12 мес',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        '180 000 сум',
                        style: TextStyle(
                          // decoration: TextDecoration.lineThrough,
                          color: AppColors.grey3,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: const Text(
                          'Цифровой мультиметр UNI-T UT890C',
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    for (var e in basketProducts) {
                      if (e.id == widget.model.id) {
                        basketProducts.remove(e);
                        setState(() {});
                      }
                    }
                  });
                },
                child: Container(
                  height: 25,
                  width: 25,
                  child: SvgPicture.asset(
                    AppIcons.xIcon,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        productCount != 0
                            ? productCount -= 1
                            : productCount = 0;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColors.grey3,
                      ),
                      child: const Icon(
                        Icons.remove,
                        size: 25,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    productCount.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        productCount += 1;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColors.grey3,
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
