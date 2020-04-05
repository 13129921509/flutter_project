import 'package:flutter/material.dart';
import 'package:flutter_demo_wangyiyun_music/provider/play_list_model.dart';
import 'package:flutter_demo_wangyiyun_music/provider/user_model.dart';
import 'package:flutter_demo_wangyiyun_music/utils/navigator_util.dart';
import 'package:flutter_demo_wangyiyun_music/utils/utils.dart';
import 'package:flutter_demo_wangyiyun_music/widgets/v_empty_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'common_button.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginPageState();
  }

}


class LoginPageState extends State<LoginPage> with TickerProviderStateMixin{
  Animation<double> _animation;
  AnimationController _controller;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = 
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    Future.delayed(Duration(milliseconds: 500),(){
      _controller.forward();
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        brightness: Brightness.light,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(80),
            right: ScreenUtil().setWidth(80),
            top: ScreenUtil().setHeight(30)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Image.asset(
                  'images/icon_logo.png',
                  height: ScreenUtil().setHeight(90),
                  width: ScreenUtil().setWidth(90),
                ),
              ),
              _LoginAnimatedWidget(animation: _animation),
            ],
          ),
        ),
      ),
    );
  }
	
}


class _LoginAnimatedWidget extends AnimatedWidget{
  final Tween<double> _opacityTween = new Tween(begin: 0, end: 1);
  final Tween<double> _offsetTween = Tween(begin: 40, end: 0);
  final Animation animation;
  
  _LoginAnimatedWidget({
    @required this.animation,
  }):super(listenable:animation);
  
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Container(
          margin: EdgeInsets.only(top: _offsetTween.evaluate(animation)),
          child: _LoginWidget(),
        ),
    );
  }
  
  
}

class _LoginWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginWidgetState();
  }
  
}

class _LoginWidgetState extends State<_LoginWidget>{
  final TextEditingController _phoneController = new TextEditingController();
  final TextEditingController _pwdController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(primaryColor: Colors.red),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setWidth(30)),
              child: Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 34,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(3)),
              child: Text(
                'The Flutter Netease Cloud Music App',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14
                ),
              ),
            ),
            VEmptyView(50),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Phone',
                prefixIcon: Icon(
                  Icons.phone_android,
                  color: Colors.grey,
                )
              ),
            ),
            VEmptyView(40),
            TextField(
              obscureText: true,
              controller: _pwdController,
              decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.grey,
                  )),
            ),
            VEmptyView(120),
            Consumer<UserModel>(
              builder: (BuildContext context, UserModel value, Widget child){
                return CommonButton(
                  content: 'Login',
                  width: double.infinity,
                  callback: (){
                    String phone = _phoneController.text;
                    String pwd = _pwdController.text;
                    if (phone.isEmpty || pwd.isEmpty) {
                      Utils.showToast('请输入账号或者密码');
                      return;
                    }
                    value.login(
                        context,
                        phone,
                        pwd
                    ).then((value){
                      if(value != null){
                        Provider.of<PlayListModel>(context).user = value;
                        NavigatorUtil.goLoginPage(context);
                      }
                    });
                  },
                );
              },
            )
          ],
        )
    );
  }
}