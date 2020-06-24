import 'package:flutter/cupertino.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text('Auth'),
          ),
        ],
    ));
  }
}
