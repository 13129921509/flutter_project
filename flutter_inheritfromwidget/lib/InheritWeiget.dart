import 'package:flutter/material.dart';

class InheritWeiget extends InheritedWidget{
  final int data;

  InheritWeiget({@required this.data,Widget child}):super(child:child);

  static InheritWeiget of(BuildContext context){
    return context.inheritFromWidgetOfExactType(InheritWeiget);
  }

  @override
  bool updateShouldNotify(InheritWeiget oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.data != data;
  }


}