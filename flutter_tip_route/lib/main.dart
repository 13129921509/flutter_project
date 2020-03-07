import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return new MaterialApp(
        title: "tip_route",
//        home: new TipTestRoute(),
        initialRoute: '/',
        routes: {
          'new_page':(context)=> TipRoute(text: ModalRoute.of(context).settings.arguments),
          '/':(context)=> TipTestRoute(),
        },
      );
  }

}

//// TODO: implement build
//return new Scaffold(
//appBar: AppBar(
//title:Text("tip route demo")
//),
//body: Center(
//child: TipTestRoute(),
//),
//);
class TipTestRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
          title:Text("tip_route")
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () async {
//            var result = await Navigator.push(
//                context,
//                MaterialPageRoute(
//                    builder:(context){
//                      return TipRoute(
//                        text:"我是提示xxxx",
//                      );
//                    }
//                )
//            );
            var result = await Navigator.pushNamed(context, 'new_page', arguments: 'czw');
            print("路由返回值:$result");
          },
          child: Text("打开提示页"),
        ),
      ),
    );
  }

}


class TipRoute extends StatelessWidget{
  final String text;

  TipRoute({Key key,
      @required this.text}):super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                onPressed: ()=> Navigator.pop(context,'我是返回值'),
                child: Text('返回'),
              )
            ],
          ),
        ),
      ),
    );
  }

}

