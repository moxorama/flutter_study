import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CategoriesList extends StatefulWidget {
  var onCategorySelected;

  CategoriesList({Key key, this.onCategorySelected}) : super(key: key);

  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  int selectedCategory = 0;

  final List<String> categories = [
    "Бесконтактные комбо",
    "Бургеры",
    "Твистеры",
    "Курица",
    "Баскеты",
    "Снэки",
    "Соусы",
    "Напитки",
    "Кофе и чай",
    "Десерты",
  ];

  final ItemScrollController itemScrollController = ItemScrollController();

  /// Listener that reports the position of items when the list is scrolled.
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  void scrollTo(int index) {
    double getAlignment() {
      double alignment = 0.4;

      if (index == 0) {
        alignment = 0;
      }
      if (index == (categories.length - 2)) {
        alignment = 0.6;
      }

      if (index == (categories.length - 1)) {
        alignment = 0.7;
      }

      return alignment;
    }

    setState(() {
      selectedCategory = index;
    });

    widget.onCategorySelected(index);

    itemScrollController.scrollTo(
        index: index,
        alignment: getAlignment(),
        duration: Duration(milliseconds: 250),
        curve: Curves.easeOut);
  }

  Widget categoryLabel(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = index;
        });
        scrollTo(index);
      },
      child: Padding(
        padding: EdgeInsets.only(
            left: 16.0,
            right: (index == categories.length - 1) ? 16.0 : 0,
            top: 8),
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: (index == selectedCategory)
                      ? BorderSide(color: Colors.red, width: 2.0)
                      : BorderSide(color: Colors.transparent, width: 2.0))),
          child: Text(
            categories[index],
            style: TextStyle(
              color: (index == selectedCategory) ? Colors.red : Colors.grey,
              fontFamily: 'CeraPro',
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 36,
        child: ScrollablePositionedList.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemScrollController: itemScrollController,
            itemPositionsListener: itemPositionsListener,
            itemBuilder: (context, index) => categoryLabel(context, index)));
  }
}
