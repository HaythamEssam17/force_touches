import 'package:flutter/material.dart';
import 'package:force_touches_taskapp/Helpers/shared.dart';
import 'package:force_touches_taskapp/Widgets/commonCachedImageWindet.dart';

class CommonProductCardWidget extends StatefulWidget {
  final String title;
  final String description;
  final String image;
  final int count;
  final bool favoriteSelected;
  final Function onFavoriteTap;
  CommonProductCardWidget(
      {Key key,
      this.title,
      this.description,
      this.image,
      this.count,
      this.favoriteSelected = false,
      this.onFavoriteTap})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => CommonProductCardWidgetState();
}

class CommonProductCardWidgetState extends State<CommonProductCardWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height * 0.3,
        width: size.width,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            border: Border.all(color: Shared.mainColor),
            borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Stack(
                  children: [
                    CommonCachedImaeWidget.cachedImage(
                        context, widget.image, size.height * 0.2, size.width),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.favorite_border,
                              color: widget.favoriteSelected
                                  ? Shared.mainColor
                                  : Colors.black12,
                              size: 30.0,
                            ),
                            onPressed: () {}),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.title, overflow: TextOverflow.ellipsis),
                          Text(widget.description,
                              overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text('الكمية'),
                          Text(widget.count.toString()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
