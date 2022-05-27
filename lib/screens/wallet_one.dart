import 'package:bitmama/screens/wallet_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../data/providers/bit_provider.dart';
import '../shared/app_assets.dart';
import '../shared/app_colors.dart';
import '../widgets/spacing.dart';

class CreateWallet extends StatefulWidget {
  const CreateWallet({Key? key}) : super(key: key);

  @override
  State<CreateWallet> createState() => _CreateWalletState();
}

class _CreateWalletState extends State<CreateWallet> {
  List<String> wallets = ["Crypto Wallet", "Fiat Wallet"];
  String wallet = "Choose Wallet";
  @override
  Widget build(BuildContext context) {
    BitProvider completed = context.watch<BitProvider>();
    BitProvider bitProvider() =>
        Provider.of<BitProvider>(context, listen: false);
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
                        },child: SvgPicture.asset(Assets.left))),
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
                            Text(
                              wallet,
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: textColor2,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w400,
                              ),
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
                                    "Choose Wallet",
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
                          itemCount: wallets.length,
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
                                      wallet = wallets[index];
                                       completed.setwalletDropdown(false);
                                        completed.setbuttonColor(true);
                                    },
                                    child: Text(
                                      wallets[index],
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: textColor2,
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.w400,
                                      ),
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
                    "Proceed",
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
                      primary: completed.buttonColor == false ? bombay: bigstone),
                  onPressed: () {
                    HapticFeedback.heavyImpact();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const CreateWalletTwo()));
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
