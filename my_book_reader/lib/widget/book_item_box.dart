import 'package:flutter/material.dart';
import 'package:my_book_reader/util/text_styles_util.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
class BookItemBox extends StatefulWidget {
  final String _bookUrl;
  final String _title;
  final String haveReader;
  final String author;

  BookItemBox(this._bookUrl, this._title,
      {this.haveReader, this.author});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BookItemBoxState();
  }
}

class BookItemBoxState extends State<BookItemBox> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){
        Fluttertoast.showToast(msg: '按下');
      },
      child: SizedBox(
//      width: ScreenUtil().setWidth(100.0),
//      height: ScreenUtil().setHeight(250.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          textDirection: TextDirection.ltr,
          children: <Widget>[
            Image.asset(widget._bookUrl,height: ScreenUtil().setHeight(200.0),),
            Text(widget._title, style: TextStyleUtil().homeBookShelfX),
            widget.haveReader != null
                ? Text(widget.haveReader, style: TextStyleUtil().homeBookShelfL,maxLines: 2,)
                : Text(widget.author, style: TextStyleUtil().homeBookShelfL,maxLines: 2,)
          ],
        ),
      ),
    );
  }
}
