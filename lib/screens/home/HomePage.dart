import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/AppIconsPath.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';
import 'package:flutter_application_1/screens/home/drawer/DrawerPage.dart';
import 'package:flutter_application_1/screens/home/widgets/BannerWidget.dart';
import 'package:flutter_application_1/screens/home/widgets/BottomCardWidget.dart';
import 'package:flutter_application_1/screens/home/widgets/CategoryWidget.dart';
import 'package:flutter_application_1/screens/home/widgets/PartnerWidget.dart';
import 'package:flutter_application_1/screens/home/widgets/HomePopUpItem.dart';
import 'package:flutter_application_1/screens/home/widgets/TitleWidget.dart';
import 'package:flutter_application_1/screens/home/widgets/TopProductsWidget.dart';
import 'package:flutter_application_1/service/category/CategoryService.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController(viewportFraction: 0.85, keepPage: true);
  ScrollController scrollController = ScrollController();
  String selectedItem = 'Toshkent shahri';
  bool popUpIsOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
          );
        }),
        elevation: 1,
        shadowColor: Colors.black,
        actions: [
          HomePopUpMenuWidget(false, AppIcons.location),
        ],
      ),
      drawer: DrawerPage(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(
              color: AppColors.grey3,
              height: 0.5,
            ),
            Container(
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 1,
                      color: AppColors.grey3,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 1,
                      color: AppColors.grey3,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  hintText: 'Mahsulot qidirish...',
                  hintStyle: const TextStyle(
                    color: AppColors.grey2,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  filled: true,
                  fillColor: AppColors.grey1,
                  prefixIcon: SvgPicture.asset(
                    AppIcons.search,
                    width: 22,
                    height: 22,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                cursorColor: AppColors.primaryColor,
              ),
            ),
            const Divider(
              color: AppColors.grey3,
              height: 0.5,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 141,
              child: PageView.builder(
                controller: controller,
                itemCount: 4,
                itemBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: BannerWidget(),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.grey3,
                  borderRadius: BorderRadius.circular(100)),
              padding: const EdgeInsets.all(7),
              child: SmoothPageIndicator(
                controller: controller,
                count: 4,
                effect: const ColorTransitionEffect(
                  activeDotColor: AppColors.green,
                  dotHeight: 7,
                  dotWidth: 7,
                ),
              ),
            ),
            TitleWidget(
              titleText: 'Kategoriyalar',
              withSeeAllButton: false,
            ),
            SizedBox(
              height: 130,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return CategoryWidget(index);
                },
              ),
            ),
            TitleWidget(
              titleText: 'Sotuv xitlari',
              withSeeAllButton: true,
            ),
            FutureBuilder(
              future: GetCategoryService.getCategory(),
              builder: (context, snapshot) => 
              snapshot.hasData?
               SizedBox(
                      width: double.infinity,
                      height: 470,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: TopProductsWidget(
                              index: index,
                              model: snapshot.data![index],
                            ),
                          );
                        },
                      ),
                    )
                  : 
                  Container(
                      child: Center(
                          child: Text(
                        '${snapshot.data.toString()}',
                        maxLines: 100,
                        
                      )
                          // CircularProgressIndicator(
                          //   strokeWidth: 6,
                          // ),
                          ),
                    ),
            ),
            TitleWidget(
              titleText: 'Hamkor kompaniyalar',
              withSeeAllButton: true,
            ),
            SizedBox(
              width: double.infinity,
              height: 350,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: PartnerWidget(
                      isSingle: false,
                    ),
                  );
                },
              ),
            ),
            TitleWidget(
              titleText: 'Hamkor kompaniyalar',
              withSeeAllButton: true,
            ),
            SizedBox(
              width: double.infinity,
              height: 350,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: PartnerWidget(
                      isSingle: false,
                    ),
                  );
                },
              ),
            ),
            BottomInfoWidget()
          ],
        ),
      ),
    );
  }
}
