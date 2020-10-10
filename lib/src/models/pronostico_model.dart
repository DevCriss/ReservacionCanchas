import 'dart:convert';

PronosticoModel pronosticoModelFromJson(String str) =>
    PronosticoModel.fromJson(json.decode(str));

String pronosticoModelToJson(PronosticoModel data) =>
    json.encode(data.toJson());

class PronosticoModel {
  PronosticoModel({
    this.humidity,
    this.rainProbability,
    this.temperature,
  });

  int humidity;
  int rainProbability;
  int temperature;

  factory PronosticoModel.fromJson(Map<String, dynamic> json) =>
      PronosticoModel(
        humidity: json["humidity"],
        rainProbability: json["rainProbability"],
        temperature: json["temperature"],
      );

  Map<String, dynamic> toJson() => {
        "humidity": humidity,
        "rainProbability": rainProbability,
        "temperature": temperature,
      };
}
