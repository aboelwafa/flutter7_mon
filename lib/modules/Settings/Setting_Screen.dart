// ignore_for_file: prefer_const_constructors, file_names, file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:market/shared/Components/constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [

          IconButton(onPressed: (){
            singOut(context);
    }, icon: Icon(Icons.logout_outlined))
        ],
      ),
    );
  }
}