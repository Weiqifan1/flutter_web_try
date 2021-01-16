import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../counter.dart';

//I should create a View inside of counterview to see if it can be done.
//then I should create a larger View to contain CounterView
//const innerView = class InnerView extends StatelessWidget {
  //dette vil ikke virke. jeg maa laese teksten om layout igen
//}

const centerText = Text('her er text 3');

/// {@template counter_view}
/// A [StatelessWidget] which reacts to the provided
/// [CounterCubit] state and notifies it in response to user input.
/// {@endtemplate}
class CounterView extends StatelessWidget {
  TextEditingController emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child:
        Column(
        mainAxisAlignment: MainAxisAlignment.center,//MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            controller: emailController,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter a search term'
            ),
          ),
          BlocBuilder<CounterCubit, String>(
            builder: (context, state) {
              return Text('$state');//, style: textTheme.headline2);
            },
          ),
          FloatingActionButton(
            key: const Key('counterView_increment_floatingActionButton'),
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
        ],
      ),
            /*
        BlocBuilder<CounterCubit, String>(
          builder: (context, state) {
            return Text('$state');//, style: textTheme.headline2);
          },
        ),*/
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          BlocBuilder<CounterCubit, String>(
            builder: (context, state) {
              return Text('$state');//, style: textTheme.headline2);
            },
          ),
          FloatingActionButton(
            key: const Key('counterView_increment_floatingActionButton'),
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('counterView_decrement_floatingActionButton'),
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterCubit>().decrement(),
          ),
        ],
      ),
    );
  }
}