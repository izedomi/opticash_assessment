import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opticash/app/constants/font_family.dart';
import 'package:opticash/ui/screens/tabs/account_tab.dart';
import 'package:opticash/ui/screens/tabs/card_tab.dart';
import 'package:opticash/ui/screens/tabs/home_tab.dart';
import 'package:opticash/ui/screens/tabs/swap_tab.dart';
import '../../app/constants/png_image_asset.dart';
import '../../app/models/bottom_nav.dart';
import '../utils/app_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<BottomNav> bottomNav = [
    BottomNav(
        path: PngImageAsset.home,
        activePath: PngImageAsset.home,
        name: 'Home',
        width: 25.w,
        height: 25.w),
    BottomNav(
        path: PngImageAsset.card,
        activePath: PngImageAsset.card,
        name: 'Card',
        width: 25.w,
        height: 25.w),
    BottomNav(
        path: PngImageAsset.swap,
        activePath: PngImageAsset.swap,
        name: 'Send',
        width: 25.w,
        height: 25.w),
    BottomNav(
        path: PngImageAsset.swap,
        activePath: PngImageAsset.swap,
        name: 'Swap',
        width: 35.w,
        height: 35.w),
    BottomNav(
        path: PngImageAsset.account,
        activePath: PngImageAsset.account,
        name: 'Account',
        width: 28.w,
        height: 28.w),
  ];
  List screens = [
    const HomeTab(),
    const CardTab(),
    const SizedBox(),
    const SwapTab(),
    const AccountTab()
  ];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarBrightness: Brightness.light));

    List<String> s = ["swap"];

    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: screens[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColor.white,
          elevation: 10,
          showUnselectedLabels: true,
          selectedItemColor: AppColor.navActiveColor,
          unselectedItemColor: AppColor.fomoGrey,
          unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 10.sp,
              fontFamily: poppins),
          selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 10.sp,
              fontFamily: poppins),
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: bottomNav
              .map((data) => BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(
                      top: 3.0,
                      bottom: s.contains(data.name.toLowerCase()) ? 0.w : 10.h,
                    ),
                    child: Image.asset(
                      data.path,
                      width: data.width,
                      height: data.height,
                      color: AppColor.navInactiveColor,
                    ),
                  ),
                  activeIcon: Padding(
                    padding: EdgeInsets.only(
                      top: 3.0,
                      bottom: s.contains(data.name.toLowerCase()) ? 0.w : 10.h,
                    ),
                    child: Image.asset(
                      data.activePath,
                      width: data.width,
                      height: data.height,
                      color: AppColor.navActiveColor,
                    ),
                  ),
                  label: data.name))
              .toList()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Image.asset(
        PngImageAsset.send,
        width: 75.w,
        height: 75.w,
      ),
      // floatingActionButton: Container(
      //   width: deviceHeight(context) < 534 ? 60.h : 60.h,
      //   height: deviceHeight(context) < 534 ? 60.h : 60.h,
      //   child: FloatingActionButton(
      //       elevation: 0,
      //       backgroundColor: AppColor.brandGreen,
      //       onPressed: () {},
      //       child: const Icon(
      //         Icons.add,
      //         color: Colors.white,
      //         size: 30,
      //       )),
      // ),
    );
  }
}
