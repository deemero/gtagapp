import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TestPage extends StatefulWidget {
  const TestPage(
      {super.key,
      required String vehicleId,
      required String maintenanceImage,
      required String workshopName,
      required String maintenanceCost,
      required String maintenanceDetail,
      required String maintenanceDate,
      required String maintenanceTitle});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test Page")),
    );
  }
}
