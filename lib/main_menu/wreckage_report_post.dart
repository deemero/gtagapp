import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gtagapp/screen/main_menu.dart';
import 'package:gtagapp/view_data/report_wreckage_get.dart';
import 'package:http/http.dart' as http;
import '../model/wreckage_model.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../view_data/maintenance_reportview_get.dart';

class ReportWreckagePage extends StatefulWidget {
  const ReportWreckagePage({super.key});

  @override
  State<ReportWreckagePage> createState() => _ReportWreckagePageState();
}

Future<ResPostWreckage?> submitData(
    String vehicle_id,
    String driver_id,
    String location,
    String date,
    String wreckage_image,
    String wreckage_title,
    String description,
    String action_needed) async {
  var response = await http.post(
      Uri.parse("http://vehiclehackhaton.herokuapp.com/api/adddataWreckage"),
      body: {
        "vehicle_id": vehicle_id.toString(),
        "driver_id": driver_id.toString(),
        "location": location.toString(),
        "date": date.toString(),
        "wreckage_image": wreckage_image,
        'wreckage_title': wreckage_title,
        'description': description,
        "action_needed": action_needed,
      });
  var data = response.body;
  print(data);

  if (response.statusCode == 200) {
    String responseString = response.body;
    resPostWreckageFromJson(responseString);
  } else {
    return null;
  }
}

class _ReportWreckagePageState extends State<ReportWreckagePage> {
  late ResPostWreckage _resPostWreckage;

  final formKey = GlobalKey<FormState>();

  void validate() {
    if (formKey.currentState!.validate()) {
      print("valid");
    } else {
      print("not valid");
    }
  }

  TextEditingController vehicleidController = TextEditingController();
  TextEditingController driveridController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController textDateController = TextEditingController();
  TextEditingController wreckageimageController = TextEditingController();
  TextEditingController wreckagetitleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController actionneededController = TextEditingController();
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  void _doSomething() async {
    Timer(const Duration(seconds: 7), () {
      _btnController.success();
    });
  }

  @override
  void initState() {
    super.initState();
    wreckageimageController =
        new TextEditingController(text: 'Images Predefine');
    // wreckageimageController = new TextEditingController(text: "er");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Report Wreakage")),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Column(children: [
                TextFormField(
                  controller: vehicleidController,
                  decoration: InputDecoration(
                      errorStyle: TextStyle(color: Colors.teal),
                      border: OutlineInputBorder(),
                      hintText: "Enter Vehicle Id"),
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
                  controller: driveridController,
                  decoration: InputDecoration(
                      errorStyle: TextStyle(color: Colors.teal),
                      border: OutlineInputBorder(),
                      hintText: "Enter Driver Id "),
                  style: TextStyle(fontSize: 25),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some Driver Id ( example = 1)';
                    }
                    return "Reminder: Make sure you put a Number not a Alphabet";
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: locationController,
                  decoration: InputDecoration(
                      errorStyle: TextStyle(color: Colors.teal),
                      border: OutlineInputBorder(),
                      hintText: "Enter location "),
                  style: TextStyle(fontSize: 25),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some Maintenance Cost  ( example = 2000)';
                    }
                    return "Reminder: Make sure you put a Number not a Alphabet";
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                      errorStyle: TextStyle(color: Colors.teal),
                      border: OutlineInputBorder(),
                      hintText: "Enter Description "),
                  style: TextStyle(fontSize: 25),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some Title ( example = tayar rosak)';
                    }
                    return "Reminder: Make sure you put a Number not a Alphabet";
                  },
                ),
                // SizedBox(height: 10),
                // TextFormField(
                //   controller: wreckagetitleController,
                //   decoration: InputDecoration(
                //       errorStyle: TextStyle(color: Colors.teal),
                //       border: OutlineInputBorder(),
                //       hintText: "Enter Wreckage  image"),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please enter some image num ( exp : 2222.png)';
                //     }
                //     return "Reminder: recheck your form";
                //   },
                // ),
                SizedBox(height: 10),
                TextFormField(
                  controller: wreckagetitleController,
                  decoration: InputDecoration(
                      errorStyle: TextStyle(color: Colors.teal),
                      border: OutlineInputBorder(),
                      hintText: "Enter Title"),
                  style: TextStyle(fontSize: 25),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some action Needed ( example = tukar plat)';
                    }
                    return "Reminder: Make sure you put an Alphabet not Number";
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: actionneededController,
                  decoration: InputDecoration(
                      errorStyle: TextStyle(color: Colors.teal),
                      border: OutlineInputBorder(),
                      hintText: "Enter Action Needed  "),
                  style: TextStyle(fontSize: 25),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some Description';
                    }
                    return "Reminder: Make sure you put a Alphabet not a Number";
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: textDateController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.date_range),
                      errorStyle: TextStyle(color: Colors.teal),
                      border: OutlineInputBorder(),
                      hintText: " Select Date"),
                  style: TextStyle(fontSize: 25),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter date';
                    }
                    return "Reminder: please rechek your form";
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
                        textDateController.text =
                            "${date.year} ${date.month}  ${date.day}";
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

                    String vehicle_id = vehicleidController.text;
                    String driver_id = driveridController.text;
                    String location = locationController.text;
                    String date = textDateController.text;
                    String wreckage_image = wreckageimageController.text;
                    String wreckage_title = wreckagetitleController.text;
                    String description = descriptionController.text;
                    String action_needed = actionneededController.text;

                    ResPostWreckage? data = await submitData(
                      vehicle_id,
                      driver_id,
                      location,
                      date,
                      wreckage_image,
                      wreckage_title,
                      description,
                      action_needed,
                    );

                    setState(() {
                      _resPostWreckage = data!;
                    });
                  },
                ),
                SizedBox(height: 20),
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
                          MaterialPageRoute(builder: (_) => WreckageView()));
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


//Elevate button for change rounded button if needed // 

        // ElevatedButton(
              // onPressed: () async {
              //   String vehicle_id = vehicleidController.text;
              //   String driver_id = driveridController.text;
              //   String location = locationController.text;
              //   String description = descriptionController.text;
              //   String wreckage_title = wreckageimageController.text;
              //   String wreckage_image = wreckageimageController.text;
              //   String action_needed = actionneededController.text;
              //   String date = textDateController.text;

              //   ResPostWreakage? data = await submitData(
              //     vehicle_id,
              //     date,
              //     location,
              //     description,
              //     wreckage_title,
              //     wreckage_image,
              //     action_needed,
              //     driver_id,
              //   );

              //   setState(() {
              //     _resPostWreakage = data!;
              //   });
              // },
              // child: Text("Submit Report")),

// 