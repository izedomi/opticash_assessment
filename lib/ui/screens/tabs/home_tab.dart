import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:opticash/app/constants/font_family.dart';
import 'package:opticash/app/constants/globals.dart';
import 'package:opticash/app/models/menu_dashboard.dart';
import 'package:opticash/app/utils/app_utils.dart';
import 'package:opticash/app/vm/home_vm.dart';
import 'package:opticash/ui/utils/app_color.dart';
import 'package:opticash/ui/utils/media_query.dart';
import 'package:opticash/ui/utils/space.dart';

import 'package:opticash/ui/widgets/busy_overlay.dart';
import 'package:opticash/ui/widgets/menu_dashboard_card.dart';

import '../../../app/constants/png_image_asset.dart';
import '../../widgets/pattern_money.dart';
import '../../widgets/profile_widget.dart';
import 'package:badges/badges.dart' as badges;

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<MenuDashboard> menu = [
    MenuDashboard(
        label: "Refer a friend and earn \$3 per referral",
        img: PngImageAsset.refer,
        bgColor: AppColor.darkGreen),
    MenuDashboard(
        label: "Create a virtual account and start sending",
        img: PngImageAsset.pay,
        bgColor: AppColor.darkBrown),
  ];

  bool showBalance = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserVM>(builder: (context, vm, _) {
      return BusyOverlay(
        child: Scaffold(
          backgroundColor: AppColor.white,
          body: SizedBox(
            width: deviceWidth(context),
            height: deviceHeight(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: deviceWidth(context),
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 60.h, bottom: 16.h),
                  decoration: BoxDecoration(color: AppColor.white, boxShadow: [
                    BoxShadow(
                        color: AppColor.black.withOpacity(0.1),
                        blurRadius: 11,
                        spreadRadius: -5,
                        offset: const Offset(0, 8))
                  ]),
                  child: profileCard(context),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      const PatternMoneyBg(),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            VSpace(22.h),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 22.w),
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Container(
                                    width: deviceWidth(context),
                                    height: 168.h,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: AppColor.black,
                                        borderRadius:
                                            BorderRadius.circular(14.r)),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          right: 19.w,
                                          top: 100.h,
                                          child: Image.asset(
                                            PngImageAsset.walletStrip,
                                            fit: BoxFit.contain,
                                            width: 150.w,
                                          ),
                                        ),
                                        Positioned(
                                          right: 50.w,
                                          top: 50.h,
                                          child: Image.asset(
                                            PngImageAsset.walletStrip,
                                            fit: BoxFit.contain,
                                            width: 150.w,
                                          ),
                                        ),
                                        Positioned(
                                          right: 80.w,
                                          top: 0,
                                          child: Image.asset(
                                            PngImageAsset.walletStrip,
                                            fit: BoxFit.contain,
                                            width: 150.w,
                                          ),
                                        ),
                                        // Image.asset(
                                        //   PngImageAsset.walletStrip,
                                        //   fit: BoxFit.contain,
                                        // ),
                                        // Positioned(
                                        //     right: 0,
                                        //     bottom: 0,
                                        //     child: Text('s',
                                        //         style: TextStyle(
                                        //           color: AppColor.red,
                                        //         ))),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            VSpace(20.h),
                                            Container(
                                              width: double.infinity,
                                              margin: EdgeInsets.only(
                                                  left: 60.w, right: 60.w),
                                              height: 31.h,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color:
                                                      AppColor.navActiveColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          17.r)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    PngImageAsset.coin,
                                                    width: 24.w,
                                                    height: 24.w,
                                                  ),
                                                  Text(
                                                    "Opticash Balance",
                                                    style: TextStyle(
                                                        color: AppColor.white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14.sp),
                                                  ),
                                                  HSpace(11.w),
                                                  Image.asset(
                                                    PngImageAsset.dropArrow,
                                                    width: 16.w,
                                                    height: 16.w,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            VSpace(20.h),
                                            Text(
                                              showBalance
                                                  ? "\$243,000"
                                                  : "*****",
                                              style: TextStyle(
                                                  color: AppColor.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 40.sp),
                                            ),
                                            VSpace(4.h),
                                            Text(
                                              "123848492920304.234 (OPCH)",
                                              style: TextStyle(
                                                  color: AppColor.lightGreen,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 10.sp),
                                            ),
                                            VSpace(10.h),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  showBalance = !showBalance;
                                                });
                                              },
                                              child: showBalance
                                                  ? Image.asset(
                                                      PngImageAsset.eyeSlash,
                                                      width: 24.w,
                                                      height: 24.w,
                                                    )
                                                  : const Icon(
                                                      Iconsax.eye,
                                                      color: AppColor.white,
                                                    ),
                                            ),
                                            //
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 72.h,
                                    decoration: BoxDecoration(
                                        color: AppColor.mercuryWhite,
                                        borderRadius:
                                            BorderRadius.circular(14.r)),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          walletActionBtns(
                                              PngImageAsset.arrowSend,
                                              "Send Money"),
                                          HSpace(24.w),
                                          walletActionBtns(
                                              PngImageAsset.topUp, "Top-Up"),
                                          HSpace(24.w),
                                          walletActionBtns(PngImageAsset.bank,
                                              "Account Details",
                                              addDivider: false),
                                        ]),
                                  ),

                                  // Positioned.fill(
                                  //   child: Image.asset(PngImageAsset.balanceBg,
                                  //       fit: BoxFit.cover),
                                  // )
                                ],
                              ),
                            ),
                            VSpace(22.h),
                            SizedBox(
                              height: 134.h,
                              // margin: EdgeInsets.only(right: 10.w),
                              child: ListView(
                                  // controller: _pageController,
                                  padding: EdgeInsets.only(left: 16.w),
                                  scrollDirection: Axis.horizontal,
                                  children: menu
                                      .map((item) => MenuDashboardCard(
                                          img: item.img,
                                          label: item.label,
                                          bgColor: item.bgColor))
                                      .toList()),
                            ),
                            VSpace(24.h),
                            _transactionHistory(
                                1,
                                "Today, ${AppUtils.dayWithSuffixMonthAndYear(DateTime.now())}",
                                AppUtils.dayMonthYear(DateTime.now())),
                            _transactionHistory(
                                2,
                                "Yesterday, ${AppUtils.dayWithSuffixMonthAndYear(DateTime.now().subtract(const Duration(days: 1)))}",
                                AppUtils.dayMonthYear(DateTime.now()
                                    .subtract(const Duration(days: 1)))),
                            _transactionHistory(
                                10,
                                "Older",
                                AppUtils.dayMonthYear(DateTime.now()
                                    .subtract(const Duration(days: 30)))),
                            VSpace(50.h)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _transactionHistory(count, String label, String date) {
    List<Widget> content = [];
    content.add(VSpace(16.h));
    content.add(_titleItem(label));
    content.add(VSpace(8.h));

    for (int i = 0; i < count; i++) {
      String img = PngImageAsset.nigeria;
      if (i % 2 == 0) {
        img = PngImageAsset.benin;
      }
      if (i % 2 == 1) {
        img = PngImageAsset.guinea;
      }
      if (i == 0) {
        img = PngImageAsset.nigeria;
      }
      content.add(InkWell(
          onTap: () {},
          child: Container(
            width: deviceHeight(context),
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            decoration: BoxDecoration(
                color: AppColor.ratoGrey,
                border: Border.all(color: AppColor.wiGrey),
                borderRadius: BorderRadius.circular(10.r)),
            child: Row(
              children: [
                Image.asset(
                  img,
                  // PngImageAsset.benin,
                  width: 28.w,
                  height: 28.w,
                  fit: BoxFit.cover,
                ),
                HSpace(13.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      i % 2 == 0
                          ? "Transfer to James"
                          : "Recieved for Jennifer",
                      style: TextStyle(
                          color: AppColor.wiBlack,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    VSpace(6.h),
                    Row(
                      children: [
                        Container(
                          width: 8.w,
                          height: 8.w,
                          decoration: BoxDecoration(
                              color: i % 2 == 0
                                  ? AppColor.pendingOrange
                                  : AppColor.kayGreen,
                              shape: BoxShape.circle),
                        ),
                        HSpace(4.w),
                        Text(i % 2 == 0 ? "Pending" : "Completed",
                            style: TextStyle(
                                color: i % 2 == 0
                                    ? AppColor.pendingOrange
                                    : AppColor.kayGreen,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(i % 2 == 0 ? "-N1,090" : "+N34,000",
                        style: TextStyle(
                            color: i % 2 == 0
                                ? AppColor.statusRed
                                : AppColor.brandGreen,
                            fontSize: 12.sp,
                            fontFamily: poppins,
                            fontWeight: FontWeight.w600)),
                    VSpace(6.h),
                    Text(date,
                        style: TextStyle(
                            color: AppColor.fomoGrey,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400)),
                  ],
                )
              ],
            ),
          )));
      content.add(VSpace(16.h));
    }
    return count < 1 ? const SizedBox() : Column(children: content);
  }

  Widget _titleItem(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColor.wiBlack,
                fontSize: 16.sp,
              )),
        ),
      ],
    );
  }

  Widget walletActionBtns(String img, String label, {bool addDivider = true}) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 33.w,
              height: 33.w,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColor.kayGreen),
              child: Image.asset(
                img,
                width: 16.w,
                height: 16.w,
              ),
            ),
            VSpace(6.h),
            Text(
              label,
              style: TextStyle(
                  color: AppColor.bakoBlack,
                  fontWeight: FontWeight.w500,
                  fontSize: 10.sp),
            ),
          ],
        ),
        if (addDivider) HSpace(12.w),
        if (addDivider)
          const VerticalDivider(
            width: 10,
            indent: 16,
            endIndent: 16,
          )
      ],
    );
  }

  Widget profileCard(BuildContext context) {
    // double width = 36.w;
    return SizedBox(
      width: deviceWidth(context),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Consumer<UserVM>(builder: (context, userVM, _) {
          return Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileCardWidget(
                  width: 48.w,
                  firstName: userVM.user?.firstName ?? "",
                  fullName:
                      "${userVM.user?.firstName} ${userVM.user?.lastName}",
                  profilePhoto: url),
              SizedBox(width: 12.w),
              Flexible(
                flex: 10,
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Hello, ${userVM.user?.firstName}",
                              style: TextStyle(
                                  color: AppColor.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                  overflow: TextOverflow.ellipsis)),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text("@${userVM.user?.userName}",
                              style: TextStyle(
                                color: AppColor.fomoGrey,
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp,
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              HSpace(12.w),
              Flexible(
                flex: 5,
                child: Row(
                  children: [
                    _actionButton(PngImageAsset.history),
                    HSpace(5.w),
                    _actionButton(PngImageAsset.bell, count: "2")
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _actionButton(String img, {String? count}) {
    return badges.Badge(
        position: badges.BadgePosition.topEnd(top: -10, end: 0),
        badgeStyle: const badges.BadgeStyle(badgeColor: Color(0xffFF4040)),
        badgeContent: count != null
            ? Text(
                count,
                style: const TextStyle(color: AppColor.white),
              )
            : Container(
                width: 5.w,
                height: 5.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
              ),
        child: Container(
            width: 42.w,
            height: 42.w,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: AppColor.mercuryWhite, shape: BoxShape.circle),
            child: Image.asset(
              img,
              width: 19.w,
              height: 19.w,
            )));
  }
}
