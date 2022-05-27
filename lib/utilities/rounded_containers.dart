import 'package:bitmama/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedContainers extends StatelessWidget {
  final String  icon;
  final String  text;
  final Color? backgroundColor;
  final VoidCallback? onTap ;

  const RoundedContainers({required this.icon, Key? key, required this.text, this.backgroundColor, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color:backgroundColor,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Center(child: SvgPicture.asset(icon,height: 15,))),
          const SizedBox(height: 5,),
          Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              color: textColor2,
              fontFamily: "Rubik",
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
