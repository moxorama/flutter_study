import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kfc/components/ios_physics/ios_physics.dart';
import 'package:kfc/screens/menu/menu_screen/widgets/menu_item.dart';

class Menu extends StatelessWidget {
  int currentCategory = 0;
  Function _onCategoryScrolled;
  ScrollController _controller = new ScrollController();

  var menuData;
  var scrollPositions;

  Menu({Function onCategoryScrolled}) {
    _onCategoryScrolled = onCategoryScrolled;
    _controller.addListener(_scrollListener);
  }

  _calculateScrollPositions() {
    var scrollPositions = [];

    int positionIdx = 1;

    if (menuData == null) {
      return;
    }

    scrollPositions.add(0);

    menuData.forEach((menuItem) {
      if (menuItem['type'] == 'category') {
        scrollPositions.add((positionIdx * 104) - 80);
      }

      positionIdx += 1;
    });

    return scrollPositions;
  }

  _scrollListener() {
    int currentIdx = 0;

    while ((currentIdx <= scrollPositions.length - 1) &&
        (_controller.offset >= scrollPositions[currentIdx + 1])) {
      currentIdx += 1;
    }

    if (currentCategory != currentIdx) {
      currentCategory = currentIdx;
      _onCategoryScrolled(currentIdx);
    }
  }

  scrollTo(categoryIdx) {
    _controller.animateTo(scrollPositions[categoryIdx].toDouble(),
        duration: Duration(milliseconds: 250), curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('data/menu.json'),
        builder: (context, snapshot) {
          menuData = jsonDecode(snapshot.data.toString());
          scrollPositions = _calculateScrollPositions();

          return Container(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  controller: _controller,
                  physics: iOSPhysics(),
                  itemCount: (menuData != null) ? menuData.length : 0,
                  itemBuilder: (context, index) => MenuItem(menuData[index])));
        });
  }
}
