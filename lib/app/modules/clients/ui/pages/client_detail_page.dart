import 'package:flutter/material.dart';
import 'package:flutter_book_manager/app/modules/clients/ui/components/add_loan_dialog.dart';
import 'package:flutter_book_manager/app/modules/clients/ui/stores/client_detail_store.dart';
import 'package:flutter_book_manager/app/shared/models/book_model.dart';
import 'package:flutter_book_manager/app/shared/models/loan_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

import '../../../../shared/utils.dart';

class ClientDetailPage extends StatelessWidget {
  final String userId;
  ClientDetailPage({required this.userId, super.key}) {
    store.init(userId);
  }

  final store = Modular.get<ClientDetailStore>();

  Future<void> addLoan(BuildContext context) async {
    LoanModel? loan = await showDialog(
      context: context,
      builder: (_) => const AddLoanDialog(),
    );

    if (loan != null) {
      store.addLoan(loan);
    }
  }

  AppBar get _appBar {
    return AppBar(
      title: Text(store.user.name),
      centerTitle: true,
    );
  }

  Widget get _list {
    return Observer(
      builder: (_) {
        Widget buildCard(int index) {
          final book = store.books[index];
          final loan = store.loans[index];

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        book.author,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF858585),
                        ),
                      ),
                      Text(
                        "Até ${DateFormat("dd/MM/yyyy").format(loan.maxDate)}",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF858585),
                        ),
                      ),
                    ],
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
                border: loan.isExpired
                    ? Border.all(
                        color: Colors.red,
                        width: 3,
                      )
                    : null,
                boxShadow: [
                  BoxShadow(
                    color: loan.isExpired
                        ? Colors.red.withOpacity(0.16)
                        : Colors.black.withOpacity(0.16),
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

        if (store.loans.isEmpty) {
          return const Center(
            child: Text(
                "Sem emprestimos! Comece emprestando um livro da biblioteca."),
          );
        }

        return ListView.separated(
          itemCount: store.loans.length + 1,
          separatorBuilder: (_, __) => const SizedBox(height: 24),
          itemBuilder: (_, index) {
            if (index == 0) {
              return const Text(
                "Livros emprestados",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              );
            }
            return buildCard(index - 1);
          },
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          physics: const BouncingScrollPhysics(),
        );
      },
    );
  }

  Widget _fab(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
      onPressed: () {
        addLoan(context);
      },
    );
  }

  Widget get _body {
    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _body,
      floatingActionButton: _fab(context),
    );
  }
}
