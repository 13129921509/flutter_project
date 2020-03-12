import 'package:flutter/material.dart';
class MyDrawer extends StatelessWidget{
  const MyDrawer({Key key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removeViewInsets(
          context: context,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 38),
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: ClipOval(
                              child: Image.network(
                                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1583950913156&di=d0a23e424a01095de17afc653f012871&imgtype=0&src=http%3A%2F%2Fh.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2F0dd7912397dda144dac4acc9b2b7d0a20df486f8.jpg',
                                width: 80,
//                                height: 80,
                              )
                              ),
                            ),
                        ),
                      ],
                    ),
                    Text(
                      "zwcai",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.add),
                      title: const Text('新增帐号'),

                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('Manage accounts'),
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }

}