import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservacion_canchas/src/models/pronostico_model.dart';
import 'package:reservacion_canchas/src/providers/agendamientos_provider.dart';
import 'package:reservacion_canchas/src/providers/formulario_provider.dart';
import 'package:reservacion_canchas/src/providers/weather_provider.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AgendarPage extends StatelessWidget {
  FormularioProvider _formularioProvider;
  AgendamientosProvider _angendamientoProvider;
  WeatherProvider _weatherProvider;

  @override
  Widget build(BuildContext context) {
    _formularioProvider = Provider.of<FormularioProvider>(context);
    _angendamientoProvider = Provider.of<AgendamientosProvider>(context);
    _weatherProvider = WeatherProvider();

    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo Agendamiento'),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: [
            _canchaField(context),
            _fechaField(context),
            _probabilidadLLuvia(),
            _nombreField(),
            _botones(context)
          ],
        ),
      ),
    );
  }

  Widget _canchaField(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Text(
            'Seleccionar Cancha',
            style: TextStyle(fontSize: 24),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _cachaItem('A', context),
              _cachaItem('B', context),
              _cachaItem('C', context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _fechaField(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          Text(
            'Fecha del agendamiento',
            style: TextStyle(fontSize: 22),
          ),
          SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formularioProvider.fecha != null
                    ? _formularioProvider.fecha
                    : 'Seleccione una fecha',
                style: TextStyle(fontSize: 18),
              ),
              RaisedButton(
                onPressed: () => _selectDate(context),
                color: Colors.blueAccent,
                textColor: Colors.white,
                child: Row(
                  children: [
                    Icon(Icons.calendar_today),
                    Text(
                      'Seleccionar',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _nombreField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Text(
            'Nombre del usuario',
            style: TextStyle(fontSize: 22),
          ),
          SizedBox(
            height: 14,
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Usuario',
                hintText: '¿Quién hace el agendamiento?'),
            onChanged: (text) => _formularioProvider.usuario = text,
          )
        ],
      ),
    );
  }

  Widget _botones(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RaisedButton(
            onPressed: () {
              _formularioProvider.resetForm();
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Icon(Icons.close),
                Text(
                  'Cancelar',
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            disabledColor: Color.fromRGBO(220, 220, 220, 1),
            onPressed: (_formularioProvider.cancha != null &&
                    _formularioProvider.fecha != null &&
                    _formularioProvider.usuario != null &&
                    _formularioProvider.usuario.toString().length > 0)
                ? () {
                    _formularioProvider.resetForm();
                    Navigator.of(context).pop();
                  }
                : null,
            child: Row(
              children: [
                Icon(Icons.add),
                Text(
                  'Agregar',
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _cachaItem(String cancha, BuildContext context) {
    final fullWidth = MediaQuery.of(context).size.width;
    return FlatButton(
      onPressed: () => _formularioProvider.cancha = cancha,
      padding: EdgeInsets.all(0),
      child: Container(
        width: fullWidth / 3.8,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(4),
        decoration: _formularioProvider?.cancha == cancha
            ? _selectedCanchaStyle()
            : null,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/Cancha$cancha.jpg",
                width: 280.0,
              ),
            ),
            Text(
              'Cancha $cancha',
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    var picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2025));
    if (picked != null) {
      final fecha = picked.toString().split(' ')[0];
      _formularioProvider.fecha = fecha;
      _formularioProvider.loadingWeather = true;

      PronosticoModel pronostico = await _weatherProvider.getPronostico(fecha);
      if (pronostico == null) {
        _showGeneralDialog(
            context,
            'No se pudo obtener la probabilidad de lluvia.',
            'La fecha seleccionada excede el rango disponible para generar una predicción acertada del clima, por lo que se realizará el agendamiento sin esta información.');

        _formularioProvider.probabilidadLluvia = null;
        _formularioProvider.loadingWeather = false;
        return;
      }
      _formularioProvider.loadingWeather = false;
      _formularioProvider.probabilidadLluvia = pronostico.rainProbability;
      _formularioProvider.humedad = pronostico.humidity;
      _formularioProvider.temperatura = pronostico.temperature;
    }
    ;
  }

  BoxDecoration _selectedCanchaStyle() {
    return BoxDecoration(
        boxShadow: [
          BoxShadow(blurRadius: 10, color: Color.fromRGBO(0, 0, 0, 0.1))
        ],
        color: Color.fromRGBO(0, 127, 255, 0.5),
        borderRadius: BorderRadius.circular(10));
  }

  Widget _probabilidadLLuvia() {
    return Container(
      child: _formularioProvider.probabilidadLluvia == null
          ? Container()
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Probabilidad de lluvia:',
                    style: TextStyle(fontSize: 20),
                  ),
                  _formularioProvider.loadingWeather
                      ? CircularProgressIndicator()
                      : CircularPercentIndicator(
                          radius: 45.0,
                          lineWidth: 5.0,
                          percent: _formularioProvider.probabilidadLluvia / 100,
                          center: new Text(
                              '${_formularioProvider.probabilidadLluvia}%'),
                          progressColor: Colors.green,
                        ),
                ],
              ),
            ),
    );
  }

  void _showGeneralDialog(BuildContext context, String title, String message) {
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        FlatButton(
            onPressed: () => Navigator.of(context).pop(), child: Text('Ok!'))
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
