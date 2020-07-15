import 'package:flutter/material.dart';
import 'package:ore_miner/constants.dart';
import 'tool.dart';

class ShopItem extends StatelessWidget {
  ShopItem({this.tool, this.available});

  final Tool tool;
  final bool available;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: available ? 1 : 0.16,
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(24),
              margin: EdgeInsets.fromLTRB(16, 32, 16, 16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.32),
                      spreadRadius: 4,
                      blurRadius: 32,
                      offset: Offset(0, 16),
                    )
                  ]),
              child: Image.asset(
                "images/" + tool.toolImage,
                height: 48,
                width: 48,
              )),
          Text(
            tool.price.toString(),
            style: available ? kShopActiveTextStyle : kShopInactiveTextStyle,
          )
        ],
      ),
    );
  }
}
