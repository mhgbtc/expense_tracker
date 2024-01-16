import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum CategoryList { food, travel, leisure, work }

const categoryIcons = {
  CategoryList.food: Icons.lunch_dining,
  CategoryList.travel: Icons.flight_takeoff,
  CategoryList.leisure: Icons.movie,
  CategoryList.work: Icons.work
};

final formatter = DateFormat.yMd();

class Expense {
  Expense({
        required this.title,
        required this.amount,
        required this.date,
        required this.category
      }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final CategoryList category;

  String get formattedDate {
    return formatter.format(date);
  }
}