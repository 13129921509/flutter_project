import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:my_book_reader/route/routers_handler.dart';
class Routes{
	/// routes map
	static String root = '/';
	static String home = '/home';
	
	
	
	static configureRoutes(Router router){
		router.notFoundHandler = new Handler(
			handlerFunc: (BuildContext context, Map<String, List<String>> parameters){
				print("ROUTE WAS NOT FOUND !!!");
				return null;
			}
		);
		router.define(root, handler: rootHandler);
		router.define(home, handler: homeHandler);
	}
}