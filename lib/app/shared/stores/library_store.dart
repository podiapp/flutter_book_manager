import 'dart:math';

import 'package:flutter_book_manager/app/shared/models/book_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../models/user_model.dart';
part 'library_store.g.dart';

@Injectable()
class LibraryStore = _LibraryStoreBase with _$LibraryStore;

abstract class _LibraryStoreBase with Store {
  @observable
  List<BookModel> books = ObservableList();

  @observable
  List<UserModel> users = ObservableList();

  @action
  void createUser(String name) {
    users.add(UserModel.create(name: name));
    users = users;
  }

  @action
  void createBook({
    required String title,
    required String author,
    required String synopsis,
    required String imageUrl,
    required int year,
  }) {
    final book = BookModel(
      id: Random().nextInt(1000).toString(),
      title: title,
      author: author,
      synopsis: synopsis,
      imageUrl: imageUrl,
      year: year,
    );
    books.add(book);
    books = books;
  }
}
