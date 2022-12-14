import 'package:flutter/material.dart';
import 'package:flutter_book_manager/app/modules/clients/ui/components/add_client_dialog.dart';
import 'package:flutter_book_manager/app/shared/stores/library_store.dart';
import 'package:flutter_book_manager/app/shared/utils.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../shared/components/bottom_nav_bar.dart';

class ClientsPage extends StatelessWidget {
  ClientsPage({super.key});

  final store = Modular.get<LibraryStore>();

  Future<void> addClient(BuildContext context) async {
    Map<String, dynamic>? clientData = await showDialog(
      context: context,
      builder: (_) => AddClientDialog(),
    );
    if (clientData != null) {
      store.createUser(clientData['nome']);
    }
  }

  Widget get _list {
    Widget buildItem(int index) {
      final user = store.users[index];

      return ListTile(
        title: Text(user.name),
        shape: const Border(
          bottom: BorderSide(color: Colors.grey),
        ),
        onTap: () {
          Modular.to.pushNamed(ProjectRoutes.clientPage(id: user.id));
        },
      );
    }

    return Observer(
      builder: (_) {
        if (store.users.isEmpty) {
          return const Center(
            child: Text(
                "Sem clientes! Comece adicionando um cliente na biblioteca."),
          );
        }

        return ListView.builder(
          itemCount: store.users.length + 1,
          itemBuilder: (_, index) {
            if (index == 0) {
              return const Padding(
                padding: EdgeInsets.only(
                  bottom: 16,
                  left: 16,
                ),
                child: Text(
                  "Clientes",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }
            return buildItem(index - 1);
          },
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(vertical: 24),
          physics: const BouncingScrollPhysics(),
        );
      },
    );
  }

  AppBar get _appBar {
    return AppBar(
      title: const Text("Biblioteca BookWorm"),
      centerTitle: true,
    );
  }

  Widget _fab(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
      onPressed: () {
        addClient(context);
      },
    );
  }

  Widget get _bottomNav {
    return CustomBottomNav();
  }

  Widget _body(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _list,
      floatingActionButton: _fab(context),
      bottomNavigationBar: _bottomNav,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _body(context);
  }
}
