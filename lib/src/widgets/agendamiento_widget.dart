import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservacion_canchas/src/models/agendamiento_model.dart';
import 'package:reservacion_canchas/src/providers/agendamientos_provider.dart';

class Agendamiento extends StatelessWidget {
  AgendamientoModel agendamiento;
  Agendamiento({this.agendamiento});
  AgendamientosProvider _agendamientosProvider;
  @override
  Widget build(BuildContext context) {
    _agendamientosProvider = Provider.of<AgendamientosProvider>(context);
    return Container(
        margin: EdgeInsets.all(10.0),
        decoration: _containerDecoration(),
        child: _content(context));
  }

  void _dialogDelete(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text('Eliminar agendamiento'),
      content:
          Text("¿Seguro que desea eliminar el registro de este agendamiento?"),
      actions: [
        FlatButton(
          onPressed: () => _delete(context),
          child: Text('Eliminar'),
        )
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _delete(BuildContext context) {
    _agendamientosProvider.deleteAgendamiento(agendamiento.id);
    Navigator.of(context).pop();
  }

  Widget _image() {
    return Container(
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                    'assets/images/Cancha${agendamiento.cancha}.jpg'))));
  }

  Widget _content(BuildContext context) {
    String probabilidad = agendamiento.probabilidadLluvia != null
        ? '${agendamiento.probabilidadLluvia}%'
        : 'N/A';
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cancha: ${agendamiento.cancha}',
            style: TextStyle(fontSize: 20.0),
          ),
          Text(
            agendamiento.fecha,
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Usuario: ${agendamiento.usuario}'),
          Text('Probabilidad de lluvia: $probabilidad')
        ],
      ),
      leading: _image(),
      trailing: IconButton(
        onPressed: () => _dialogDelete(context),
        icon: Icon(Icons.delete),
      ),
    );
  }

  BoxDecoration _containerDecoration() {
    return BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(blurRadius: 8, color: Color.fromRGBO(0, 0, 0, 0.2))
    ]);
  }
}
