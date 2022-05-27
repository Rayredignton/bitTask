import 'dart:async';

import 'package:bitmama/data/providers/bit_provider.dart';
import 'package:bitmama/screens/wallet_one.dart';
import 'package:bitmama/shared/alert.dart';
import 'package:bitmama/shared/app_colors.dart';
import 'package:bitmama/shared/bitmama_textfield.dart';
import 'package:bitmama/utilities/dashrect.dart';
import 'package:bitmama/utilities/mediaquery.dart';
import 'package:bitmama/utilities/rounded_containers.dart';
import 'package:bitmama/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import '../data/providers/bit_provider.dart';
import '../shared/app_assets.dart';
import '../utilities/scroll_content.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    pageLength = 3;
    controller = PageController(initialPage: 0);
    Timer(const Duration(seconds: 1), () => alert());
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _nextPage = Tween(begin: 0.0, end: 1.0).animate(_animationController!);

    //Add listener to AnimationController for know when end the count and change to the next page
    _animationController!.addListener(() {
      if (_animationController!.status == AnimationStatus.completed) {
        _animationController!.reset(); //Reset the controller
        final int page = 2; //Number of pages in your PageView
        if (currentIndexPage < page) {
          currentIndexPage++;
          controller!.animateToPage(currentIndexPage.toInt(),
              duration: const Duration(milliseconds: 80), curve: Curves.easeIn);
        } else if (currentIndexPage == 2) {
          _animationController!.reset();
          _animationController!.forward();
        } else {
          currentIndexPage = 0;
        }
      }
      _animationController!.forward();
    });
  }

  AnimationController? _animationController;
  Animation<double>? _nextPage;

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30.w : 6.w,
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
          color: isActive ? jewel : skeptic,
          borderRadius: BorderRadius.circular(10)
          // shape: BoxShape.circle
          ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i <= 2; i++) {
      if (currentIndexPage == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }

  void alert() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: CustomAlert(),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ));
  }

  double currentIndexPage = 0;
  PageController? controller;
  var pageLength;

  @override
  Widget build(BuildContext context) {
    if (currentIndexPage == 3) _animationController?.reset();

    _animationController?.forward();

    BitProvider completed = context.watch<BitProvider>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: athensGrey,
        body: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  if (completed.walletCreated == false)
                    Padding(
                      padding: EdgeInsets.only(top: 148.w, right: 21.w, left: 21),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const CreateWallet()));
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Transform.rotate(
                              angle: -pi / 15,
                              child: Transform.scale(
                                scale: 1,
                                child: Container(
                                  width: 335.w,
                                  height: 200.h,
                                  decoration: BoxDecoration(
                                      color: bombay,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(24.r))),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const CreateWallet()));
                              },
                              child: Container(
                                width: 335.w,
                                height: 200.h,
                                decoration: BoxDecoration(
                                    color: bigstone,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(24.r))),
                                child: Column(
                                  children: [
                                    YMargin(56.h),
                                    Stack(alignment: Alignment.center, children: [
                                      Container(
                                        width: 175.w,
                                        height: 101.h,
                                        decoration: BoxDecoration(
                                            color: bigstone,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.r))),
                                        child: DashedRect(
                                          color: shuttleGrey,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "Create Wallet",
                                            style: TextStyle(
                                              decoration: TextDecoration.underline,
                                              fontSize: 18.sp,
                                              color: Colors.white,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          YMargin(18.h),
                                          SvgPicture.asset(Assets.add)
                                        ],
                                      ),
                                    ]),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    Padding(
                      padding: EdgeInsets.only(top: 68.w, left: 21.w, right: 21.w),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Hi, Raymond",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: textColor2,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    YMargin(4.h),
                                    Text(
                                      "Welcome Back",
                                      style: TextStyle(
                                        fontSize: 24.sp,
                                        color: textColor1,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                SvgPicture.asset(Assets.notification),
                              ]),
                          Container(
                            height: 312.h,
                            width: width(context),
                            child: PageView.builder(
                                physics: const BouncingScrollPhysics(),
                                controller: controller,
                                itemCount: 3,
                                onPageChanged: (index) {
                                  setState(() {
                                    currentIndexPage = index.toDouble();
                                  });
                                },
                                itemBuilder: (_, i) {
                                  return Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Transform.rotate(
                                        angle: contents[i].angle,
                                        child: Transform.scale(
                                            scale: 1,
                                            child: Container(
                                              child: Image.asset(contents[i].image),
                                            )),
                                      ),
                                      Transform.rotate(
                                        angle: contents[i].angle3,
                                        child: Transform.scale(
                                            scale: 1,
                                            child: Container(
                                              child: Image.asset(contents[i].image2),
                                            )),
                                      ),
                                      // Container(
                                      //   child: Image.asset(contents[i].image2),
                                      // ),
                                    ],
                                  );
                                }),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: _buildIndicator(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (completed.walletCreated == false)
                    Padding(
                      padding: const EdgeInsets.only(top: 28.0),
                      child: SvgPicture.asset(Assets.green),
                    ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 21.w),
                    child: Container(
                      width: 335.w,
                      // ignore: prefer_const_constructors
                      decoration: BoxDecoration(
                          color: Colors.white,
                          //shape: BoxShape.circle,
                          borderRadius: const BorderRadius.all(Radius.circular(24))),
                      child: Column(
                        children: [
                          YMargin(28.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                RoundedContainers(
                                  icon: Assets.send,
                                  text: "Send Money",
                                  backgroundColor: oldlace,
                                ),
                                RoundedContainers(
                                  icon: Assets.convert,
                                  text: "Convert",
                                  backgroundColor: hawksBlue,
                                ),
                                RoundedContainers(
                                  icon: Assets.airtime,
                                  text: "Airtime & Data",
                                  backgroundColor: blueChalk,
                                ),
                              ],
                            ),
                          ),
                          YMargin(24.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                RoundedContainers(
                                  icon: Assets.virtual,
                                  text: "Virtual Acc",
                                  backgroundColor: hawksBlue,
                                ),
                                RoundedContainers(
                                  icon: Assets.ticket,
                                  text: "Tickets & Events",
                                  backgroundColor: bridesmaid,
                                ),
                                RoundedContainers(
                                  icon: Assets.more,
                                  text: "          More       ",
                                  backgroundColor: bridesmaid,
                                ),
                              ],
                            ),
                          ),
                          YMargin(24.h),
                        ],
                      ),
                    ),
                  ),
                  YMargin(38.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 21.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recent Transactions",
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: textColor1,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "see all",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: textColor1,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (completed.walletCreated == false)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 21.w),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 74.w),
                            child: Image.asset(
                              Assets.iilustration,
                              height: 128.h,
                              width: 172.w,
                            ),
                          ),
                          YMargin(30.h),
                          Center(
                            child: Text(
                              "No transactions yet.",
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: textColor1,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 21.w),
                      child: Column(
                        children: [
                          ListTile(
                            leading: SvgPicture.asset(Assets.spotfy),
                            title: Text(
                              "Spotify",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: textColor1,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(
                              "09:14 am",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: textColor1,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            trailing: Text(
                              "N10,000.00",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: alizarinCrimson,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          ListTile(
                            leading: SvgPicture.asset(Assets.spotfy),
                            title: Text(
                              "Spotify",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: textColor1,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(
                              "03-04-2022",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: textColor1,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            trailing: Text(
                              "N10,000.00",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: textColor3,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  YMargin(25.h),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                  decoration: BoxDecoration(
                          color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 33.w,vertical: 30.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                    SvgPicture.asset(Assets.home),
                     SvgPicture.asset(Assets.wallet),
                      SvgPicture.asset(Assets.card),
                       SvgPicture.asset(Assets.profile),

                  ]),
                ),),
            ),

                    YMargin(16.h),
                
          ],
        ),
      ),
    );
  }
}
