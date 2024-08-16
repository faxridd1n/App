import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/AppIconsPath.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';
import 'package:flutter_application_1/screens/category/CategoryPage.dart';
import 'package:flutter_application_1/screens/category_products/CategoryProductsPage.dart';
import 'package:flutter_application_1/screens/favorite/FavoritePage.dart';
import 'package:flutter_application_1/screens/home/HomePage.dart';
import 'package:flutter_application_1/screens/profile/ProfilePage.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int bottomNavigationBarIndex = 0;
  List navigationPages = [
    HomePage(),
    CategoryPage(),
    CategoryProductsPage(),
    FavoritePage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        onTap: (value) {
          setState(() {
            bottomNavigationBarIndex = value;
          });
        },
        currentIndex: bottomNavigationBarIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 15,
        unselectedFontSize: 15,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.home),
              label: 'Asosiy',
              activeIcon: SvgPicture.asset(
                AppIcons.home,
                color: AppColors.primaryColor,
              )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.category),
              label: 'Katalog',
              activeIcon: SvgPicture.asset(
                AppIcons.category,
                color: AppColors.primaryColor,
              )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.shop),
              label: 'Savatcha',
              activeIcon: SvgPicture.asset(
                AppIcons.category,
                color: AppColors.primaryColor,
              )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.heart),
              label: 'Saqlanganlar',
              activeIcon: SvgPicture.asset(
                AppIcons.heart,
                color: AppColors.primaryColor,
              )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.profile),
              label: 'Profil',
              activeIcon: SvgPicture.asset(
                AppIcons.profile,
                color: AppColors.primaryColor,
              )),
        ],
      ),
      body: Center(
        child: navigationPages[bottomNavigationBarIndex],
      ),
    );
  }
}
