import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        body: TransfersLists(),
        appBar: AppBar(
          title: Text('Transfers'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    ));

class TransfersLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransferItem(Transfer(100.0, 123)),
        TransferItem(Transfer(400.0, 321)),
        TransferItem(Transfer(500.0, 666)),
      ],
    );
  }
}

class TransferItem extends StatelessWidget {

  final Transfer _transfer;

  TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transfer.valor.toString()),
        subtitle: Text(_transfer.accountnumber.toString()),
      ),
    );
  }
}

class Transfer {
  final double valor;
  final int accountnumber;

  Transfer(this.valor, this.accountnumber);
}
