import 'package:flutter/material.dart';
import 'package:force_touches_taskapp/Helpers/shared.dart';

class CategoryCard extends StatefulWidget {
  final String title;
  final IconData iconData;
  final bool selected;
  final Function onTap;
  CategoryCard(
      {Key key, this.title, this.iconData, this.selected = false, this.onTap})
      : super(key: key);

  CategoryCardState createState() => CategoryCardState();
}

class CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
            color: widget.selected ? Shared.mainColor : Colors.white,
            border: Border.all(color: Shared.mainColor),
            borderRadius: BorderRadius.circular(10.0)),
        height: size.height * 0.1,
        width: size.width * 0.25,
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        alignment: Alignment.center,
        child: Row(
          children: [
            widget.iconData == null
                ? Container()
                : Icon(widget.iconData,
                    size: 25.0,
                    color: widget.selected ? Colors.white : Colors.black),
            SizedBox(width: 10.0),
            Expanded(
              // child: FittedBox(
              child: Text(widget.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: widget.selected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
            // ),
          ],
        ),
      ),
    );
  }
}
