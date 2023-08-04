import 'package:expenses/components/list_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/transaction.dart';

class PopulatedList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const PopulatedList(this.transactions, this.onRemove, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final tr = transactions[index];
        return ListItem(tr, onRemove);
      },
    );
  }
}
