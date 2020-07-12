import 'tool.dart';
import 'ore.dart';

class MinerBrain {
  MinerBrain({this.coins, this.level});

  int coins;
  int level;
  Tool myTool =
      Tool(toolImage: "hand.png", price: 0, power: 1, drop: 1, isBought: true);

  List<Ore> ores = [
    Ore(oreImageName: "stone.png", health: 50),
    Ore(oreImageName: "coal.png", health: 200),
    Ore(oreImageName: "iron.png", health: 1000),
    Ore(oreImageName: "lapis_lazuli.png", health: 5000),
    Ore(oreImageName: "gold.png", health: 15000),
    Ore(oreImageName: "redstone.png", health: 25000),
    Ore(oreImageName: "diamond.png", health: 100000),
    Ore(oreImageName: "emerald.png", health: 1000000)
  ];

  List<Tool> shop = [
    Tool(
        toolImage: "wooden_pickaxe.png",
        price: 50,
        power: 2,
        drop: 2,
        isBought: false),
    Tool(
        toolImage: "stone_pickaxe.png",
        price: 400,
        power: 5,
        drop: 4,
        isBought: false),
    Tool(
        toolImage: "iron_pickaxe.png",
        price: 2000,
        power: 20,
        drop: 20,
        isBought: false),
    Tool(
        toolImage: "golden_pickaxe.png",
        price: 8000,
        power: 50,
        drop: 50,
        isBought: false),
    Tool(
        toolImage: "diamond_pickaxe.png",
        price: 20000,
        power: 100,
        drop: 200,
        isBought: false),
    Tool(
        toolImage: "netherite_pickaxe.png",
        price: 100000,
        power: 800,
        drop: 800,
        isBought: false)
  ];

  int getNextLevel() {
    return level + 1;
  }

  void startNextLevel() {
    level++;
  }

  void click() {
    coins += myTool.drop;

    if (ores[level].health - myTool.power <= 0) {
      startNextLevel();
    } else {
      ores[level].health -= myTool.power;
    }
  }

  void buyTool(Tool tool) {
    if (canBuy(tool)) {
      coins -= tool.price;
      myTool = tool;
      myTool.isBought = true;
    } else {
      print("Not enough Coins!");
    }
  }

  bool canBuy(Tool tool) {
    if (coins >= tool.price) {
      return true;
    } else {
      return false;
    }
  }

  String getOreHealth() {
    return ores[level].health.toString();
  }
}
