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
    Ore(oreImageName: "stone.png", drop: 1, startHealth: 35, health: 35),
    Ore(oreImageName: "coal.png", drop: 3, startHealth: 150, health: 150),
    Ore(oreImageName: "iron.png", drop: 6, startHealth: 750, health: 750),
    Ore(
        oreImageName: "lapis_lazuli.png",
        drop: 15,
        startHealth: 2500,
        health: 2500),
    Ore(oreImageName: "gold.png", drop: 16, startHealth: 8000, health: 8000),
    Ore(
        oreImageName: "redstone.png",
        drop: 40,
        startHealth: 14500,
        health: 14500),
    Ore(
        oreImageName: "diamond.png",
        drop: 75,
        startHealth: 35000,
        health: 35000),
    Ore(
        oreImageName: "emerald.png",
        drop: 150,
        startHealth: 90000,
        health: 90000),
    Ore(oreImageName: "restart.png", drop: 0, startHealth: 1, health: 1)
  ];

  List<Tool> shop = [
    Tool(
        toolImage: "wooden_pickaxe.png",
        price: 50,
        power: 8,
        drop: 5,
        isBought: false),
    Tool(
        toolImage: "stone_pickaxe.png",
        price: 400,
        power: 20,
        drop: 10,
        isBought: false),
    Tool(
        toolImage: "iron_pickaxe.png",
        price: 2000,
        power: 80,
        drop: 50,
        isBought: false),
    Tool(
        toolImage: "golden_pickaxe.png",
        price: 8000,
        power: 200,
        drop: 200,
        isBought: false),
    Tool(
        toolImage: "diamond_pickaxe.png",
        price: 15000,
        power: 600,
        drop: 600,
        isBought: false),
    Tool(
        toolImage: "netherite_pickaxe.png",
        price: 60000,
        power: 1800,
        drop: 1000,
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
    shop.forEach((element) {
      element.isBought = false;
    });
    ores.forEach((element) {
      element.health = element.startHealth;
    });
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
