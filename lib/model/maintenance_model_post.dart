// To parse this JSON data, do
//
//     final resPostMaintenance = resPostMaintenanceFromJson(jsonString);

import 'dart:convert';

ResPostMaintenance resPostMaintenanceFromJson(String str) =>
    ResPostMaintenance.fromJson(json.decode(str));

String resPostMaintenanceToJson(ResPostMaintenance data) =>
    json.encode(data.toJson());

class ResPostMaintenance {
  ResPostMaintenance({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data? data;

  factory ResPostMaintenance.fromJson(Map<String, dynamic> json) =>
      ResPostMaintenance(
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
    required this.maintenanceImage,
    required this.vehicleId,
    required this.workshopName,
    required this.maintenanceTitle,
    required this.maintenanceDate,
    required this.maintenanceDetail,
    required this.maintenanceCost,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  String maintenanceImage;
  String vehicleId;
  String workshopName;
  String maintenanceTitle;
  DateTime? maintenanceDate;
  String maintenanceDetail;
  String maintenanceCost;
  DateTime? updatedAt;
  DateTime? createdAt;
  int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        maintenanceImage: json["maintenance_image"] == null
            ? null
            : json["maintenance_image"],
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
        maintenanceCost:
            json["maintenance_cost"] == null ? null : json["maintenance_cost"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "maintenance_image": maintenanceImage == null ? null : maintenanceImage,
        "vehicle_id": vehicleId == null ? null : vehicleId,
        "workshop_name": workshopName == null ? null : workshopName,
        "maintenance_title": maintenanceTitle == null ? null : maintenanceTitle,
        "maintenance_date": maintenanceDate == null
            ? null
            : "${maintenanceDate?.year.toString().padLeft(4, '0')}-${maintenanceDate?.month.toString().padLeft(2, '0')}-${maintenanceDate?.day.toString().padLeft(2, '0')}",
        "maintenance_detail":
            maintenanceDetail == null ? null : maintenanceDetail,
        "maintenance_cost": maintenanceCost == null ? null : maintenanceCost,
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "id": id == null ? null : id,
      };
}
