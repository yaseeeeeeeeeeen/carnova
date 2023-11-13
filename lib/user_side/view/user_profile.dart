import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second_project/user_side/utils/appbar.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarU(context),
      body: Container(color: Colors.black87));
  }
}
