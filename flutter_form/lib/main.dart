import 'package:flutter/material.dart';

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

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget{
  var title;

  MyHomePage({Key key, this.title}):super(key : key);

  @override
  State<StatefulWidget> createState() {
    return FormTextState();
  }


}

class FormTextState extends State<MyHomePage>{
  GlobalKey _formKey = new GlobalKey<FormState>();
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('demo')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              autovalidate: true,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    autofocus: true,
                    controller: _unameController,
                    decoration: InputDecoration(
                      labelText: '用户名',
                      hintText: '请输入用户名',
                      icon: Icon(Icons.person)
                    ),
                    validator: (v) {
                      return v.trim().length > 0 ? null : '用户名不能为空';
                    },
                  ),
                  TextFormField(
                    controller: _passController,
                    autovalidate: true,
                    decoration: InputDecoration(
                      labelText: '密码',
                      hintText: '请输入密码',
                      icon: Icon(Icons.lock)
                    ),
                    obscureText: true,
                    validator: (v) {
                      return v.trim().length > 5 ? null : '密码不能少于5位';
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            padding: EdgeInsets.all(15.0),
                            child: Text('登录'),
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            onPressed: () {
                              print(Form.of(context));
                              if((_formKey.currentState as FormState).validate()) {

                              }
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
