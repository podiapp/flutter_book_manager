import 'loan_model.dart';

class UserModel {
  String name;
  DateTime memberSince;
  List<LoanModel> loans;

  UserModel({this.name = "", required this.memberSince, required this.loans});

  factory UserModel.create({required String name}) {
    return UserModel(
      name: name,
      memberSince: DateTime.now(),
      loans: [],
    );
  }
}
