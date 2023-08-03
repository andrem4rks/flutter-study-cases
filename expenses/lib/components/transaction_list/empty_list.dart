import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: [
          SizedBox(
            height: constraints.maxHeight * 0.2,
            width: 350,
            child: FittedBox(
              child: Text(
                'Nenhuma Transação Cadastrada',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.7,
            child: Image.asset(
              'assets/images/waiting.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.1,
          )
        ],
      );
    });
  }
}
