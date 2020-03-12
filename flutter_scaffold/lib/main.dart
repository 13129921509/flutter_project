import 'package:flutter/material.dart';

import 'MyDrawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  TabController _tabController;
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener((){
//      switch(_tabController.index){
//        case 1:print(tabs[_tabController.index]);break;
//        case 2:print(tabs[_tabController.index]);break;
//        case 3:print(tabs[_tabController.index]);break;
//      }
      var index = _tabController.index;
      var previousIndex = _tabController.previousIndex;
      print("index: $index");
      print("pre: $previousIndex");
});
}

@override
Widget build(BuildContext context) {
  return new Scaffold(
    appBar: AppBar(
      leading: Builder(builder:(context){
        return IconButton(icon: Icon(Icons.dashboard), onPressed: (){
          Scaffold.of(context).openDrawer();
        });
      }
      ),
      centerTitle: true,
      title: Text('DEMO'),
      bottom: TabBar(
        controller: _tabController,
        tabs: tabs.map((e)=> Tab(text: e)).toList(),
      ),
    ),
    body: TabBarView(
      controller: _tabController,
      children: tabs.map((e){
        return Container(
          alignment: Alignment.center,
          child: Text(e),
        );
      }).toList(),
    ),
    drawer: MyDrawer(),
  );
}

}
