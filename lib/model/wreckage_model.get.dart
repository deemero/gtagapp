// To parse this JSON data, do
//
//     final resGetWreckage = resGetWreckageFromJson(jsonString);

import 'dart:convert';

ResGetWreckage resGetWreckageFromJson(String str) =>
    ResGetWreckage.fromJson(json.decode(str));

String resGetWreckageToJson(ResGetWreckage data) => json.encode(data.toJson());

class ResGetWreckage {
  ResGetWreckage({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<Datum>? data;

  factory ResGetWreckage.fromJson(Map<String, dynamic> json) => ResGetWreckage(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.vehicleId,
    required this.driverId,
    required this.location,
    required this.date,
    required this.wreckageImage,
    required this.wreckageTitle,
    required this.description,
    required this.actionNeeded,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int vehicleId;
  int driverId;
  String location;
  DateTime? date;
  String wreckageImage;
  String wreckageTitle;
  String description;
  String actionNeeded;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        vehicleId: json["vehicle_id"] == null ? null : json["vehicle_id"],
        driverId: json["driver_id"] == null ? null : json["driver_id"],
        location: json["location"] == null ? null : json["location"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        wreckageImage:
            json["wreckage_image"] == null ? null : json["wreckage_image"],
        wreckageTitle:
            json["wreckage_title"] == null ? null : json["wreckage_title"],
        description: json["description"] == null ? null : json["description"],
        actionNeeded:
            json["action_needed"] == null ? null : json["action_needed"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "vehicle_id": vehicleId == null ? null : vehicleId,
        "driver_id": driverId == null ? null : driverId,
        "location": location == null ? null : location,
        "date": date == null
            ? null
            : "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "wreckage_image": wreckageImage == null ? null : wreckageImage,
        "wreckage_title": wreckageTitle == null ? null : wreckageTitle,
        "description": description == null ? null : description,
        "action_needed": actionNeeded == null ? null : actionNeeded,
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
      };
}
