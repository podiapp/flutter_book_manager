import 'package:flutter/material.dart';
import 'package:flutter_book_manager/app/modules/books/ui/stores/book_detail_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BookDetailPage extends StatelessWidget {
  final String bookId;
  BookDetailPage({required this.bookId, super.key}) {
    store.init(bookId);
  }

  final store = Modular.get<BookDetailStore>();

  AppBar get _appBar {
    return AppBar(
      title: Text(store.book.title),
      centerTitle: true,
    );
  }

  Widget get _image {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Image.network(store.book.imageUrl, fit: BoxFit.cover),
    );
  }

  Widget get _info {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          "${store.book.author}, ${store.book.year}",
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          store.book.synopsis,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget get _body {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _image,
        Expanded(child: _info),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _body,
    );
  }
}
