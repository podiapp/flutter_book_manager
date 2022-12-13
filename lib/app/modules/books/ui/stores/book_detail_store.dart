import 'package:flutter_book_manager/app/shared/models/book_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../shared/stores/library_store.dart';
part 'book_detail_store.g.dart';

@Injectable()
class BookDetailStore = _BookDetailStoreBase with _$BookDetailStore;

abstract class _BookDetailStoreBase with Store {
  final LibraryStore libraryStore;

  _BookDetailStoreBase(this.libraryStore);

  @observable
  BookModel book = BookModel();

  @action
  void init(String id) {
    book = BookModel();
    book = libraryStore.books.firstWhere((b) => b.id == id);
  }
}
