
import 'package:fluro/fluro.dart';
import 'package:my_book_reader/page/home_page.dart';
import 'package:my_book_reader/page/splash_page.dart';

var rootHandler = new Handler(
	handlerFunc: (context, params){
		return SplashPage();
	}
);


var homeHandler = new Handler(
	handlerFunc: (context, params){
		return HomePage();
	}
);