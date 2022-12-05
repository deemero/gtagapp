import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gtagapp/screen/test.dart';
import 'package:gtagapp/view_data/maintenance_reportview_get.dart';
import 'package:gtagapp/view_data/report_wreckage_get.dart';
import 'package:http/http.dart' as http;
import '../model/maintenance_model_post.dart';
import 'package:quickalert/quickalert.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../screen/main_menu.dart';

class MaintainceReportPage extends StatefulWidget {
  const MaintainceReportPage({super.key});

  @override
  State<MaintainceReportPage> createState() => _MaintainceReportPageState();
}

Future<ResPostMaintenance?> submitData(
    String maintenanceImage,
    String vehicleId,
    String workshopName,
    String maintenanceTitle,
    String maintenanceDate,
    String maintenanceDetail,
    String maintenanceCost) async {
  var response = await http.post(
      Uri.parse("http://vehiclehackhaton.herokuapp.com/api/adddataMaintenance"),
      body: {
        "maintenance_image": maintenanceImage.toString(),
        "vehicle_id": vehicleId.toString(),
        "workshop_name": workshopName,
        "maintenance_title": maintenanceTitle,
        "maintenance_date": maintenanceDate.toString(),
        "maintenance_cost": maintenanceCost,
        "maintenance_detail": maintenanceDetail
      });
  var data = response.body;
  print(data);

  if (response.statusCode == 200) {
    String responseString = response.body;
    resPostMaintenanceFromJson(responseString);
  } else {
    return null;
  }
}

class _MaintainceReportPageState extends State<MaintainceReportPage> {
  // void showAlert() {
  //   QuickAlert.show(
  //       context: context,
  //       title: "Sent Data Successfully",
  //       text: "The data have been sent, see your data",
  //       type: QuickAlertType.success);
  // }
  // final items = ["1", "2", "3", "4", "5"];

  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  final RoundedLoadingButtonController _btnViewData =
      RoundedLoadingButtonController();
  late ResPostMaintenance _resPostMaintenance;
  final formKey = GlobalKey<FormState>();

  // String? value;

  void _doSomething() async {
    Timer(Duration(seconds: 7), () {
      _btnController.success();
    });
  }

  void validate() {
    if (formKey.currentState!.validate()) {
      print("valid");
    } else {
      print("not valid");
    }
  }

  TextEditingController vehicleIdController = TextEditingController();
  TextEditingController maintenanceImageController = TextEditingController();
  TextEditingController workshopNameController = TextEditingController();
  TextEditingController maintenanceDetailController = TextEditingController();
  TextEditingController maintenanceCostController = TextEditingController();
  TextEditingController maintenanceDateController = TextEditingController();
  TextEditingController maintenanceTitleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    maintenanceImageController =
        new TextEditingController(text: 'Images Predefine');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Maintaince Report")),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Column(children: [
                TextFormField(
                  controller: vehicleIdController,
                  decoration: InputDecoration(
                      errorStyle: TextStyle(color: Colors.teal),
                      border: OutlineInputBorder(),
                      hintText: "Enter Vehicle Id  [Number]"),
                  style: TextStyle(fontSize: 25),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some Number ( example = Enter Vehicle Id:  1)';
                    }
                    return "Reminder: Make sure you put a Number not a Alphabet";
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: maintenanceTitleController,
                  decoration: InputDecoration(
                      errorStyle: TextStyle(color: Colors.teal),
                      border: OutlineInputBorder(),
                      hintText: "Enter Maintenance Title"),
                  style: TextStyle(fontSize: 25),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some Title ( example =  Tayar bocor)';
                    }
                    return "Reminder: Make sure you put a Alphabet not a Number";
                  },
                ),
                SizedBox(height: 10),
                // TextFormField(
                //   controller: maintenanceImageController,
                //   decoration: InputDecoration(
                //       errorStyle: TextStyle(color: Colors.teal),
                //       border: OutlineInputBorder(),
                //       hintText: "Enter Maintenance Image [Image.Number]"),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please enter some Image ( example = 2222.png)';
                //     }
                //     return "Reminder: Make sure you put image type (Example : 123123.png)";
                //   },
                // ),
                SizedBox(height: 10),
                TextFormField(
                  controller: maintenanceDetailController,
                  decoration: InputDecoration(
                      errorStyle: TextStyle(color: Colors.teal),
                      border: OutlineInputBorder(),
                      hintText: "Enter Maintenance Detail"),
                  style: TextStyle(fontSize: 25),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some Detail ( example =  Perlu Tayar baru)';
                    }
                    return "Reminder: Make sure you put a Alphabet not a Number";
                  },
                ),
                SizedBox(height: 10),

                TextFormField(
                  controller: maintenanceCostController,
                  decoration: InputDecoration(
                      errorStyle: TextStyle(color: Colors.teal),
                      border: OutlineInputBorder(),
                      hintText: "Enter Maintenance Cost [Number]"),
                  style: TextStyle(fontSize: 20),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some Cost ( example =  2000)';
                    }
                    return "Reminder: Make sure you put a Number not a Alphabet";
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: workshopNameController,
                  decoration: InputDecoration(
                      errorStyle: TextStyle(color: Colors.teal),
                      border: OutlineInputBorder(),
                      hintText: "Enter Workshop Name"),
                  style: TextStyle(fontSize: 25),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some Workshop Name( example = Ali Pomen)';
                    }
                    return "Reminder: Make sure you put a Alphabet not a Number";
                  },
                ),
                SizedBox(height: 13),
                TextFormField(
                  controller: maintenanceDateController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.date_range),
                      errorStyle: TextStyle(color: Colors.teal),
                      border: OutlineInputBorder(),
                      hintText: " Select Date"),
                  style: TextStyle(fontSize: 25),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Select a Date';
                    }
                    return "Reminder : Recheck your date";
                  },
                  readOnly: true,
                  onTap: () async {
                    final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2100));

                    setState(() {
                      if (date != null) {
                        maintenanceDateController.text =
                            "${date.year}  ${date.month} ${date.day}";
                      }
                    });
                  },
                ),
                SizedBox(height: 22),
                RoundedLoadingButton(
                  borderRadius: BorderSide.strokeAlignCenter,
                  controller: _btnController,
                  child:
                      Text('Sent Data', style: TextStyle(color: Colors.white)),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {}
                    _doSomething();

                    String vehicleId = vehicleIdController.text;
                    String maintenanceDetail = maintenanceDetailController.text;
                    String maintenanceTitle = maintenanceTitleController.text;
                    String workshopName = workshopNameController.text;
                    String maintenanceImage = maintenanceImageController.text;
                    String maintenanceCost = maintenanceCostController.text;
                    String maintenanceDate = maintenanceDateController.text;

                    ResPostMaintenance? data = await submitData(
                        maintenanceImage,
                        vehicleId,
                        workshopName,
                        maintenanceTitle,
                        maintenanceDate,
                        maintenanceDetail,
                        maintenanceCost);

                    setState(() {
                      _resPostMaintenance = data!;
                    });
                  },
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    minWidth: 300,
                    height: 50,
                    child: Text(
                      'View Data',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      // _doviewSomething();

                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => MaintenanceView()));
                    },
                    elevation: 4.0,
                    color: Colors.green,
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

// DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
//       value: item,
//       child: Text(item, style: const TextStyle(fontWeight: FontWeight.bold)),
//     );
  



//Elevate button for change rounded button if needed // 

   // ElevatedButton(
              //     onPressed: () async {
              //       String vehicleId = vehicleIdController.text;
              //       String maintenanceDetail = maintenanceDetailController.text;
              //       String maintenanceTitle = maintenanceTitleController.text;
              //       String workshopName = workshopNameController.text;
              //       String maintenanceImage = maintenanceImageController.text;
              //       String maintenanceCost = maintenanceCostController.text;
              //       String maintenanceDate = maintenanceDateController.text;

              //       ResPostMaintenance? data = await submitData(
              //           maintenanceImage,
              //           vehicleId,
              //           workshopName,
              //           maintenanceTitle,
              //           maintenanceDate,
              //           maintenanceDetail,
              //           maintenanceCost);

              //       setState(() {
              //         _resPostMaintenance = data!;
              //       });
              //     },
              //     child: Text("Submit Report")),
