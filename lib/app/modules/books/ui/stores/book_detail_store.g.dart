// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_detail_store.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $BookDetailStore = BindInject(
  (i) => BookDetailStore(i<LibraryStore>()),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BookDetailStore on _BookDetailStoreBase, Store {
  final _$bookAtom = Atom(name: '_BookDetailStoreBase.book');

  @override
  BookModel get book {
    _$bookAtom.reportRead();
    return super.book;
  }

  @override
  set book(BookModel value) {
    _$bookAtom.reportWrite(value, super.book, () {
      super.book = value;
    });
  }

  final _$_BookDetailStoreBaseActionController =
      ActionController(name: '_BookDetailStoreBase');

  @override
  void init(String id) {
    final _$actionInfo = _$_BookDetailStoreBaseActionController.startAction(
        name: '_BookDetailStoreBase.init');
    try {
      return super.init(id);
    } finally {
      _$_BookDetailStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
book: ${book}
    ''';
  }
}
