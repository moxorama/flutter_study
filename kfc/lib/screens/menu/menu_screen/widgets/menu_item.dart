import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final dynamic itemData;

  const MenuItem(this.itemData);

  @override
  Widget build(BuildContext context) {
    if (itemData['type'] == 'product') {
      return SizedBox(
          height: 104,
          child: Container(
              child: Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                Flex(direction: Axis.horizontal, children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: NetworkImage(
                                  'https://s82079.cdn.ngenix.net/' +
                                      itemData['image'] +
                                      '?dw=200&dh=200'))),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(0),
                      child: Flex(
                          direction: Axis.vertical,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(itemData['title'] ?? '',
                                style: TextStyle(
                                    fontFamily: 'CeraPro',
                                    fontWeight: FontWeight.w500)),
                            Text(itemData['specification'] ?? '',
                                style: TextStyle(
                                    fontFamily: 'CeraPro',
                                    color: Colors.grey,
                                    fontSize: 14))
                          ])),
                ]),
                Padding(
                    padding: EdgeInsets.all(16),
                    child: Image.asset(
                      'assets/images/buttons/red_plus.png',
                      width: 32,
                    )),
              ])));
    }

    if (itemData['type'] == 'category') {
      return SizedBox(
          height: 104,
          child: Container(
              alignment: Alignment(-1.0, 0.0),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(itemData['title'] ?? '',
                  style: TextStyle(
                      fontFamily: 'CeraPro',
                      fontWeight: FontWeight.w900,
                      fontSize: 24))));
    }

    return (Container(
      height: 18,
      color: Colors.lightGreen,
    ));
  }
}
