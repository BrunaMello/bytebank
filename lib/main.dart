import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TransferForm(),
      ),
    );
  }
}


class TransferForm extends StatelessWidget{

  final TextEditingController _controllerAccountField = TextEditingController();
  final TextEditingController _controllerValueField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Transfer'),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controllerAccountField,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                labelText: 'Account Number',
                hintText: '0000'
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controllerValueField,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                  labelText: 'Value',
                  hintText: '0.00'
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final int accountNumber = int.parse(_controllerAccountField.text);
              final double value = double.parse(_controllerValueField.text);
              if(accountNumber != null && value != null){
                final createdTransfer = Transfer(value, accountNumber);
                debugPrint('$createdTransfer');
              }
              } ,
            child: Text('Confirm'),
          )
        ],
      ));
}
}

class TransfersLists extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Transfers'),
        ),
      body: Column(
        children: <Widget>[
          TransferItem(Transfer(100.0, 123)),
          TransferItem(Transfer(400.0, 321)),
          TransferItem(Transfer(500.0, 666)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
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

  @override
  String toString() {
    return 'Transfer{valor: $valor, accountnumber: $accountnumber}';
  }
}
