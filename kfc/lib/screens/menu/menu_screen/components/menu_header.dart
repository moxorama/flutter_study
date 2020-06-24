import 'package:flutter/cupertino.dart';

class MenuHeader extends StatelessWidget {
  const MenuHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 56.0,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[Text('KFC'), Text('cart')],
            )));
  }
}
