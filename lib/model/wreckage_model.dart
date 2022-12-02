// To parse this JSON data, do
//
//     final resPostWreakage = resPostWreakageFromJson(jsonString);

import 'dart:convert';

ResPostWreakage resPostWreakageFromJson(String str) =>
    ResPostWreakage.fromJson(json.decode(str));

String resPostWreakageToJson(ResPostWreakage data) =>
    json.encode(data.toJson());

class ResPostWreakage {
  ResPostWreakage({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data? data;

  factory ResPostWreakage.fromJson(Map<String, dynamic> json) =>
      ResPostWreakage(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : data?.toJson(),
      };
}

class Data {
  Data({
    required this.vehicleId,
    required this.driverId,
    required this.location,
    required this.date,
    required this.wreckageTitle,
    required this.description,
    required this.actionNeeded,
    required this.wreckageImage,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  String vehicleId;
  String driverId;
  String location;
  DateTime? date;
  String wreckageTitle;
  String description;
  String actionNeeded;
  String wreckageImage;
  DateTime? updatedAt;
  DateTime? createdAt;
  int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        vehicleId: json["vehicle_id"] == null ? null : json["vehicle_id"],
        driverId: json["driver_id"] == null ? null : json["driver_id"],
        location: json["location"] == null ? null : json["location"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        wreckageTitle:
            json["wreckage_title"] == null ? null : json["wreckage_title"],
        description: json["description"] == null ? null : json["description"],
        actionNeeded:
            json["action_needed"] == null ? null : json["action_needed"],
        wreckageImage:
            json["wreckage_image"] == null ? null : json["wreckage_image"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "vehicle_id": vehicleId == null ? null : vehicleId,
        "driver_id": driverId == null ? null : driverId,
        "location": location == null ? null : location,
        "date": date == null
            ? null
            : "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
        "wreckage_title": wreckageTitle == null ? null : wreckageTitle,
        "description": description == null ? null : description,
        "action_needed": actionNeeded == null ? null : actionNeeded,
        "wreckage_image": wreckageImage == null ? null : wreckageImage,
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "id": id == null ? null : id,
      };
}
