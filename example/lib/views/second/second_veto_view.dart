import 'package:example/views/second/second_veto_view_arguments.dart';
import 'package:flutter/material.dart';
import 'package:veto/base_view_model.dart';

import 'second_veto_view_model.dart';

class SecondVetoView extends StatelessWidget {
  const SecondVetoView({
    required SecondVetoViewArguments secondVetoViewArguments,
    Key? key,
  })  : _secondVetoViewArguments = secondVetoViewArguments,
        super(key: key);

  static const String route = 'second-veto-view';

  final SecondVetoViewArguments _secondVetoViewArguments;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SecondVetoViewModel>(
      argumentBuilder: () => _secondVetoViewArguments,
      builder: (context, model) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Veto Test App'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(height: 32),
                  Text(
                    'Second Veto View',
                    textAlign: TextAlign.center,
                    style: model.textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // const SizedBox(height: 32), // TODO(codaveto): Enable assets | 20/09/2022
                  // const Image(
                  //   image: AssetImage(
                  //       'assets/images/2022092002.png'
                  //   ),
                  // ),
                  const SizedBox(height: 32),
                  ValueListenableBuilder<int>(
                    valueListenable: model.firstValue,
                    builder: (context, firstValue, child) => Text(
                      'First value: $firstValue',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ValueListenableBuilder<int>(
                    valueListenable: model.secondValue,
                    builder: (context, secondValue, child) => Text(
                      'Second value: $secondValue',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: ElevatedButton(
                      onPressed: model.goBack,
                      child: const Text('Back'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => SecondVetoViewModel.locate,
    );
  }
}
