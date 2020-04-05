import 'package:flutter/cupertino.dart';
import 'package:flutter_demo_wangyiyun_music/route/routes.dart';

import '../application.dart';

class NavigatorUtil{
  static _navigateTo(BuildContext context, String path,{
    bool replace = false,
    bool clearStack = false,
    Duration transitionDuration = const Duration(milliseconds: 250),
    RouteTransitionsBuilder transitionBuilder
  }){
    Application.router.navigateTo(context, path,
      replace: replace,
      clearStack: clearStack,
      transitionDuration: transitionDuration,
      transitionBuilder: transitionBuilder
    );
  }
  
  static goLoginPage(BuildContext context){
    _navigateTo(context, Routes.login, clearStack: true);
  }
  
  static goHomePage(BuildContext context){
    _navigateTo(context, Routes.home, clearStack: true);
  }

  static void goSearchPage(BuildContext context) {
    
  }
}