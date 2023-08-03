import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';

import 'package:expenses/components/chart.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:flutter/material.dart';

import 'components/transaction_list.dart';
import 'models/transaction.dart';

void main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  final ThemeData tema = ThemeData();

  ExpensesApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
            primary: Colors.purple,
            secondary: const Color.fromRGBO(186, 104, 200, 1),
            tertiary: const Color.fromRGBO(116, 94, 255, 1)),
        textTheme: tema.textTheme.copyWith(
          titleLarge: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 20 * MediaQuery.of(context).textScaleFactor,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [];
  bool _showChart = false;

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transactions.insert(0, newTransaction);
    });

    Navigator.of(context).pop();
  }

  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool isLandscape = mediaQuery.orientation == Orientation.landscape;

    final appBar = AppBar(
      title: const Text(
        'Despesas Pessoais',
      ),
      actions: [
        if (isLandscape)
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                setState(() {
                  _showChart = !_showChart;
                });
              },
              icon: Icon(
                _showChart ? Icons.list : Icons.show_chart,
              ),
            ),
          ),
      ],
    );

    final availableHeight = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top -
        16; // Tamanho do Padding total

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 768,
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // if (isLandscape)
                  //   Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       const Text('Exibir Gráfico'),
                  //       Switch.adaptive(
                  //         value: _showChart,
                  //         activeColor: Theme.of(context).colorScheme.tertiary,
                  //         onChanged: (value) {
                  //           setState(() {
                  //             _showChart = value;
                  //           });
                  //         },
                  //       ),
                  //     ],
                  //   ),
                  if (_showChart || !isLandscape)
                    SizedBox(
                      height: availableHeight * (isLandscape ? 0.6 : 0.2),
                      child: Chart(_recentTransactions),
                    ),
                  if (!_showChart || !isLandscape)
                    SizedBox(
                      height: isLandscape
                          ? availableHeight * 1
                          : availableHeight * 0.8,
                      child: TransactionList(_transactions, _removeTransaction),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: kIsWeb
          ? FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              onPressed: () => _openTransactionFormModal(context),
              child: const Icon(Icons.add),
            )
          : Platform.isIOS
              ? Container()
              : FloatingActionButton(
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                  onPressed: () => _openTransactionFormModal(context),
                  child: const Icon(Icons.add),
                ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
