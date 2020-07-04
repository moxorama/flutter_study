import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kfc/screens/menu/menu_screen/widgets/categories_list.dart';
import 'package:kfc/screens/menu/menu_screen/widgets/menu.dart';
import 'package:kfc/screens/menu/menu_screen/widgets/menu_header.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int categoryIdx;
  Menu menu;

  @override
  initState() {
    categoryIdx = 0;
  }

  _onCategoryScrolled(int index) {
    print(index);
  }

  _onCategorySelected(int index) {
    print(index);
    menu.scrollTo(index);
  }

  @override
  Widget build(BuildContext context) {
    menu = new Menu(onCategoryScrolled: _onCategoryScrolled);

    return Scaffold(
        body: Column(
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 2,
                    offset: Offset(0, 2),
                    color: Colors.black12)
              ],
            ),
            child: SafeArea(
              bottom: false,
              child: Column(
                children: <Widget>[
                  MenuHeader(),
                  CategoriesList(onCategorySelected: _onCategorySelected),
                ],
              ),
            )),
        Expanded(child: menu)
      ],
    ));
  }
}
