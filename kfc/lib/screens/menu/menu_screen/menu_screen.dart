import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kfc/screens/menu/menu_screen/components/categories_list.dart';
import 'package:kfc/screens/menu/menu_screen/components/menu.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: CategoriesList(),
      ),
      child:
        Container(
          decoration: BoxDecoration(color: Colors.white ),
          child: 
            Expanded(child: Menu(),)
        ),
        
    );
  }
}