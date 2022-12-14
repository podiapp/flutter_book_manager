import 'package:flutter/material.dart';
import 'package:flutter_book_manager/app/shared/stores/bottom_nav_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomBottomNav extends StatelessWidget {
  CustomBottomNav({super.key});

  final store = Modular.get<BottomNavStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.collections_bookmark,
            ),
            label: "Livros",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.group,
            ),
            label: "Clientes",
          ),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: store.index,
        onTap: store.onChangedPage,
      ),
    );
  }
}
