import 'package:flutter/material.dart';
import 'package:my_book_reader/util/navigator_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../application.dart';
class SplashPage extends StatefulWidget{
	
  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}


class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin{
	AnimationController _logoController;
	Tween _scaleTween;
	CurvedAnimation _logoAnimation;
	
	@override
  void initState() {
    super.initState();
    _scaleTween = new Tween(begin: 0,end: 1);
    _logoController = 
		    AnimationController(vsync: this,duration: Duration(milliseconds: 1000))
        ..drive(_scaleTween);
    Future.delayed(Duration(milliseconds: 5000),(){
    	_logoController.forward();
    });
    _logoAnimation =
		    CurvedAnimation(parent: _logoController, curve: Curves.easeOutSine);
    _logoController.addStatusListener((status){
    	if(status == AnimationStatus.completed){
    		Future.delayed(Duration(milliseconds: 500),(){
    			goPage();
		    });
	    }
    });
  }
  @override
  Widget build(BuildContext context) {
		ScreenUtil.init(context,height: 1334,width: 760);
		final size = MediaQuery.of(context).size;
		Application.screenWidth = size.width;
		Application.screenHeight = size.height;
		Application.statusBarHeight = MediaQuery.of(context).padding.top;
		Application.bottomBarHeight = MediaQuery.of(context).padding.bottom;
		return Scaffold(
			backgroundColor: Colors.white,
			body: Container(
				height: double.infinity,
				width: double.infinity,
				child: ScaleTransition(
					scale: _logoAnimation,
					child: Image.asset('images/icon_logo.png'),
//					child: Hero(
//						tag: 'logo',
//						child: Image.asset('images/icon_logo.png'),
//					),
				),
			),
		);
  }
	
	void goPage() async{
		await Application.initSp();
		NavigatorUtil.goHomePage(context);
	}
	
	@override
  void dispose() {
		_logoController.dispose();
    super.dispose();
  }
}