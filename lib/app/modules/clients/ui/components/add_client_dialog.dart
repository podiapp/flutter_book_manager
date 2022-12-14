import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddClientDialog extends StatelessWidget {
  AddClientDialog({super.key});

  final _formKey = GlobalKey<FormState>();

  Map<String, dynamic> data = {};

  Widget get _title {
    return const Text("Adicionar cliente");
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
                data['nome'] = v;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Nome do usuário",
              ),
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
