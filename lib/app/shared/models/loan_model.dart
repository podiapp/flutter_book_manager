import 'book_model.dart';

class LoanModel {
  BookModel book;
  DateTime takenAt;
  int maxDays;

  LoanModel({required this.book, required this.takenAt, this.maxDays = 0});

  DateTime get maxDate => takenAt.add(Duration(days: maxDays));

  bool get isExpired => maxDate.isBefore(DateTime.now());
}
