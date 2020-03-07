import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "incrememt_app",
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title:'Flutter Demo Home Page'),
    );
  }

}

class MyHomePage extends StatefulWidget{
  final String title;
  MyHomePage({Key key, this.title}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage>{
  int _count = 0;

  void _incrementCount(){
    setState(() {
      _count++;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
                '$_count',
                style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text("open new router"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context){
                    return new NewRouter();
                  })
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCount,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}


class NewRouter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("This is new router"),
      ),
    );
  }

}