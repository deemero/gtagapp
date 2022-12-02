import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gtagapp/screen/main_menu.dart';
import 'package:http/http.dart' as http;

import '../model/maintenance_model_get.dart';
import '../service/api_maintenance_get.dart';

class MaintenanceView extends StatefulWidget {
  const MaintenanceView({super.key});

  @override
  State<MaintenanceView> createState() => _MaintenanceViewState();
}

class _MaintenanceViewState extends State<MaintenanceView> {
  bool isLoading = false;
  List<Datum> listGetMaintenance = [];

  Future<ResGetMaintenance?> getMaintenance() async {
    try {
      setState(() {
        isLoading = true;
      });
      http.Response res = await http.get(Uri.parse("$maintenanceUrl"));
      List<Datum>? data = resGetMaintenanceFromJson(res.body).data;
      setState(() {
        isLoading = false;
        listGetMaintenance = data ?? [];
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getMaintenance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Report Document"),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: listGetMaintenance.length,
            itemBuilder: (context, index) {
              Datum data = listGetMaintenance[index];
              return Container(
                  color: Colors.white70,
                  child: Column(children: [
                    Text(data.id.toString()),
                    Text(data.vehicleId.toString()),
                    Text(data.workshopName),
                    Text(data.maintenanceCost),
                    Text(data.maintenanceDate.toString()),
                    Text(data.maintenanceDetail),
                    Text(data.maintenanceTitle),
                    Text(data.maintenanceImage.toString()),
                    SizedBox(height: 20),
                    Container(
                        height: 55.0,
                        child: MaterialButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => MainMenuPage())),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0)),
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 95, 95, 218),
                                      Color.fromARGB(255, 41, 146, 238)
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Container(
                                constraints: BoxConstraints(
                                    maxWidth: 100.0, minHeight: 1.0),
                                alignment: Alignment.center,
                                child: Text(
                                  "Back",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ))),
                  ]));
            }),
      ),
    );
  }
}
