import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendamientos'),
        centerTitle: true,
      ),
      body: _agendamientosList(),
      floatingActionButton: _addButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _agendamientosList() {
    return Container();
  }

  FloatingActionButton _addButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.of(context).pushNamed('agendar'),
      child: Icon(Icons.add),
    );
  }
}
