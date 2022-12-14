import 'package:flutter_book_manager/app/shared/models/loan_model.dart';
import 'package:flutter_book_manager/app/shared/models/user_model.dart';
import 'package:flutter_book_manager/app/shared/stores/library_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../shared/models/book_model.dart';
part 'client_detail_store.g.dart';

@Injectable()
class ClientDetailStore = _ClientDetailStoreBase with _$ClientDetailStore;

abstract class _ClientDetailStoreBase with Store {
  final LibraryStore libraryStore;

  _ClientDetailStoreBase(this.libraryStore);

  @observable
  UserModel user = UserModel.create(name: "");

  @computed
  List<LoanModel> get loans => user.loans;

  @computed
  List<BookModel> get books => loans.map<BookModel>((l) => l.book).toList();

  @action
  void init(String id) {
    user = UserModel.create(name: "");
    user = libraryStore.users.firstWhere((u) => u.id == id);
  }

  @action
  void addLoan(LoanModel loan) {
    user.loans.add(loan);
    user = user;
  }
}
