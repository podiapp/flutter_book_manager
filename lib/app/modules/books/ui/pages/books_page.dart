import 'package:flutter/material.dart';
import 'package:flutter_book_manager/app/modules/books/ui/components/add_book_dialog.dart';
import 'package:flutter_book_manager/app/shared/models/book_model.dart';
import 'package:flutter_book_manager/app/shared/stores/library_store.dart';
import 'package:flutter_book_manager/app/shared/utils.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../shared/components/bottom_nav_bar.dart';

class BooksPage extends StatelessWidget {
  BooksPage({super.key});

  final store = Modular.get<LibraryStore>();

  Future<void> addBook(BuildContext context) async {
    Map<String, dynamic>? bookData = await showDialog(
      context: context,
      builder: (_) => AddBookDialog(),
    );
    if (bookData != null) {
      store.createBook(
        title: bookData['titulo'],
        author: bookData['autor'],
        synopsis: bookData['sinopse'],
        imageUrl: bookData['url'],
        year: bookData['ano'],
      );
    }
  }

  Widget get _list {
    Widget buildCard(int index) {
      final book = store.books[index];

      Widget image() {
        return SizedBox(
          height: 165,
          width: double.infinity,
          child: Image.network(
            book.imageUrl,
            fit: BoxFit.cover,
          ),
        );
      }

      Widget info() {
        return Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${book.title}, ${book.year}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                book.author,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF858585),
                ),
              ),
            ],
          ),
        );
      }

      return InkWell(
        onTap: () {
          Modular.to.pushNamed(ProjectRoutes.bookPage(id: book.id));
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.16),
                offset: const Offset(0, 0),
                blurRadius: 24,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                image(),
                info(),
              ],
            ),
          ),
        ),
      );
    }

    return Observer(
      builder: (_) {
        if (store.books.isEmpty) {
          return const Center(
            child:
                Text("Sem livros! Comece adicionando um livro na biblioteca."),
          );
        }

        return ListView.separated(
          itemCount: store.books.length,
          separatorBuilder: (_, __) => const SizedBox(height: 24),
          itemBuilder: (_, index) => buildCard(index),
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
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
        addBook(context);
        // store.createBook(
        //   title: "O míto de sísifo",
        //   author: "Albert Camus",
        //   synopsis: "Uma obra filosófica do Absurdismo.",
        //   imageUrl: "https://m.media-amazon.com/images/I/71pipdrO4kL.jpg",
        //   year: 1942,
        // );
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
