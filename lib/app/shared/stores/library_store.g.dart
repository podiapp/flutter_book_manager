// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_store.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $LibraryStore = BindInject(
  (i) => LibraryStore(),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LibraryStore on _LibraryStoreBase, Store {
  final _$booksAtom = Atom(name: '_LibraryStoreBase.books');

  @override
  List<BookModel> get books {
    _$booksAtom.reportRead();
    return super.books;
  }

  @override
  set books(List<BookModel> value) {
    _$booksAtom.reportWrite(value, super.books, () {
      super.books = value;
    });
  }

  final _$usersAtom = Atom(name: '_LibraryStoreBase.users');

  @override
  List<UserModel> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(List<UserModel> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  final _$_LibraryStoreBaseActionController =
      ActionController(name: '_LibraryStoreBase');

  @override
  void createUser(String name) {
    final _$actionInfo = _$_LibraryStoreBaseActionController.startAction(
        name: '_LibraryStoreBase.createUser');
    try {
      return super.createUser(name);
    } finally {
      _$_LibraryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void createBook(
      {required String title,
      required String author,
      required String synopsis,
      required String imageUrl,
      required int year}) {
    final _$actionInfo = _$_LibraryStoreBaseActionController.startAction(
        name: '_LibraryStoreBase.createBook');
    try {
      return super.createBook(
          title: title,
          author: author,
          synopsis: synopsis,
          imageUrl: imageUrl,
          year: year);
    } finally {
      _$_LibraryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
books: ${books},
users: ${users}
    ''';
  }
}
