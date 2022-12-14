// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_detail_store.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ClientDetailStore = BindInject(
  (i) => ClientDetailStore(i<LibraryStore>()),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClientDetailStore on _ClientDetailStoreBase, Store {
  Computed<List<LoanModel>>? _$loansComputed;

  @override
  List<LoanModel> get loans =>
      (_$loansComputed ??= Computed<List<LoanModel>>(() => super.loans,
              name: '_ClientDetailStoreBase.loans'))
          .value;
  Computed<List<BookModel>>? _$booksComputed;

  @override
  List<BookModel> get books =>
      (_$booksComputed ??= Computed<List<BookModel>>(() => super.books,
              name: '_ClientDetailStoreBase.books'))
          .value;

  final _$userAtom = Atom(name: '_ClientDetailStoreBase.user');

  @override
  UserModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$_ClientDetailStoreBaseActionController =
      ActionController(name: '_ClientDetailStoreBase');

  @override
  void init(String id) {
    final _$actionInfo = _$_ClientDetailStoreBaseActionController.startAction(
        name: '_ClientDetailStoreBase.init');
    try {
      return super.init(id);
    } finally {
      _$_ClientDetailStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addLoan(LoanModel loan) {
    final _$actionInfo = _$_ClientDetailStoreBaseActionController.startAction(
        name: '_ClientDetailStoreBase.addLoan');
    try {
      return super.addLoan(loan);
    } finally {
      _$_ClientDetailStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
loans: ${loans},
books: ${books}
    ''';
  }
}
