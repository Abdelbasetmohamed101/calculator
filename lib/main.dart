import 'package:calculator/resource/cubit.dart';
import 'package:calculator/resource/operations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider( 
      create: (context) => CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CalculatorScreen(),
      ),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _displayValue = '0';

  void _onButtonPressed(String buttonText) { 
    setState(() {
      if (buttonText == 'AC') {
        _displayValue = '0';
      } else if (buttonText == '=') {
      } else {
        if (_displayValue == '0') {
          _displayValue = buttonText;
        } else {
          _displayValue += buttonText;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: BlocBuilder<CounterCubit, CounterStates>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _displayValue,
                    style: const TextStyle(fontSize: 36.0),
                  ),
                ),
              ),
              const Divider(height: 1.0),
              Row(
                children: [
                  buildButton('AC'), // Add the AC button
                  buildButton('7'),
                  buildButton('8'),
                  buildButton('9'),
                  buildButton('/'),
                ],
              ),
              Row(
                children: [
                  buildButton(' '),
                  buildButton('4'),
                  buildButton('5'),
                  buildButton('6'),
                  buildButton('X'),
                ],
              ),
              Row(
                children: [
                  buildButton(' '),
                  buildButton('1'),
                  buildButton('2'),
                  buildButton('3'),
                  buildButton('-'),
                ],
              ),
              Row(
                children: [
                  buildButton(' '),
                  buildButton('0'),
                  buildButton('.'),
                  buildButton('='),
                  buildButton('+'),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: MaterialButton(
        onPressed: () => _onButtonPressed(buttonText),
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
