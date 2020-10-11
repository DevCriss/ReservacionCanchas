import 'package:flutter_test/flutter_test.dart';
import 'package:reservacion_canchas/src/models/pronostico_model.dart';

void main() {
  test('Integridad conversión modelo de Pronostico', () {
    PronosticoModel pronostico =
        PronosticoModel(humidity: 51, rainProbability: 42, temperature: 28);

    Map<String, dynamic> intercambio = pronostico.toJson();

    PronosticoModel result = PronosticoModel.fromJson(intercambio);

    bool success = (pronostico.humidity == result.humidity &&
        pronostico.rainProbability == result.rainProbability &&
        pronostico.temperature == result.temperature);

    expect(success, true);
  });
}
