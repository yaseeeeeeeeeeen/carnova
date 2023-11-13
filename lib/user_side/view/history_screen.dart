import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second_project/user_side/utils/appbar.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBarU(context), body: Container(color: Colors.blueAccent));
  }
}
