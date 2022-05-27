import 'dart:ui';

import 'package:bitmama/screens/dashboard.dart';
import 'package:bitmama/shared/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../data/providers/bit_provider.dart';
import '../utilities/mediaquery.dart';
import '../widgets/spacing.dart';
import 'app_assets.dart';

void submit(BuildContext context) {
    
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 2.0,
          sigmaY: 2.0,
        ),
        child: SizedBox(
          height: height(context) / 2,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                const SizedBox(
                  height: 5.0,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: ListView(
                      children: [
                        Container(
                            height: height(context) / 2,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12))),
                            child: Column(children: [
                              YMargin(24.h),
                              SvgPicture.asset(Assets.check),
                              YMargin(24.h),
                              Text(
                                "Successful!",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: textColor3,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              YMargin(16.h),
                              Text(
                                "Your wallet has been created successfully.",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: textColor1,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              YMargin(48.h),
                              Container(
                                // ignore: prefer_const_constructors
                                decoration: BoxDecoration(
                                    color: bigstone,
                                    //shape: BoxShape.circle,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8))),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 122.5.w, vertical: 17.5),
                                  child: Text(
                                    "Fund Wallet",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.white,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              YMargin(20.h),
                              InkWell(
                                onTap: () {
                                  HapticFeedback.heavyImpact();
                                 
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const Dashboard()));
                                },
                                child: Container(
                                  // ignore: prefer_const_constructors
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8))),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 110.5.w, vertical: 17.5),
                                    child: Text(
                                      "Back to Home",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: textColor1,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
