// To parse this JSON data, do
//
//     final resGetMaintenance = resGetMaintenanceFromJson(jsonString);

import 'dart:convert';

ResGetMaintenance resGetMaintenanceFromJson(String str) =>
    ResGetMaintenance.fromJson(json.decode(str));

String resGetMaintenanceToJson(ResGetMaintenance data) =>
    json.encode(data.toJson());

class ResGetMaintenance {
  ResGetMaintenance({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<Datum>? data;

  factory ResGetMaintenance.fromJson(Map<String, dynamic> json) =>
      ResGetMaintenance(
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
    required this.workshopName,
    required this.maintenanceTitle,
    required this.maintenanceDate,
    required this.maintenanceDetail,
    required this.maintenanceImage,
    required this.maintenanceCost,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int vehicleId;
  String workshopName;
  String maintenanceTitle;
  DateTime? maintenanceDate;
  String maintenanceDetail;
  String maintenanceImage;
  String maintenanceCost;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        vehicleId: json["vehicle_id"] == null ? null : json["vehicle_id"],
        workshopName:
            json["workshop_name"] == null ? null : json["workshop_name"],
        maintenanceTitle: json["maintenance_title"] == null
            ? null
            : json["maintenance_title"],
        maintenanceDate: json["maintenance_date"] == null
            ? null
            : DateTime.parse(json["maintenance_date"]),
        maintenanceDetail: json["maintenance_detail"] == null
            ? null
            : json["maintenance_detail"],
        maintenanceImage: json["maintenance_image"] == null
            ? null
            : json["maintenance_image"],
        maintenanceCost:
            json["maintenance_cost"] == null ? null : json["maintenance_cost"],
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
        "workshop_name": workshopName == null ? null : workshopName,
        "maintenance_title": maintenanceTitle == null ? null : maintenanceTitle,
        "maintenance_date": maintenanceDate == null
            ? null
            : "${maintenanceDate?.year.toString().padLeft(4, '0')}-${maintenanceDate?.month.toString().padLeft(2, '0')}-${maintenanceDate?.day.toString().padLeft(2, '0')}",
        "maintenance_detail":
            maintenanceDetail == null ? null : maintenanceDetail,
        "maintenance_image": maintenanceImage == null ? null : maintenanceImage,
        "maintenance_cost": maintenanceCost == null ? null : maintenanceCost,
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
      };
}
