import 'package:flutter/material.dart';
import 'package:my_book_reader/route/routes.dart';
import 'package:fluro/fluro.dart';
import '../application.dart';

class NavigatorUtil{
	static goHomePage(BuildContext context){
		_navigator(context,Routes.home);
	}

  static void _navigator(BuildContext context, String path,
		{bool replace = false,
			bool clearStack = false,
			Duration transitionDuration = const Duration(milliseconds: 250),
			RouteTransitionsBuilder transitionsBuilder
		}) {
		Application.router.navigateTo(context, path,
			replace: replace,
			clearStack: clearStack,
			transitionBuilder: transitionsBuilder,
			transitionDuration: transitionDuration,
			transition: TransitionType.material
		);
  }
}