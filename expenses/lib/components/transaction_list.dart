import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TransactionList(this.transactions, this.onRemove, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 200,
      child: transactions.isEmpty
          ? Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                  child: Text(
                    'Nenhuma Transação Cadastrada',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final tr = transactions[index];
                return Card(
                  elevation: 5,
                  child: ListTile(
                    leading: Container(
                      height: double.infinity,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'R\$ ${tr.value.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(
                      DateFormat('d MMM y').format(tr.date),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      color: Colors.red[700],
                      onPressed: () => onRemove(tr.id),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
