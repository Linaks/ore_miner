import 'package:flutter/material.dart';
import 'package:ore_miner/constants.dart';
import 'package:ore_miner/miner_brain.dart';
import 'package:ore_miner/shop_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MinerBrain minerBrain = MinerBrain(coins: 0, level: 0);

  Color getHealthColor() {
    switch (minerBrain.getHealthStatus()) {
      case HealthStatus.bad:
        {
          return Colors.red;
        }
        break;

      case HealthStatus.normal:
        {
          return Colors.orange;
        }
        break;

      case HealthStatus.good:
        {
          return Colors.green;
        }
        break;
    }
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                SizedBox(height: 64),
                Text(
                  "Ore Miner".toUpperCase(),
                  style: TextStyle(
                      fontSize: 50,
                      fontFamily: 'Montserrat',
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 64),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Text(
                          minerBrain.coins.toString(),
                          style: kCoinTextStyle,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Image.asset(
                          "images/coin.png",
                          height: 48,
                          width: 48,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text("Tool", style: kLabelTextStyle),
                        SizedBox(width: 16),
                        Image.asset(
                          "images/" + minerBrain.myTool.toolImage,
                          height: 48,
                          width: 48,
                        ),
                        SizedBox(width: 8),
                        Column(
                          children: [
                            Text(
                              "+" +
                                  minerBrain.myTool.power.toString() +
                                  " Damage",
                              style: kDamageTextStyle,
                            ),
                            Text(
                              "+" +
                                  minerBrain.myTool.drop.toString() +
                                  " Coins",
                              style: kShopActiveTextStyle,
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text("Next Level", style: kLabelTextStyle),
                        SizedBox(width: 16),
                        Image.asset(
                          "images/" +
                              minerBrain
                                  .ores[minerBrain.getNextLevel()].oreImageName,
                          height: 48,
                          width: 48,
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RawMaterialButton(
                    hoverColor: Color(0xFF303030),
                    splashColor: Color(0xFF303030),
                    highlightColor: Color(0xFF303030),
                    onPressed: () {
                      setState(() {
                        minerBrain.click();
                      });
                    },
                    child: Image.asset(
                      "images/" +
                          minerBrain.ores[minerBrain.level].oreImageName,
                      height: 150,
                      width: 150,
                    )),
                SizedBox(width: 32),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 24,
                      width: 200,
                      child: LinearProgressIndicator(
                        value: minerBrain.getOreHealth().toDouble() /
                            minerBrain.getOreStartHealth().toDouble(),
                        backgroundColor: Colors.grey[700],
                        valueColor:
                            AlwaysStoppedAnimation<Color>(getHealthColor()),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                        "+" +
                            minerBrain.ores[minerBrain.level].drop.toString() +
                            " Coins",
                        style: kShopActiveTextStyle),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Column(children: [
              Text(
                "Shop",
                style: kLabelTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                textDirection: TextDirection.rtl,
                children: [
                  Tooltip(
                    message: "+" +
                        minerBrain.shop[0].power.toString() +
                        " Damage\n" +
                        "+" +
                        minerBrain.shop[0].drop.toString() +
                        " Coins",
                    child: Visibility(
                      visible: !minerBrain.shop[0].isBought,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            minerBrain.buyTool(minerBrain.shop[0]);
                          });
                        },
                        child: ShopItem(
                          tool: minerBrain.shop[0],
                          available: minerBrain.canBuy(minerBrain.shop[0]),
                        ),
                      ),
                    ),
                  ),
                  Tooltip(
                    message: "+" +
                        minerBrain.shop[1].power.toString() +
                        " Damage\n" +
                        "+" +
                        minerBrain.shop[1].drop.toString() +
                        " Coins",
                    child: Visibility(
                      visible: !minerBrain.shop[1].isBought,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            minerBrain.buyTool(minerBrain.shop[1]);
                          });
                        },
                        child: ShopItem(
                          tool: minerBrain.shop[1],
                          available: minerBrain.canBuy(minerBrain.shop[1]),
                        ),
                      ),
                    ),
                  ),
                  Tooltip(
                    message: "+" +
                        minerBrain.shop[2].power.toString() +
                        " Damage\n" +
                        "+" +
                        minerBrain.shop[2].drop.toString() +
                        " Coins",
                    child: Visibility(
                      visible: !minerBrain.shop[2].isBought,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            minerBrain.buyTool(minerBrain.shop[2]);
                          });
                        },
                        child: ShopItem(
                          tool: minerBrain.shop[2],
                          available: minerBrain.canBuy(minerBrain.shop[2]),
                        ),
                      ),
                    ),
                  ),
                  Tooltip(
                    message: "+" +
                        minerBrain.shop[3].power.toString() +
                        " Damage\n" +
                        "+" +
                        minerBrain.shop[3].drop.toString() +
                        " Coins",
                    child: Visibility(
                      visible: !minerBrain.shop[3].isBought,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            minerBrain.buyTool(minerBrain.shop[3]);
                          });
                        },
                        child: ShopItem(
                          tool: minerBrain.shop[3],
                          available: minerBrain.canBuy(minerBrain.shop[3]),
                        ),
                      ),
                    ),
                  ),
                  Tooltip(
                    message: "+" +
                        minerBrain.shop[4].power.toString() +
                        " Damage\n" +
                        "+" +
                        minerBrain.shop[4].drop.toString() +
                        " Coins",
                    child: Visibility(
                      visible: !minerBrain.shop[4].isBought,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            minerBrain.buyTool(minerBrain.shop[4]);
                          });
                        },
                        child: ShopItem(
                          tool: minerBrain.shop[4],
                          available: minerBrain.canBuy(minerBrain.shop[4]),
                        ),
                      ),
                    ),
                  ),
                  Tooltip(
                    message: "+" +
                        minerBrain.shop[5].power.toString() +
                        " Damage\n" +
                        "+" +
                        minerBrain.shop[5].drop.toString() +
                        " Coins",
                    child: Visibility(
                      visible: !minerBrain.shop[5].isBought,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            minerBrain.buyTool(minerBrain.shop[5]);
                          });
                        },
                        child: ShopItem(
                          tool: minerBrain.shop[5],
                          available: minerBrain.canBuy(minerBrain.shop[5]),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}
