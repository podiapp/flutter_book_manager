import 'dart:math';

import 'package:mobx/mobx.dart';

import 'loan_model.dart';

class UserModel {
  String id;
  String name;
  DateTime memberSince;
  List<LoanModel> loans;

  UserModel(
      {required this.id,
      this.name = "",
      required this.memberSince,
      required this.loans});

  factory UserModel.create({required String name}) {
    return UserModel(
      id: Random().nextInt(5000).toString(),
      name: name,
      memberSince: DateTime.now(),
      loans: ObservableList(),
    );
  }
}
