import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_wangyiyun_music/route/router_handle.dart';
import 'package:flutter_demo_wangyiyun_music/widgets/login_page.dart';

class Routes{
	static String root = "/";
	static String login = '/login';
	static String home = '/home';
	
	static void configureRoutes(Router router){
		router.notFoundHandler = new Handler(
			handlerFunc: (BuildContext context, Map<String,List<String>>params){
				print("ROUTE WAS NOT FOUND !!!");
				return LoginPage();
			}
		);
		router.define(root, handler: splashHandle);
		router.define(login, handler: loginHandle);
		router.define(home, handler: searchHandle);
	}
}