import 'package:flutter_test/flutter_test.dart';
import 'package:reservacion_canchas/src/models/agendamiento_model.dart';

void main() {
  test('Integridad conversión de modelo Agendamiento', () {
    AgendamientoModel agendamiento = AgendamientoModel(
        id: 1,
        cancha: 'A',
        fecha: '2020-11-16',
        usuario: 'Usuario prueba',
        humedad: 40,
        probabilidadLluvia: 23,
        temperatura: 31);

    Map<String, dynamic> intercambio = agendamiento.toJson();
    AgendamientoModel result = AgendamientoModel.fromJson(intercambio);

    bool seccess = (agendamiento.id == result.id &&
        agendamiento.cancha == result.cancha &&
        agendamiento.usuario == result.usuario &&
        agendamiento.fecha == result.fecha &&
        agendamiento.probabilidadLluvia == result.probabilidadLluvia &&
        agendamiento.humedad == result.humedad &&
        agendamiento.temperatura == result.temperatura);

    expect(seccess, true);
  });
}
