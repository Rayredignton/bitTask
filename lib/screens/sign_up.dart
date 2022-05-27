import 'package:bitmama/screens/dashboard.dart';
import 'package:bitmama/shared/app_colors.dart';
import 'package:bitmama/shared/bitmama_textfield.dart';
import 'package:bitmama/utilities/mediaquery.dart';
import 'package:bitmama/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../data/providers/bit_provider.dart';
import '../shared/alert.dart';
import '../shared/app_assets.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _value = false;
  int val = -1;
  final emailController = TextEditingController();
  final fullnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  RegExp regExp = RegExp(r'^[0-9]+$');

  @override
  Widget build(BuildContext context) {
    final completed = context.watch<BitProvider>();
    return SafeArea(
      child: Scaffold(
          body: Container(
        height: height(context),
        width: width(context),
        child: Stack(children: [
          Positioned(
            top: -40.w,
            right: -40.w,
            child: Container(
              height: 115.w,
              width: 115.w,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: forestGreen),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: -90.w,
            right: -90.w,
            child: Container(
              height: 210.w,
              width: 210.w,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: forestGreen),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
              top: 60.w, right: -5.w, child: SvgPicture.asset(Assets.tri)),
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            children: [
              YMargin(84.h),
              Text(
                "Create a new \nAccount",
                style: TextStyle(
                  fontSize: 32.sp,
                  color: textColor1,
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.w500,
                ),
              ),
              YMargin(12.h),
              Text(
                " We’re glad you’re here. Please create your account in a few steps.",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: textColor2,
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.w500,
                ),
              ),
              YMargin(40.h),
              BitmamaTextField(
                controller: fullnameController,
                hint: "  First Name and Middle Name",
              ),
              YMargin(30.h),
              BitmamaTextField(
                controller: lastnameController,
                hint: "  Last Name",
              ),
              YMargin(30.h),
              BitmamaTextField(
                controller: usernameController,
                hint: "  Preferred Name/ Username",
              ),
              YMargin(30.h),
              BitmamaTextField(
                controller: phoneController,
                hint: "  Phone Number",
              ),
              YMargin(30.h),
              BitmamaTextField(
                controller: emailController,
                hint: "  Email Address",
              ),
              YMargin(30.h),
              Container(
                height: 55.h,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(9))),
                child: TextField(
                  controller: passwordController,
                  onTap: () {
                    completed.setIsTyping(true);
                  },
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    
                    hintText: "  Password",
                    hintStyle: TextStyle(fontSize: 16),
                  ),
                  onChanged: (string) {
                    
                      string = passwordController.text;
                    
                    if (passwordController.text.length > 7) {
                    
                        completed.setMinNumbers(true);
                   
                    }
                    else if (passwordController.text.contains(RegExp(
                     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                    ))) {
                      completed.setContainCharacter(true);
                    }
                     else if (passwordController.text
                        .contains(RegExp(r'^[0-9]+$'))) {
                   
                        completed.setContainNumber(true);
                     
                    } 
                     else if (passwordController.text.contains("@")
                    ) {
                      completed.setContainCharacter(true);
                    }
                 
                  },
                ),
              ),
              YMargin(8.h),
              if (completed.isTyping == true)
                Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          Assets.tickcircle,
                          color: completed.minNumbers == false
                              ? alizarinCrimson
                              : textColor3,
                        ),
                        XMargin(8.w),
                        Text(
                          "Must be 8 charcters at least",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: completed.minNumbers == false
                                ? alizarinCrimson
                                : textColor3,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    YMargin(8.h),
                    Row(
                      children: [
                        SvgPicture.asset(Assets.tickcircle,color: completed.containCharacter == false
                                ? alizarinCrimson
                                : textColor3,),
                        XMargin(8.w),
                        Text(
                          "Must contain a special character",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: completed.containCharacter == false
                                ? alizarinCrimson
                                : textColor3,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    YMargin(8.h),
                    Row(
                      children: [
                        SvgPicture.asset(
                          Assets.tickcircle,
                          color: completed.containNumber == false
                              ? alizarinCrimson
                              : textColor3,
                        ),
                        XMargin(8.w),
                        Text(
                          "Must contain a number at least",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: completed.containNumber == false
                                ? alizarinCrimson
                                : textColor3,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              YMargin(40.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: (){
                          completed.setTap(true);
                        },
                        child: SvgPicture.asset(
                          completed.tap == false?
                          
                          Assets.emptybox: Assets.checkedbox),
                      ),
                    ],
                  ),
                  XMargin(8.w),
                  Expanded(
                    child: RichText(
                        text: TextSpan(
                            text: 'I have read and agree to Chagera’s ',
                            style: TextStyle(
                                color: textColor2,
                                fontFamily: "Rubik",
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp),
                            children: [
                          TextSpan(
                              text: 'Terms of Service, Privacy Policy and ',
                              style: TextStyle(
                                  color: textColor3,
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp)),
                          TextSpan(
                              text: 'and ',
                              style: TextStyle(
                                  color: textColor3,
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp)),
                          TextSpan(
                              text: 'Card Holder Agreement.',
                              style: TextStyle(
                                  color: textColor3,
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp))
                        ])),
                  ),
                ],
              ),
              YMargin(73.h),
              SizedBox(
                width: 343.w,
                height: 58.h,
                child: DecoratedBox(
                  decoration: const BoxDecoration(),
                  child: ElevatedButton(
                    child: Text(
                      "Create account",
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
                        primary: completed.complete ? bigstone : bombay),
                    onPressed: () {
                      HapticFeedback.heavyImpact();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const Dashboard()));
                    },
                  ),
                ),
              ),
              YMargin(24.h),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "Got an account?",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: textColor1,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                XMargin(6.h),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 14.sp,
                      color: textColor3,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ]),
              YMargin(23.h),
            ],
          )
        ]),
      )),
    );
  }
}
