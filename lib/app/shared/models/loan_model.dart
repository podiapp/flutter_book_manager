import 'book_model.dart';

class LoanModel {
  BookModel book;
  DateTime takenAt;
  int maxDays;

  LoanModel({required this.book, required this.takenAt, this.maxDays = 0});

  factory LoanModel.create({required BookModel book, required int days}) {
    return LoanModel(
      book: book,
      takenAt: DateTime.now(),
      maxDays: days,
    );
  }

  DateTime get maxDate => takenAt.add(Duration(days: maxDays));

  bool get isExpired => maxDate.isBefore(DateTime.now());
}
