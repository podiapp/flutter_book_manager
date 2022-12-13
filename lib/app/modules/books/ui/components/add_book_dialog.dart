import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddBookDialog extends StatelessWidget {
  AddBookDialog({super.key});

  final _formKey = GlobalKey<FormState>();

  Map<String, dynamic> data = {};

  Widget get _title {
    return const Text("Adicionar livro");
  }

  Widget get _content {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              onChanged: (v) {
                data['titulo'] = v;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Nome do livro",
              ),
              validator: (value) {
                if (value == null || value.trim() == "") {
                  return "Campo obrigatório";
                }
                return null;
              },
            ),
            const SizedBox(height: 8),
            TextFormField(
              onChanged: (v) {
                data['autor'] = v;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Nome do autor",
              ),
              validator: (value) {
                if (value == null || value.trim() == "") {
                  return "Campo obrigatório";
                }
                return null;
              },
            ),
            const SizedBox(height: 8),
            TextFormField(
              onChanged: (v) {
                data['ano'] = int.parse(v);
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Ano de publicação",
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                if (value == null || value.trim() == "") {
                  return "Campo obrigatório";
                }
                return null;
              },
            ),
            const SizedBox(height: 8),
            TextFormField(
              onChanged: (v) {
                data['url'] = v;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "URL da imagem",
              ),
              validator: (value) {
                if (value == null || value.trim() == "") {
                  return "Campo obrigatório";
                }
                return null;
              },
            ),
            const SizedBox(height: 8),
            TextFormField(
              onChanged: (v) {
                data['sinopse'] = v;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Sinopse",
              ),
              maxLines: 3,
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
            Modular.to.pop(data);
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
