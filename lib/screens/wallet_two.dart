import 'package:bitmama/shared/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../data/providers/bit_provider.dart';
import '../shared/app_assets.dart';
import '../shared/app_colors.dart';
import '../widgets/spacing.dart';
import 'dashboard.dart';

class CreateWalletTwo extends StatefulWidget {
  const CreateWalletTwo({Key? key}) : super(key: key);

  @override
  State<CreateWalletTwo> createState() => _CreateWalletTwoState();
}

class _CreateWalletTwoState extends State<CreateWalletTwo> {
  List<String> currencies = ["NGN", "GHC", "KES", "USD", "GBP", "EUR"];
  String currency = "Select Country/ Currency";
  String image= "";

  List<String> images = [
    Assets.ng,
    Assets.gh,
    Assets.kes,
    Assets.usd,
    Assets.gbp,
    Assets.gbp
  ];
  @override
  Widget build(BuildContext context) {
    BitProvider completed = context.watch<BitProvider>();

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                children: [
                  YMargin(32.h),
                  Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: (){
                          HapticFeedback.heavyImpact();
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(Assets.left))),
                  YMargin(36.h),
                  Text(
                    "Create New Wallet",
                    style: TextStyle(
                      fontSize: 24.sp,
                      color: textColor1,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  YMargin(12.h),
                  Text(
                    "We’re glad you’re here. Please create your account in a few steps.",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: textColor2,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  YMargin(36.h),
                  if (completed.walletDropdown == false)
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          )),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          
                            Row(
                              children: [
                                 if(image.isNotEmpty)
                                Image.asset(
                                  image,
                                  height: 16.h,
                                  width: 24.w,
                                ),
                                XMargin(16.w),
                                Text(
                                  currency,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: textColor2,
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                        

                            InkWell(
                                onTap: () {
                                  completed.setwalletDropdown(true);
                                },
                                child: SvgPicture.asset(Assets.down))
                          ],
                        ),
                      ),
                    )
                  else
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Select Country/ Currency",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: textColor2,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        YMargin(10.h),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              )),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Search item",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: textColor2,
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                if (completed.walletDropdown == false)
                                  InkWell(
                                      onTap: () {
                                        completed.setwalletDropdown(true);
                                      },
                                      child: SvgPicture.asset(Assets.down))
                                else
                                  InkWell(
                                      onTap: () {
                                        completed.setwalletDropdown(false);
                                      },
                                      child: SvgPicture.asset(Assets.up)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (completed.walletDropdown == true)
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          )),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: currencies.length,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                YMargin(20.h),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 20.w, bottom: 12.w),
                                  child: InkWell(
                                    onTap: () {
                                      currency = currencies[index];
                                      image = images[index];
                                      completed.setwalletDropdown(false);
                                      completed.setbuttonColor2(true);
                                    },
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          images[index],
                                          height: 15.h,
                                          width: 24.w,
                                        ),
                                        XMargin(16.w),
                                        Text(
                                          currencies[index],
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            color: textColor2,
                                            fontFamily: 'Rubik',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                    )
                ],
              ),
            ),
            SizedBox(
              width: 343.w,
              height: 58.h,
              child: DecoratedBox(
                decoration: const BoxDecoration(),
                child: ElevatedButton(
                  child: Text(
                    "Create Wallet",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontFamily: 'poppings',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      primary:
                          completed.buttonColor2 == false ? bombay : bigstone),
                  onPressed: () {
                    HapticFeedback.heavyImpact();
                      completed.setwalletCreated(true);
                    submit(context);
                
                  },
                ),
              ),
            ),
            YMargin(40.h),
          ],
        ),
      ),
    );
  }
}
