import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservacion_canchas/src/providers/agendamientos_provider.dart';

class HomePage extends StatelessWidget {
  AgendamientosProvider _agendamientosProvider;

  @override
  Widget build(BuildContext context) {
    _agendamientosProvider = Provider.of<AgendamientosProvider>(context);

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
    return Container(
      child: Text('${_agendamientosProvider.agentamientos.length}'),
    );
  }

  FloatingActionButton _addButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.of(context).pushNamed('agendar'),
      child: Icon(Icons.add),
    );
  }
}
