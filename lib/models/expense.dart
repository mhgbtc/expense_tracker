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

class ExpenseBucket {
  const ExpenseBucket({
    required this.categoryList,
    required this.expenses
  });

  ExpenseBucket.forCategoryList(List<Expense> allExpenses, this.categoryList)
      : expenses = allExpenses.where((expense) => expense.category == categoryList).toList();

  final CategoryList categoryList;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for(final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}