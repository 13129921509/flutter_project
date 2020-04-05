import 'package:flutter/material.dart';
import 'package:flutter_demo_wangyiyun_music/utils/navigator_util.dart';
import 'package:flutter_demo_wangyiyun_music/widgets/v_empty_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin{
  TabController _tabController;
  
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          elevation: 0,
        ),
        preferredSize: Size.zero,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            Padding(
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(150),
                        ),
                        child: TabBar(
                          labelStyle: TextStyle(
                            fontSize: 20,fontWeight: FontWeight.bold
                          ),
                          unselectedLabelStyle: TextStyle(
                            fontSize: 14
                          ),
                          indicator: UnderlineTabIndicator(),
                          controller: _tabController,
                          tabs: <Widget>[
                            Tab(
                              text: '发现',
                            ),
                            Tab(
                              text: '我的',
                            ),
                            Tab(
                              text: '动态',
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: ScreenUtil().setWidth(20),
                        child: IconButton(
                            icon: Icon(
                              Icons.search,
                              size: ScreenUtil().setWidth(50),
                              color: Colors.black87,
                            ),
                            onPressed: (){
                              NavigatorUtil.goSearchPage(context);
                            }),
                      )
                    ],
                  ),
                  VEmptyView(20),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  
}