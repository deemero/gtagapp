import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gtagapp/model/wreckage_model.get.dart';
import 'package:gtagapp/screen/main_menu.dart';
import 'package:http/http.dart' as http;

import '../service/api_wreckage.dart';

class WreckageView extends StatefulWidget {
  const WreckageView({Key? key}) : super(key: key);
  // const WreckageView({super.key});

  @override
  State<WreckageView> createState() => _WreckageViewState();
}

class _WreckageViewState extends State<WreckageView> {
  bool isLoading = false;
  List<Datum> listGetWreakage = [];

  Future<ResGetWreckage?> getWreakage() async {
    try {
      setState(() {
        isLoading = true;
      });
      http.Response res = await http.get(Uri.parse("$wreckageUrl"));
      List<Datum>? data = resGetWreckageFromJson(res.body).data;
      setState(() {
        isLoading = false;
        listGetWreakage = data ?? [];
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
    getWreakage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Report Document"),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: listGetWreakage.length,
            itemBuilder: (context, index) {
              Datum data = listGetWreakage[index];
              return Container(
                  color: Colors.white70,
                  child: Column(children: [
                    Text(data.id.toString()),
                    Text(data.actionNeeded),
                    Text(data.description),
                    Text(data.location),
                    Text(data.date.toString()),
                    Text(data.wreckageTitle),
                    Text(data.driverId.toString()),
                    Text(data.vehicleId.toString()),
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
