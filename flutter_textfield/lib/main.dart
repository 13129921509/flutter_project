import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'demo',
      home: TextFieldWidget(),
    );

  }

}

class TextFieldWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new TextFieldState();
  }


}

class TextFieldState extends State<TextFieldWidget>{
  final TextEditingController _unameController = new TextEditingController();
  final TextEditingController _passController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("textField"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _unameController,
            autofocus: true,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              labelText: '用户名',
              hintText: '输入用户名',
            ),
            onChanged: (value){
              print('用户名 '+_unameController.text);
            },
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: '密码',
                hintText: '请输入密码'
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    _unameController.text = "old value";
    _unameController.addListener(()=>print(_unameController.text));
    _unameController.selection = TextSelection(
      baseOffset: 2,
      extentOffset: _unameController.text.length
    );
  }

}
