import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';
import 'package:flutter_application_1/models/category/parent_category_model.dart';
import 'package:flutter_application_1/screens/home/other_pages/ProductDetailPage1.dart';

// ignore: must_be_immutable
class ProductWidget extends StatelessWidget {
  ProductWidget({required this.index, required this.model, super.key});
  int index;
  ParentCategoryModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage1(
              model: model,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Wrap(
            children: [
              Card(
                elevation: 5,
                shadowColor: Colors.black,
                color: Colors.white,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        model.variations[0].files[0].url,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${model.variations[0].prices[1].value.toInt()} сум',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Text(
                                '180 000 сум',
                                style: TextStyle(
                                    // decoration: TextDecoration.lineThrough,
                                    color: AppColors.grey3),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: AppColors.yellow,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 2,
                            ),
                            child: Text(
                              'x 12 мес',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        model.name,
                        maxLines: 2,
                        style: const TextStyle(fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: AppColors.green,
                                ),
                                onPressed: () {},
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 15,
                                  ),
                                  child: Text(
                                    'в корзину',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: AppColors.grey3,
                              ),
                              onPressed: () {},
                              child: Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
