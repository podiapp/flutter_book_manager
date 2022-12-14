import 'package:flutter_book_manager/app/modules/clients/ui/pages/client_detail_page.dart';
import 'package:flutter_book_manager/app/modules/clients/ui/stores/client_detail_store.dart';
import 'package:flutter_book_manager/app/shared/utils.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'ui/pages/clients_page.dart';

class ClientsModule extends Module {
  @override
  final List<Bind> binds = [
    $ClientDetailStore,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, args) => ClientsPage()),
    ChildRoute(ProjectRoutes.clientPage(complete: false),
        child: (_, args) => ClientDetailPage(
              userId: args.params['clientId'],
            )),
  ];
}
