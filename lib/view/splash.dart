import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:team_invite/controller/controller.dart';

import 'invite_list/invite_list_screen.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    Controller().getTeamAndInviteList().then((value) {
      log(value.toJson().toString());
      if(value.errorFlag=="SUCCESS"){
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>InviteListScreen(teamList: value,)));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Update Token at Api file")));
      }
    });

    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Welcome"),
      ),
    );
  }
}
