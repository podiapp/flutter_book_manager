import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_book_manager/app/modules/users/users_module.dart';
 
void main() {

  setUpAll(() {
    initModule(UsersModule());
  });
}