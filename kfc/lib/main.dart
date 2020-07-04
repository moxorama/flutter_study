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
    return MaterialApp(
        home: CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        inactiveColor: Colors.black,
        activeColor: Colors.red,
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('assets/images/navigation/menu_off.png'),
              height: 26,
            ),
            activeIcon: Image(
              image: AssetImage('assets/images/navigation/menu_on.png'),
              height: 26,
            ),
            title: Text('Меню'),
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('assets/images/navigation/coupons_off.png'),
              height: 26,
            ),
            activeIcon: Image(
              image: AssetImage('assets/images/navigation/coupons_on.png'),
              height: 26,
            ),
            title: Text('Купоны'),
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('assets/images/navigation/restaurant_off.png'),
              height: 26,
            ),
            activeIcon: Image(
              image: AssetImage('assets/images/navigation/restaurant_on.png'),
              height: 26,
            ),
            title: Text('Рестораны'),
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('assets/images/navigation/basket_off.png'),
              height: 26,
            ),
            activeIcon: Image(
              image: AssetImage('assets/images/navigation/basket_on.png'),
              height: 26,
            ),
            title: Text('Корзина'),
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('assets/images/navigation/person_off.png'),
              height: 26,
            ),
            activeIcon: Image(
              image: AssetImage('assets/images/navigation/person_on.png'),
              height: 26,
            ),
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
    ));
  }
}
