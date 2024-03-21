import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();
const uuid = Uuid();

enum Category {
  foodAndGroceries,
  transportation,
  housing,
  utilities,
  health,
  insurance,
  personal,
  entertainment,
  education,
  debtPayments,
  savingsAndInvestments,
  clothing,
  giftsAndDonations,
  pets,
  miscellaneous,
}

const categoryIcons = {
  Category.foodAndGroceries: Icon(Icons.fastfood),
  Category.transportation: Icon(Icons.flight_takeoff),
  Category.housing: Icon(Icons.home),
  Category.utilities: Icon(Icons.lightbulb),
  Category.health: Icon(Icons.local_hospital),
  Category.insurance: Icon(Icons.local_hospital_sharp),
  Category.personal: Icon(Icons.person),
  Category.entertainment: Icon(Icons.movie),
  Category.education: Icon(Icons.school),
  Category.debtPayments: Icon(Icons.money_off),
  Category.savingsAndInvestments: Icon(Icons.account_balance),
  Category.clothing: Icon(Icons.shopping_bag),
  Category.giftsAndDonations: Icon(Icons.card_giftcard),
  Category.pets: Icon(Icons.pets),
  Category.miscellaneous: Icon(Icons.more_horiz),
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}
