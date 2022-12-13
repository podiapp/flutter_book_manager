import 'package:flutter_book_manager/app/modules/books/books_module.dart';
import 'package:flutter_book_manager/app/shared/stores/bottom_nav_store.dart';
import 'package:flutter_book_manager/app/shared/stores/library_store.dart';
import 'package:flutter_book_manager/app/shared/utils.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/clients/clients_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    $LibraryStore,
    $BottomNavStore,
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(ProjectRoutes.bookModule, module: BooksModule()),
    ModuleRoute(ProjectRoutes.clientModule, module: ClientsModule()),
  ];
}
