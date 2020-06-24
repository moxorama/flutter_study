import 'package:flutter/cupertino.dart';

class StoresMapScreen extends StatefulWidget {
  @override
  _StoresMapScreenState createState() => _StoresMapScreenState();
}

class _StoresMapScreenState extends State<StoresMapScreen> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('Coupons'),
        ),
      ],
    ));
  }
}