import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';

// ignore: must_be_immutable
class TitleWidget extends StatelessWidget {
  TitleWidget({required this.titleText, required this.withSeeAllButton});
  bool withSeeAllButton;
  String titleText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          withSeeAllButton
              ? SizedBox(
                  width: MediaQuery.of(context).size.width * 0.48,
                  child: Text(
                    titleText,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              : SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text(
                    titleText,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
         withSeeAllButton? ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
              elevation: 0,
              backgroundColor: AppColors.seeAllButtonColor,
            ),
            onPressed: () {},
            child: const Row(
              children: [
                Text(
                  'Смотреть всё',
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 12
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.green,
                )
              ],
            ),
          ):SizedBox()
        ],
      ),
    );
  }
}
