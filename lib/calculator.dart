import 'package:flutter/material.dart';
import 'memory.dart';
import 'package:share/share.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final memory = new Memory();

  _buildDisplay() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 10, right: 10),
        color: Colors.black,
        child: Text(
          memory.result,
          style: TextStyle(
            fontSize: 80,
            fontFamily: 'RobotoMono',
            color: Colors.white,
          ),
          textAlign: TextAlign.end,
          maxLines: 1,
        ),
      ),
    );
  }

  _buildHistoryDisplay() {
    return Container(
      padding: EdgeInsets.only(top: 30, right: 10),
      color: Colors.black,
      child: Text(
        memory.history,
        style: TextStyle(
          fontSize: 20,
          fontFamily: 'RobotoMono',
          color: Colors.white,
        ),
        textAlign: TextAlign.end,
        maxLines: 1,
      ),
    );
  }

  _buildKeyboardButton(String label,
      {Color textColor = Colors.white, int flex = 1}) {
    return Expanded(
      flex: flex,
      child: RaisedButton(
        color: Colors.black,
        textColor: textColor,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        onPressed: () {
          setState(() {
            memory.applyCommand(label);
          });
        },
      ),
    );
  }

  _buildKeyboard() {
    return Container(
      color: Colors.black,
      height: 450,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('AC', textColor: Colors.deepOrange),
                _buildKeyboardButton('DEL', textColor: Colors.deepOrange),
                _buildKeyboardButton('%', textColor: Colors.deepOrange),
                _buildKeyboardButton('/', textColor: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('7'),
                _buildKeyboardButton('8'),
                _buildKeyboardButton('9'),
                _buildKeyboardButton('x', textColor: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('4'),
                _buildKeyboardButton('5'),
                _buildKeyboardButton('6'),
                _buildKeyboardButton('-', textColor: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('1'),
                _buildKeyboardButton('2'),
                _buildKeyboardButton('3'),
                _buildKeyboardButton('+', textColor: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('0', flex: 2),
                _buildKeyboardButton('.'),
                _buildKeyboardButton('=', textColor: Colors.deepOrange),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Expanded(
              child: Text('Calculadora'),
              flex: 1,
            ),
            Expanded(
                child: RaisedButton(
                    onPressed: (() => {
                          Share.share(
                              'Compratilhar essa mensagem linda que veio do Flutter. Entre no meu site https://maxtercreations.com.br')
                        }),
                    child: Text("Compartilhar"))),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildHistoryDisplay(),
          _buildDisplay(),
          Divider(
            height: 0.2,
          ),
          _buildKeyboard(),
        ],
      ),
    );
  }
}
