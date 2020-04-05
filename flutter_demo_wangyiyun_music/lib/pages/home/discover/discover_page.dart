import 'package:flutter/material.dart';
import 'package:flutter_demo_wangyiyun_music/model/banner.dart' as prefix0;
import 'package:flutter_demo_wangyiyun_music/utils/net_utils.dart';
import 'package:flutter_demo_wangyiyun_music/widgets/custom_banner.dart';
import 'package:flutter_demo_wangyiyun_music/widgets/widget_future_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class DiscoverPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return DiscoverPageState();
  }
  
}


class DiscoverPageState extends State<DiscoverPage>{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildBanner(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(15),
              ),
              child: Column(
                
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return CustomFutureBuilder<prefix0.Banner>(
      futureFunc: NetUtils.getBannerData,
      builder: (context, data){
        return CustomBanner(
          data.banners.map((e) => '${e.pic}?param=540y210').toList()
        );
      },
    );
  }
  
}
