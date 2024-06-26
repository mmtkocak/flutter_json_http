// To parse this JSON data, do
//
//     final araba = arabaFromMap(jsonString);

import 'dart:convert';

Araba arabaFromMap(String str) => Araba.fromMap(json.decode(str));

String arabaToMap(Araba data) => json.encode(data.toMap());

class Araba {
  final String arabaAdi;
  final String ulke;
  final int kurulusTarihi;
  final List<Model> model;

  Araba({
    required this.arabaAdi,
    required this.ulke,
    required this.kurulusTarihi,
    required this.model,
  });

  factory Araba.fromMap(Map<String, dynamic> json) => Araba(
    arabaAdi: json["araba_adi"],
    ulke: json["ulke"],
    kurulusTarihi: json["kurulus_tarihi"],
    model: List<Model>.from(json["model"].map((x) => Model.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "araba_adi": arabaAdi,
    "ulke": ulke,
    "kurulus_tarihi": kurulusTarihi,
    "model": List<dynamic>.from(model.map((x) => x.toMap())),
  };
}

class Model {
  final String modelAdi;
  final int fiyat;
  final bool benzinli;

  Model({
    required this.modelAdi,
    required this.fiyat,
    required this.benzinli,
  });

  factory Model.fromMap(Map<String, dynamic> json) => Model(
    modelAdi: json["model_adi"],
    fiyat: json["fiyat"],
    benzinli: json["benzinli"],
  );

  Map<String, dynamic> toMap() => {
    "model_adi": modelAdi,
    "fiyat": fiyat,
    "benzinli": benzinli,
  };
}
