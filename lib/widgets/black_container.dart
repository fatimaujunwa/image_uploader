import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/text_dimensions.dart';

class BlackContainer extends StatelessWidget {
  const BlackContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41.h,
      width: 300.w,
      margin: EdgeInsets.only(top: 20.h),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Theme.of(context).dividerColor,
            Theme.of(context).dividerColor
          ], begin: Alignment.center, end: Alignment.bottomLeft),
          borderRadius: BorderRadius.circular(8.r)),
      child: Center(
          child: Text(
            'Upload To Server',
            style: TextDimension.style2,
          )),
    );
  }
}