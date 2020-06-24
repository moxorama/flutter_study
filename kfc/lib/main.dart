import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kfc/screens/delivery/stores_map_screen/stores_map_screen.dart';
import 'package:kfc/screens/marketing/coupons_screen/coupons_screen.dart';
import 'package:kfc/screens/menu/menu_screen/menu_screen.dart';
import 'package:kfc/screens/order/cart_screen/cart_screen.dart';
import 'package:kfc/screens/auth/auth_screen/auth_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: 
        CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            inactiveColor: Colors.black,
            activeColor: Colors.red,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                title: Text('Menu'),
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.tag),
                title: Text('Coupons'),
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.location),
                title: Text('Stores'),
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.shopping_cart),
                title: Text('Cart'),
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person),
                title: Text('My KFC'),
              ),

            ],
          ),
          tabBuilder: (context, index) {
            CupertinoTabView returnValue;
            switch (index) {
              case 0:
                returnValue = CupertinoTabView(builder: (context) {
                  return MenuScreen();
                });
                break;
              case 1:
                returnValue = CupertinoTabView(builder: (context) {
                  return CouponsScreen();
                });
                break;
              case 2:
                returnValue = CupertinoTabView(builder: (context) {
                  return StoresMapScreen();
                });
                break;
              case 3:
                returnValue = CupertinoTabView(builder: (context) {
                  return CartScreen();
                });
                break;
              case 4:
                returnValue = CupertinoTabView(builder: (context) {
                  return AuthScreen();
                });
                break;
            
            }
            return returnValue;
          },
        )
      );
  }
}