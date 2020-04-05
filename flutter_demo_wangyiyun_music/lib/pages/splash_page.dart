import 'package:flutter/material.dart';
import 'package:flutter_demo_wangyiyun_music/application.dart';
import 'package:flutter_demo_wangyiyun_music/provider/user_model.dart';
import 'package:flutter_demo_wangyiyun_music/utils/navigator_util.dart';
import 'package:flutter_demo_wangyiyun_music/utils/net_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
class SplashPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
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
    _scaleTween = Tween(begin: 0,end: 1);
    _logoController =
      AnimationController(vsync: this, duration: Duration(milliseconds: 500))
        ..drive(_scaleTween);
    Future.delayed(Duration(milliseconds: 500),(){
      _logoController.forward();
    });
    _logoAnimation = CurvedAnimation(parent: _logoController, curve: Curves.easeOutQuart);
    _logoController.addStatusListener((status){ //该动画监听仅可以在无交互的情况下做过渡
      if(status == AnimationStatus.completed){
        Future.delayed(Duration(milliseconds: 500),(){
          goPage();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    NetUtils.init();
    ScreenUtil.init(context,width: 750,height: 1334);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ScaleTransition(
          scale: _logoAnimation,
          child: Hero(
            tag: 'logo',
            child: Image.asset('images/icon_logo.png'),
          ),
        ),
      ),
    );
  }

  void goPage() async{
    await Application.initSp();
    UserModel userModel = Provider.of<UserModel>(context);
    userModel.initUser();
    
    if(userModel.user != null){
    
    }else{
      NavigatorUtil.goLoginPage(context);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _logoController.dispose();
  }
}
