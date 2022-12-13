import 'package:flutter_book_manager/app/modules/books/ui/pages/book_detail_page.dart';
import 'package:flutter_book_manager/app/modules/books/ui/pages/books_page.dart';
import 'package:flutter_book_manager/app/modules/books/ui/stores/book_detail_store.dart';
import 'package:flutter_book_manager/app/shared/utils.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BooksModule extends Module {
  @override
  final List<Bind> binds = [
    $BookDetailStore,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      "/",
      child: (_, args) => BooksPage(),
    ),
    ChildRoute(
      ProjectRoutes.bookPage(complete: false),
      child: (_, args) => BookDetailPage(bookId: args.params['bookId']),
    ),
  ];
}
