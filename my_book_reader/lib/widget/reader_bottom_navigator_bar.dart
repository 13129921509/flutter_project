import 'package:flutter/material.dart';
import 'package:my_book_reader/util/icon_util.dart';

class ReaderBottomNavigatorBar extends StatefulWidget {
  final int _index;
  final List<String> _tab = ['书架', '书城', '我的'];

  ReaderBottomNavigatorBar(this._index);
  
  @override
  State<StatefulWidget> createState() {
//    assert(_index < _tab.length, '$_index > tabs number: ${_tab.length}');
    return ReaderBottomNavigatorBarState();
  }
}

class ReaderBottomNavigatorBarState extends State<ReaderBottomNavigatorBar> {
  var _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              IconUtil.book_shelf,
//          size: 24.0,
              color: _tabIndex == 0 ? Colors.green : Colors.black,
            ),
            title: Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(
                  widget._tab[0],
                  style: TextStyle(
                      color: _tabIndex == 0 ? Colors.grey : Colors.green),
                ))),
        BottomNavigationBarItem(
            icon: Icon(
              IconUtil.book_shopping,
//              size: 24.0,
              color: _tabIndex == 1 ? Colors.green : Colors.black,
            ),
            title: Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(
                  widget._tab[1],
                  style: TextStyle(
                    color: _tabIndex == 1 ? Colors.green : Colors.grey,
                  ),
                ))),
        BottomNavigationBarItem(
            icon: Icon(
              IconUtil.my_place,
//              size: 24.0,
              color: _tabIndex == 2 ? Colors.green : Colors.black,
            ),
            title: Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(
                  widget._tab[2],
                  style: TextStyle(
                    color: _tabIndex == 2 ? Colors.green : Colors.grey,
                  ),
                ))),
      ],
      iconSize: 35.0,
      type: BottomNavigationBarType.fixed,
      currentIndex: widget._index,
      onTap: (index) {
        setState(() {
          _tabIndex = index;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _tabIndex = widget._index;
  }
}
