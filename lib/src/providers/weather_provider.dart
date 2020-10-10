import 'dart:convert';

import 'package:reservacion_canchas/src/models/pronostico_model.dart';
import 'package:http/http.dart' as http;

class WeatherProvider {
  final baseUrl = 'https://weatherforecast01.firebaseio.com/days/';
  Future<PronosticoModel> getPronostico(String fecha) async {
    final url = baseUrl + fecha + '.json';

    final res = await http.get(url);

    final rawBody = json.decode(res.body);

    if (rawBody == null) {
      return null;
    }

    PronosticoModel pronostico = PronosticoModel.fromJson(rawBody);
    return pronostico;
  }
}
