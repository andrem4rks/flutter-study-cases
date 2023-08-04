import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListItem extends StatelessWidget {
  final Transaction _tr;
  final void Function(String) onRemove;

  const ListItem(this._tr, this.onRemove, {super.key});

  @override
  Widget build(BuildContext context) {
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
                'R\$ ${_tr.value.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          _tr.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          DateFormat('d MMM y').format(_tr.date),
        ),
        trailing: MediaQuery.of(context).size.width > 400
            ? TextButton.icon(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.red[700]),
                  iconColor: MaterialStateProperty.all(Colors.red[700]),
                ),
                label: const Text('Excluir'),
                icon: const Icon(Icons.delete),
                onPressed: () => onRemove(_tr.id),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Colors.red[700],
                onPressed: () => onRemove(_tr.id),
              ),
      ),
    );
  }
}
