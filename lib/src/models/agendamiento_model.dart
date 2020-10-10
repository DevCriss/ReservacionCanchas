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
  });

  int id;
  String cancha;
  String usuario;
  String fecha;

  factory AgendamientoModel.fromJson(Map<String, dynamic> json) =>
      AgendamientoModel(
        id: json["id"],
        cancha: json["cancha"],
        usuario: json["usuario"],
        fecha: json["fecha"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cancha": cancha,
        "usuario": usuario,
        "fecha": fecha,
      };
}
