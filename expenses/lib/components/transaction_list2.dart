import 'dart:math';

import 'package:expenses/components/list_item.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionList2 extends StatefulWidget {
  @override
  State<TransactionList2> createState() => _TransactionList2State();
}

class _TransactionList2State extends State<TransactionList2> {
  final List _items = [];
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  final List<Transaction> _transactions = [
    Transaction(
      id: 't0',
      title: 'Conta Antiga',
      value: 400.00,
      date: DateTime.now().subtract(const Duration(days: 33)),
    ),
    Transaction(
      id: 't1',
      title: 'Novo Tenis de Corrida',
      value: 310.76,
      date: DateTime.now().subtract(const Duration(days: 3)),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 211.30,
      date: DateTime.now().subtract(const Duration(days: 4)),
    ),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );
    _transactions.add(newTransaction);

    _items.insert(0, ListItem(newTransaction));
    _key.currentState!.insertItem(
      0,
      duration: const Duration(milliseconds: 300),
    );

    Navigator.of(context).pop();
  }

  void _removeItem(int index) {
    _key.currentState!.removeItem(
      index,
      (_, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: const Card(
            margin: EdgeInsets.all(10),
            color: Colors.red,
            child: ListTile(
              title: Text(
                'Deleted',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        );
      },
    );
    _items.removeAt(index);
  }

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.height,
      height: 500,
      child: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: AnimatedList(
              key: _key,
              initialItemCount: 0,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index, animation) {
                return SizeTransition(
                  key: UniqueKey(),
                  sizeFactor: animation,
                  child: Card(
                    margin: const EdgeInsets.all(10),
                    color: Colors.purple,
                    child: ListTile(
                      title: Text(
                        _items[index],
                        style: TextStyle(fontSize: 24),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          _removeItem(index);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
