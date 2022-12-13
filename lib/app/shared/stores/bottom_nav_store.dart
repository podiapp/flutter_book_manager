import 'package:flutter_book_manager/app/shared/utils.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'bottom_nav_store.g.dart';

@Injectable()
class BottomNavStore = _BottomNavStoreBase with _$BottomNavStore;

abstract class _BottomNavStoreBase with Store {
  @observable
  int index = -1;

  @action
  void changeIndex(int index) => this.index = index;

  void onChangedPage(int index) {
    switch (index) {
      case 0:
        if (!isCurrentPage(ProjectRoutes.bookModule)) {
          changeIndex(index);
          Modular.to.pushNamed(ProjectRoutes.bookModule);
        }
        break;
      case 1:
        if (!isCurrentPage(ProjectRoutes.clientModule)) {
          changeIndex(index);
          Modular.to.pushNamed(ProjectRoutes.clientModule);
        }
        break;
      default:
        break;
    }
  }

  bool isCurrentPage(String path) {
    return Modular.to.path.contains(path);
  }
}
