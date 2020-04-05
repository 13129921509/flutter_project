import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_book_reader/route/navigator_service.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Application{
	static Router router;
	static GlobalKey<NavigatorState> key = new GlobalKey();
	static SharedPreferences sp;
	static double screenHeight;
	static double screenWidth;
	static double statusBarHeight;
	static double bottomBarHeight;
	static GetIt getIt = GetIt.instance;
	
	static initSp() async{
		return await SharedPreferences.getInstance();
	}
	
	static setupLocator(){
		getIt.registerSingleton(NavigatorService());
	}
}