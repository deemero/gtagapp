// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.blue,
        backgroundColor: Colors.white,
      ),
    );
  }
}
