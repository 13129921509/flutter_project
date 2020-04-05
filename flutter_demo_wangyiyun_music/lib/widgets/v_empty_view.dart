import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VEmptyView extends StatelessWidget{
  
  final double height;
  
  VEmptyView(this.height);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: ScreenUtil().setHeight(height),
    );
  }
  
}