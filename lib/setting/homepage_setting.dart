import 'package:flutter/material.dart';

Widget myDetailsContainer1() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
            child: Text(
          "Report Wreakage",
          style: TextStyle(
              color: Color(0xffe6020a),
              fontSize: 24.0,
              fontWeight: FontWeight.bold),
        )),
      ),
      Container(
          child: Text(
        "Maintaince Report for your car",
        style: TextStyle(
            color: Colors.black54, fontSize: 18.0, fontWeight: FontWeight.bold),
      )),
    ],
  );
}

Widget myDetailsContainer2() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
            child: Text(
          "Gas fill",
          style: TextStyle(
              color: Color(0xffe6020a),
              fontSize: 24.0,
              fontWeight: FontWeight.bold),
        )),
      ),
      Container(
          child: Text(
        "Maintaince Report for your car",
        style: TextStyle(
            color: Colors.black54, fontSize: 18.0, fontWeight: FontWeight.bold),
      )),
    ],
  );
}

Widget myDetailsContainer3() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
            child: Text(
          "Maintenance Report",
          style: TextStyle(
              color: Color(0xffe6020a),
              fontSize: 24.0,
              fontWeight: FontWeight.bold),
        )),
      ),
      Container(
          child: Text(
        "Maintaince Report for your car",
        style: TextStyle(
            color: Colors.black54, fontSize: 18.0, fontWeight: FontWeight.bold),
      )),
    ],
  );
}

Widget myDetailsContainer4() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
            child: Text(
          "Driving LogBook",
          style: TextStyle(
              color: Color(0xffe6020a),
              fontSize: 24.0,
              fontWeight: FontWeight.bold),
        )),
      ),
      Container(
          child: Text(
        "Maintaince Report for your car",
        style: TextStyle(
            color: Colors.black54, fontSize: 18.0, fontWeight: FontWeight.bold),
      )),
    ],
  );
}
