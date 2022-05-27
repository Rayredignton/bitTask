import 'package:bitmama/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/spacing.dart';
import 'app_assets.dart';
class CustomAlert extends StatelessWidget {
  const CustomAlert({ Key? key }) : super(key: key);

  @override
   Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
          YMargin(30.h),
        Container(
          height: 75.h,
          width: 329.w,
             decoration: BoxDecoration(
                        border: Border.all(color: bombay),
                        borderRadius: BorderRadius.all(Radius.circular(8.r))),
                        child: Padding(
                          padding: EdgeInsets.only(top: 5.w),
                          child: Row(
                            children: [
                              Column(

                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(left:18.w, right:13.w),
                                    child: SvgPicture.asset(Assets.info),
                                  )
                                ],
                              ),
                               Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:[
                                   
                                  
                                      Text(
                                                    "Account verification pending. Features would be available once approved",
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: textColor1,
                                                      fontFamily: 'Rubik',
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                    
                                    
                                  ]
                                ),
                              )
                            ],
                          ),
                        )
          
        ),
      ],
    );
  }
}