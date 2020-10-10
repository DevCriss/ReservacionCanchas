import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservacion_canchas/src/models/agendamiento_model.dart';
import 'package:reservacion_canchas/src/providers/agendamientos_provider.dart';
import 'package:reservacion_canchas/src/widgets/agendamiento_widget.dart';

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
      body: _agendamientosList(context),
      floatingActionButton: _addButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  FloatingActionButton _addButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.of(context).pushNamed('agendar'),
      child: Icon(Icons.add),
    );
  }

  Widget _agendamientosList(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _agendamientosProvider.agentamientos.length,
        itemBuilder: (BuildContext context, int index) {
          AgendamientoModel ag = _agendamientosProvider.agentamientos[index];
          return Agendamiento(agendamiento: ag);
        });
  }
}
