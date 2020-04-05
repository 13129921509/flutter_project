import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo_wangyiyun_music/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomBanner extends StatefulWidget{
  
  final List<String> _images;
  final double height;
  final ValueChanged<int> onTap;
  final Curve curve;
  
  CustomBanner(
      this._images,{
    this.height = 200,
    this.onTap,
    this.curve = Curves.linear
  }):assert(_images != null);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CustomBannerState();
  }
}

class _CustomBannerState extends State<CustomBanner>{
  PageController _pageController;
  int _curIndex;
  Timer _timer;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _curIndex = widget._images.length * 5;
    _pageController = PageController(initialPage: _curIndex);
    _initTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        _buildPageView(),
        _buildIndicator(),
      ],
    );
  }

  //初始化定时器
  void _initTimer() {
    if(_timer != null){
      if(mounted){
        _timer = Timer.periodic(Duration(seconds: 3), (t){
          _curIndex++;
          _pageController.animateToPage(
              _curIndex,
              duration: Duration(milliseconds: 300),
              curve: Curves.linear
          );
        });
      }
    }
  }

  Widget _buildPageView() {
    var length = widget._images.length;
    return AspectRatio(
      aspectRatio: (1080 + (ScreenUtil().setWidth(15) * 2)) /
          (400 - (ScreenUtil().setWidth(15))),
      child: PageView.builder(
          controller: _pageController,
          onPageChanged: (index){
            setState(() {
              _curIndex = index;
              if (index == 0) {
                _curIndex = length;
                _changePage();
              }
            });
          },
          itemBuilder: (context, index){
            return GestureDetector(
              onPanDown: (details){
                _cancelTimer();
              },
              onTap: (){
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('当前 page 为 ${index % length}'),
                    duration: Duration(milliseconds: 500),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(10))),
                  child: Utils.showNetImage(
                    widget._images[index % length],
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            )
          }),
    )
  }

  /// 切换页面，并刷新小圆点
  void _changePage() {
    Timer(Duration(milliseconds: 350),(){
      _pageController.jumpToPage(_curIndex);
    });
  }

  void _cancelTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
      _initTimer();
    }
  }

  Widget _buildIndicator() {
    var length = widget._images.length;
    return Positioned(
      bottom: 10,
      child: Row(
        children: widget._images.map((s){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: ClipOval(
              child: Container(
                width: ScreenUtil().setWidth(12),
                height: ScreenUtil().setWidth(12),
                color: s == widget._images[_curIndex % length]
                    ? Colors.red
                    : Colors.grey,
              ),
            ),
          );
        }).toList(),
      ),
    )
  }
  
  
}