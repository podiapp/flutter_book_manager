import 'package:flutter_book_manager/app/shared/utils.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'bottom_nav_store.g.dart';

@Injectable()
class BottomNavStore = _BottomNavStoreBase with _$BottomNavStore;

abstract class _BottomNavStoreBase with Store {
  @observable
  int index = 0;

  @action
  void onChangedPage(int index) {
    this.index = index;
    switch (index) {
      case 0:
        if (!isCurrentPage(ProjectRoutes.bookModule)) {
          Modular.to.pushReplacementNamed(ProjectRoutes.bookModule);
        }
        break;
      case 1:
        if (!isCurrentPage(ProjectRoutes.clientModule)) {
          Modular.to.pushReplacementNamed(ProjectRoutes.clientModule);
        }
        break;
      default:
        break;
    }
  }

  bool isCurrentPage(String path) {
    return Modular.to.path == path;
  }
}
