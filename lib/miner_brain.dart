import 'tool.dart';
import 'ore.dart';

enum HealthStatus { good, normal, bad }

class MinerBrain {
  MinerBrain({this.coins, this.level});

  int coins;
  int level;
  Tool myTool =
      Tool(toolImage: "hand.png", price: 0, power: 1, drop: 1, isBought: true);

  List<Ore> ores = [
    Ore(oreImageName: "stone.png", drop: 1, startHealth: 50, health: 50),
    Ore(oreImageName: "coal.png", drop: 3, startHealth: 200, health: 200),
    Ore(oreImageName: "iron.png", drop: 6, startHealth: 1000, health: 1000),
    Ore(
        oreImageName: "lapis_lazuli.png",
        drop: 15,
        startHealth: 5000,
        health: 5000),
    Ore(oreImageName: "gold.png", drop: 16, startHealth: 15000, health: 15000),
    Ore(
        oreImageName: "redstone.png",
        drop: 40,
        startHealth: 25000,
        health: 25000),
    Ore(
        oreImageName: "diamond.png",
        drop: 75,
        startHealth: 100000,
        health: 100000),
    Ore(
        oreImageName: "emerald.png",
        drop: 150,
        startHealth: 350000,
        health: 350000),
    Ore(oreImageName: "restart.png", drop: 0, startHealth: 0, health: 0)
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
        power: 6,
        drop: 4,
        isBought: false),
    Tool(
        toolImage: "iron_pickaxe.png",
        price: 2000,
        power: 10,
        drop: 20,
        isBought: false),
    Tool(
        toolImage: "golden_pickaxe.png",
        price: 8000,
        power: 55,
        drop: 80,
        isBought: false),
    Tool(
        toolImage: "diamond_pickaxe.png",
        price: 20000,
        power: 120,
        drop: 200,
        isBought: false),
    Tool(
        toolImage: "netherite_pickaxe.png",
        price: 100000,
        power: 250,
        drop: 320,
        isBought: false)
  ];

  HealthStatus getHealthStatus() {
    if (ores[level].health > 0.75 * ores[level].startHealth) {
      return HealthStatus.good;
    } else if (ores[level].health > 0.40 * ores[level].startHealth) {
      return HealthStatus.normal;
    } else {
      return HealthStatus.bad;
    }
  }

  void restart() {
    level = 0;
    coins = 0;
    myTool = Tool(
        toolImage: "hand.png", price: 0, power: 1, drop: 1, isBought: true);
  }

  bool gameEnded() {
    return level == 8 ? true : false;
  }

  int getNextLevel() {
    if (!gameEnded()) {
      return level + 1;
    } else {
      return 0;
    }
  }

  void startNextLevel() {
    if (!gameEnded()) {
      level++;
    } else {
      restart();
    }
  }

  void click() {
    coins += (myTool.drop + ores[level].drop);

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

  int getOreStartHealth() {
    return ores[level].startHealth;
  }

  int getOreHealth() {
    return ores[level].health;
  }
}
