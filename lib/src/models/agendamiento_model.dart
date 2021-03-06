import 'dart:convert';

AgendamientoModel agendamientoModelFromJson(String str) =>
    AgendamientoModel.fromJson(json.decode(str));

String agendamientoModelToJson(AgendamientoModel data) =>
    json.encode(data.toJson());

class AgendamientoModel {
  AgendamientoModel({
    this.id,
    this.cancha,
    this.usuario,
    this.fecha,
    this.probabilidadLluvia,
    this.humedad,
    this.temperatura,
  });

  int id;
  String cancha;
  String usuario;
  String fecha;
  int probabilidadLluvia;
  int humedad;
  int temperatura;

  factory AgendamientoModel.fromJson(Map<String, dynamic> json) =>
      AgendamientoModel(
          id: json['id'],
          cancha: json['cancha'],
          usuario: json['usuario'],
          fecha: json['fecha'],
          probabilidadLluvia: json['probabilidadLluvia'],
          humedad: json['humedad'],
          temperatura: json['temperatura']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'cancha': cancha,
        'usuario': usuario,
        'fecha': fecha,
        'probabilidadLluvia': probabilidadLluvia,
        'humedad': humedad,
        'temperatura': temperatura
      };
}
