import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

var formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category { sport, food, rent, shop }

const categoryIcons = {
  Category.sport: Icons.sports_baseball,
  Category.food: Icons.food_bank,
  Category.rent: Icons.car_rental_rounded,
  Category.shop: Icons.shopping_basket,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4(); // this is an example of initializer list

  String id;
  String title;
  double amount;
  DateTime date;
  Category category;

String get formattedDate{
  return formatter.format(date);
}

}
