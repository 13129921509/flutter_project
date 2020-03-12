import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  TabController _tabController;
  List bars = ['新闻','历史','图片'];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/':(context)=> Scaffold(
          appBar: AppBar(title: Text('filed_foucs'),),
          body: MyHomePage(),
        )
      },
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  MyHomeState createState() {
    // TODO: implement createState
    return new MyHomeState();
  }
}

class MyHomeState extends State<MyHomePage> {

  final FocusNode node1 = new FocusNode();
  final FocusNode node2 = new FocusNode();
  FocusScopeNode scopeNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
            focusNode: node1,
            decoration: InputDecoration(
                labelText: 'input1'
            ),
          ),
          TextField(
            focusNode: node2,
            decoration: InputDecoration(
              labelText: 'input2',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)
              )
            ),
          ),
          Builder(builder: (ctx){
            return Column(
              children: <Widget>[
                RaisedButton(
                  child: Text('移动焦点'),
                  onPressed: (){
                    if(null == scopeNode){
                      scopeNode = FocusScope.of(context);
                    }
                    scopeNode.requestFocus(node2);
                  },
                ),
                RaisedButton(
                  child: Text('隐藏键盘'),
                  onPressed: (){
                    node1.unfocus();
                    node2.unfocus();
                  }
                )
              ],
            );
          })
        ],
      ),
    );
  }
}

