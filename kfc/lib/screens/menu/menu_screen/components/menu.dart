import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';


class Menu extends StatelessWidget {
  dynamic getProductInfo(List<dynamic> products, productId) {
    return products
      .firstWhere((element) => (element['productId'] == productId));
  }

  Widget menuItem(BuildContext context,  List<dynamic> products, dynamic itemData) {
    var itemInfo;
  
    if (itemData['type'] == 'product') {
      itemInfo = getProductInfo(products, itemData['id']);

      return SizedBox(
          height: 104,
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flex(
                direction: Axis.horizontal,
                children: [
                  Padding(
                    padding:EdgeInsets.all(16.0),
                    child:
                      Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: NetworkImage('https://s82079.cdn.ngenix.net/' + itemInfo['media']['image'] + '?dw=200&dh=200')
                          )
                        ),
                      ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(0),
                    child: Flex(
                      direction: Axis.vertical,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Text(
                          itemInfo['translation']['ru']['short'] ?? '',
                          style: TextStyle(fontFamily: 'Manrope')
                        ),
                        Text(
                          itemInfo['translation']['ru']['specification'] ?? itemInfo['translation']['ru']['fullTitle'] ?? '',
                          style: TextStyle(fontFamily: 'Manrope', color: Colors.grey, fontSize: 14)
                        )
                      ]
                    )
                  ),
                ]
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Image.asset(
                  'assets/buttons/red_plus.png',
                  width: 32,
                )
              ),
            ]
          )
      );
    }

    if (itemData['type'] == 'category') {
      return SizedBox(
        height: 32,
        child: 
          Padding(
            padding: EdgeInsets.symmetric( horizontal: 16),
            child: Text('Category', 
              style: TextStyle(fontFamily: 'Manrope', fontWeight: FontWeight.w900, fontSize: 24 )
            )
          )
      );
    }
  }
    


    
   

  

  @override
  Widget build(BuildContext context) {
     return FutureBuilder(
        future: DefaultAssetBundle
            .of(context)
            .loadString('data/menu.json'),
        builder: (context, snapshot) {
            var menuData = jsonDecode(snapshot.data.toString());
            var products = {};

            
            
            return ListView.separated(
                itemCount: (menuData != null) ? menuData['content'].length : 0,
                itemBuilder: (context, index) => menuItem(
                  context, 
                  menuData['products'],
                  menuData['content'][index]
                ),
                separatorBuilder: (context, index) => Divider(
                  height: 1,
                )
                
            );
        }
    );
  }
}
