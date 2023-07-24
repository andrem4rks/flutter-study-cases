import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  TransactionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valueController,
              decoration: const InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: TextButton(
                child: const Text(
                  'Nova Transação',
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  print(titleController.text);
                  print(valueController.text);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
