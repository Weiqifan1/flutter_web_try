import 'dart:html' as webFile;
//20210116: kan maaske bruge dette til at laese filer: https://pub.dev/packages/file_picker
//import 'package:file_picker_web/file_picker_web.dart' as webPicker;

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
  TextEditingController plainUserInputController = new TextEditingController();
  TextEditingController userFileInputController = new TextEditingController();
/*
  String readFileAsync() {
    //assert(localContext != null);
    File file = new File('./assets/userInputFiles/basicInputFile.txt'); // (1)
    Future<String> futureContent = file.readAsString(); //(2)
    futureContent.then((c) {
      print(c);
      return c;//set(textField);
    });//=> print(c)); // (3)
  }
*/
  String readFileSync() {
    //only for dart:io which doesnt work in the browser
    //String contents = new File('./assets/userInputFiles/basicInputFile.txt').readAsStringSync();
    String contents = userFileInputController.text;//'my fake file content';
    return contents;
  }

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
            controller: plainUserInputController,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter a search term'
            ),
          ),
          TextField(
            controller: userFileInputController,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'here goes the file input 3'
            ),
          ),
          BlocBuilder<CounterCubit, String>(
            builder: (context, state) {
              return Text('$state');//, style: textTheme.headline2);
            },
          ),
          FloatingActionButton(
            key: const Key('counterView_increment_floatingActionButton'),
            child: const Text('readTextfield'),//Icon(Icons.add),
            onPressed: () {
              String textField = plainUserInputController.text;
              context.read<CounterCubit>().setUserInputState(textField);
              context.read<CounterCubit>().displayUserInputState();
            }//=> context.read<CounterCubit>().increment(),
          ),
          FloatingActionButton(
            key: const Key('counterView_readFile_floatingActionButton'),
            child: const Text('readFile'),
            onPressed: (){
              String fileContent = readFileSync();
              context.read<CounterCubit>().setUserInputFileContent(fileContent);
              context.read<CounterCubit>().displayUserInputFileContent();
          }//=> context.read<CounterCubit>().decrement(),
          ),

          FloatingActionButton(
            key: const Key('counterView_downloadFile_floatingActionButton'),
            child: const Text('downlaodFile'),
            onPressed: () {

              Future<String> output = context.read<CounterCubit>().getUserOutputFileContent();
              output.then((val) {
                var blob = webFile.Blob([val], 'text/plain', 'native');
                var anchorElement = webFile.AnchorElement(
                  href: webFile.Url.createObjectUrlFromBlob(blob).toString(),
                )..setAttribute("download", "data.txt")..click();
                context.read<CounterCubit>().displayUserOutputFileContent();
              });
              /*
              String output = context.read<CounterCubit>().getUserOutputFileContent();
              var blob = webFile.Blob([output], 'text/plain', 'native');
              var anchorElement = webFile.AnchorElement(
                href: webFile.Url.createObjectUrlFromBlob(blob).toString(),
              )..setAttribute("download", "data.txt")..click();
              context.read<CounterCubit>().displayUserOutputFileContent();

               */
            }//=> context.read<CounterCubit>().decrement(),
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