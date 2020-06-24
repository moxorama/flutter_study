import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kfc/screens/menu/menu_screen/components/categories_list.dart';
import 'package:kfc/screens/menu/menu_screen/components/menu.dart';
import 'package:kfc/screens/menu/menu_screen/components/menu_header.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(blurRadius: 5, spreadRadius: 2, offset: Offset(0, 2),  color: Colors.black12)
            ]
          ),
          child: SafeArea(
            bottom: false,
            child: Column(children: <Widget>[
              MenuHeader(),
              CategoriesList(),
            ],),)
        ),
        Expanded(child: Menu())
      ],)
    );
  }
}
