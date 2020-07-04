import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuHeader extends StatelessWidget {
  const MenuHeader({Key key}) : super(key: key);

  Widget currentStore(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              'РЕСТОРАН',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10,
                fontFamily: 'CeraPro',
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(width: 10, height: 10)
          ],
        ),
        Row(children: <Widget>[
          Text('ОХОТНЫЙ РЯД',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w700,
                fontSize: 12,
                fontFamily: 'CeraPro',
              )),
          SizedBox(
            width: 10,
            height: 10,
            child: Icon(
              CupertinoIcons.play_arrow_solid,
              size: 10,
              color: Colors.red,
            ),
          )
        ])
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60.0,
        child: Container(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Image.asset('assets/images/logo.png', height: 24),
                    currentStore(context)
                  ],
                ))));
  }
}
