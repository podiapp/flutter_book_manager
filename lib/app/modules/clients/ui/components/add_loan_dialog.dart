import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_book_manager/app/shared/models/book_model.dart';
import 'package:flutter_book_manager/app/shared/models/loan_model.dart';
import 'package:flutter_book_manager/app/shared/stores/library_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddLoanDialog extends StatefulWidget {
  const AddLoanDialog({super.key});

  @override
  State<AddLoanDialog> createState() => _AddLoanDialogState();
}

class _AddLoanDialogState extends State<AddLoanDialog> {
  final _formKey = GlobalKey<FormState>();
  final store = Modular.get<LibraryStore>();

  BookModel? book;

  int days = 0;

  Widget get _title {
    return const Text("Adicionar empréstimo");
  }

  Widget get _content {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (store.books.isNotEmpty) ...[
              DropdownButton<BookModel>(
                value: book,
                hint: const Text("Selecione um livro"),
                items: store.books
                    .map<DropdownMenuItem<BookModel>>(
                      (b) => DropdownMenuItem<BookModel>(
                        value: b,
                        child: Text(b.title),
                      ),
                    )
                    .toList(),
                onChanged: (v) {
                  book = v;
                  setState(() {});
                },
              ),
            ] else ...[
              const Text("Não há livros cadastrados!"),
            ],
            const SizedBox(height: 8),
            TextFormField(
              initialValue: days.toString(),
              onChanged: (v) {
                if (v != "") {
                  days = int.parse(v);
                }
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Quantos dias",
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                if (value == null || value.trim() == "") {
                  return "Campo obrigatório";
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> get _actions {
    return [
      TextButton(
        onPressed: () {
          Modular.to.pop();
        },
        child: const Text("Cancelar"),
      ),
      TextButton(
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            if (book != null) {
              return Modular.to.pop(LoanModel.create(book: book!, days: days));
            }
          }
        },
        child: const Text("OK"),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: _title,
      content: _content,
      actions: _actions,
    );
  }
}
