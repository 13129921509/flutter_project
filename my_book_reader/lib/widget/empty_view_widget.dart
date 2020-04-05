import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
class EmptyViewWidget extends StatelessWidget{
	final double width;
	final double height;
	EmptyViewWidget({this.width,this.height});
	
  @override
  Widget build(BuildContext context) {
    if(width!=null){
      return SizedBox(
        width: ScreenUtil().setWidth(width),
      );
    }else{
      return SizedBox(
        height: ScreenUtil().setHeight(height),
      );
    }
    
  }
	
}