import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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

class _MyHomePageState extends State<MyHomePage> {
  var _words = <String>[loadingTag];

  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false;
  static var loadingTag = "##loading##"; //表尾标记;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('lIST Demo'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index){
            if(_words[index] == loadingTag){
              if(_words.length-1 < 100){
                _retrieveData();
                return Container(
                  padding: EdgeInsets.all(12),
                  alignment: Alignment.center,
                  child: SizedBox(
                    
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2,),
                  ),
                );
              }else{
                return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16),
                  child: Text("没有更多了", style: TextStyle(color: Colors.grey),),
                );
              }
            }
            return ListTile(title: Text(_words[index]));
          },
          separatorBuilder: (context,index)=> Divider(height: 0),
          itemCount: _words.length,
        controller: _controller,
      ),
      floatingActionButton: !showToTopBtn?null:FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: (){
          _controller.animateTo(.0, duration: Duration(milliseconds: 200), curve: Curves.ease);
        },
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _retrieveData();
    _controller.addListener((){
      if(_controller.offset < 1000 && showToTopBtn){
        setState(() {
          showToTopBtn = false;
        });
      }else if(_controller.offset >= 1000 && showToTopBtn == false){
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2))
        .then((e){
          _words.insertAll(
              _words.length - 1,
              generateWordPairs().take(20).map((e)=>e.asPascalCase).toList());
          setState(() {

          });
        });
  }

}
