import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:my_book_reader/util/text_styles_util.dart';
import 'package:my_book_reader/widget/book_item_box.dart';
import 'package:my_book_reader/widget/empty_view_widget.dart';
import 'package:my_book_reader/widget/reader_bottom_navigator_bar.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
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
      body: CustomScrollView(
        physics: ScrollPhysics(),
        slivers: <Widget>[
              SliverToBoxAdapter(
                child: Column(
                  children: <Widget>[
                    _topBar(),
                    _recommendBox(),
                  ],
                ),
              ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            sliver: _sliverAdvertisement(),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            sliver: _sliverBookShelfSize(),
          ),
        ],
      ),
      bottomNavigationBar: ReaderBottomNavigatorBar(0),
    );
  }

  /// 广告推广位置
  Widget _sliverAdvertisement() {
    return SliverToBoxAdapter(
      child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          Row(
            children: <Widget>[
              EmptyViewWidget(width: ScreenUtil().setWidth(40.0),),
              SizedBox(
                width: ScreenUtil().setWidth(680.0),
                height: ScreenUtil().setHeight(50.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '[广告位测试]一号狂兵，女神的私密护卫',
                    style: TextStyleUtil().homeAdvertisementX,
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: ScreenUtil().setWidth(-20.0),
            child: IconButton(
                iconSize: ScreenUtil().setWidth(50.0),
                color: Colors.white,
                icon: Icon(Icons.navigate_next),
                padding: EdgeInsets.all(0),
                onPressed: null),
          )
        ],
      ),
    );
  }

  /// sliver形式的书架
  Widget _sliverBookShelfSize() {
    return SliverToBoxAdapter(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.75,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 5.0),
        itemBuilder: (context, index) {
          return BookItemBox('images/reader_homepage_recommend.jpeg', '剑来231231',haveReader: '已读 0.1%',);
        },
        itemCount: 10,
        physics: ScrollPhysics(),
        shrinkWrap: true,
      ),
    );
  }

  ///伪头部
  Widget _topBar() {
    return Container(
      height: ScreenUtil().setHeight(100),
      color: Colors.grey[700],
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          children: <Widget>[
            Text(
              '书架',
              style: TextStyleUtil().homeTabWhiteBoldX,
            ),
            EmptyViewWidget(
              width: ScreenUtil().setWidth(800.0),
            ),
            IconButton(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(0),
              icon: Icon(Icons.more_vert),
              onPressed: () {},
              iconSize: ScreenUtil().setWidth(60.0),
              color: Colors.white,
            ),
            IconButton(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(0),
              icon: Icon(Icons.search),
              onPressed: () {},
              iconSize: ScreenUtil().setWidth(60.0),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  ///根据用户喜好 推广位
  Widget _recommendBox() {
    return Container(
      height: ScreenUtil().setHeight(280),
      color: Colors.grey[700],
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: ScreenUtil().setHeight(200.0),
              height: double.infinity,
              child: Image.asset('images/reader_homepage_recommend.jpeg'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: ConstrainedBox(
                constraints:
                    BoxConstraints.expand(width: ScreenUtil().setWidth(486.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '今日免费',
                      style: TextStyleUtil().homeTabWhiteBoldXX,
                    ),
                    EmptyViewWidget(
                      height: ScreenUtil().setHeight(60.0),
                    ),
                    Stack(
                      alignment: Alignment.centerLeft,
                      children: <Widget>[
                        SizedBox(
                          width: ScreenUtil().setWidth(490.0),
                          height: ScreenUtil().setWidth(50.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '一号狂兵，女神的私密护卫',
                              style: TextStyleUtil().homeTabWhiteX,
                              textAlign: TextAlign.justify,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Positioned(
                          right: ScreenUtil().setWidth(-20.0),
//                          top: 0.0,
                          child: IconButton(
                              iconSize: ScreenUtil().setWidth(50.0),
                              color: Colors.white,
                              icon: Icon(Icons.navigate_next),
                              padding: EdgeInsets.all(0),
                              onPressed: null),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StickyWidgetDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  double widgetHeight;

  StickyWidgetDelegate({@required this.child, this.widgetHeight});

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    return this.child;
  }

  @override
  double get maxExtent => widgetHeight;

  @override
  double get minExtent => widgetHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oxldDelegate) {
    return true;
  }
}
