import 'package:expenses/components/transaction_list/empty_list.dart';
import 'package:expenses/components/transaction_list/populated_list.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TransactionList(this.transactions, this.onRemove, {super.key});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? const EmptyList()
        : PopulatedList(transactions, onRemove);
  }
}
