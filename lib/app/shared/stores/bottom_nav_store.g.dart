// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_nav_store.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $BottomNavStore = BindInject(
  (i) => BottomNavStore(),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BottomNavStore on _BottomNavStoreBase, Store {
  final _$indexAtom = Atom(name: '_BottomNavStoreBase.index');

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  final _$_BottomNavStoreBaseActionController =
      ActionController(name: '_BottomNavStoreBase');

  @override
  void onChangedPage(int index) {
    final _$actionInfo = _$_BottomNavStoreBaseActionController.startAction(
        name: '_BottomNavStoreBase.onChangedPage');
    try {
      return super.onChangedPage(index);
    } finally {
      _$_BottomNavStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
index: ${index}
    ''';
  }
}
