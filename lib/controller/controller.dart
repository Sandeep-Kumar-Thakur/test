import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:team_invite/api/api_urls.dart';
import 'package:team_invite/model/invite_model.dart';
import 'package:team_invite/model/team_list_model.dart';
class Controller{


  Future getTeamAndInviteList()async{
    var response = await http.get(Uri.parse(ApiUrls.friendsList),headers: {"authtoken":ApiUrls.token});
    log(response.body);
    TeamList teamList = TeamList.fromJson(jsonDecode(response.body));
    return teamList;
  }

  Future inviteTeam({required String email,required int role,context})async{
    var body ={
      "email": email,
      "role": role.toString()
    };
    log("body --- $body");
    var response = await http.post(Uri.parse(ApiUrls.inviteFriend),headers: {"authtoken":ApiUrls.token},body:body );
    log(response.body);
    InviteModel inviteModel = InviteModel();
    try {
      inviteModel = InviteModel.fromJson(jsonDecode(response.body));
    }catch(e){
      inviteModel.message="Please Update Token at Api file";
    }

    return inviteModel;
  }





}


isDarkMode(context){
  return Theme.of(context).brightness == Brightness.dark;
}