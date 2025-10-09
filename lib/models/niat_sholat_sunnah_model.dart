import 'dart:convert';

List<NiatSholatSunnahModel> niatSholatSunnahFromJson(String str) =>
    List<NiatSholatSunnahModel>.from(
        json.decode(str).map((x) => NiatSholatSunnahModel.fromJson(x)));

String niatSholatSunnahToJson(List<NiatSholatSunnahModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NiatSholatSunnahModel {
  NiatSholatSunnahModel({
    required this.nomor,
    required this.title,
    required this.arab,
    required this.latin,
    required this.terjemah,
  });

  final int nomor;
  final String title;
  final String arab;
  final String latin;
  final String terjemah;

  factory NiatSholatSunnahModel.fromJson(Map<String, dynamic> json) =>
      NiatSholatSunnahModel(
        nomor: json["nomor"],
        title: json["title"],
        arab: json["arab"],
        latin: json["latin"],
        terjemah: json["terjemah"],
      );

  Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "title": title,
        "arab": arab,
        "latin": latin,
        "terjemah": terjemah,
      };
}
