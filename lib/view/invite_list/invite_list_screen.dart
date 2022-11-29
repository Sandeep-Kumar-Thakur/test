import 'package:flutter/material.dart';
import 'package:team_invite/constants/color_constants.dart';
import 'package:team_invite/constants/text_decoration.dart';
import 'package:team_invite/generated/assets.dart';

import '../../controller/controller.dart';
import '../../model/team_list_model.dart';
import 'invite_screen.dart';


class InviteListScreen extends StatefulWidget {
  TeamList teamList;

  InviteListScreen({Key? key, required this.teamList}) : super(key: key);

  @override
  State<InviteListScreen> createState() => _InviteListScreenState();
}

class _InviteListScreenState extends State<InviteListScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(),
      floatingActionButton: _floatingButton(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Teams", style: TextDecoration.header),
                  Image.asset(
                    Assets.imagesSearch,
                    height: 20,
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("All people . ${widget.teamList.data!.contacts!.length}",
                      style: TextDecoration.subHeaderWithGrey),
                  Text("See all", style: TextDecoration.subHeaderWithTheme),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) => _contactContainer(i),
                  separatorBuilder: (context, i) => SizedBox(
                        height: 10,
                      ),
                  itemCount: widget.teamList.data!.contacts!.length < 2
                      ? widget.teamList.data!.contacts!.length
                      : 2),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Invited people . ${widget.teamList.data!.invites!.length}",
                      style: TextDecoration.subHeaderWithGrey),
                  Text("See all", style: TextDecoration.subHeaderWithTheme),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ListView.separated(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) => _inviteContainer(i),
                  separatorBuilder: (context, i) => SizedBox(
                        height: 10,
                      ),
                  itemCount: widget.teamList.data!.invites!.length < 2
                      ? widget.teamList.data!.invites!.length
                      : 2)
            ],
          ),
        ),
      ),
    );
  }

  _contactContainer(i){
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color:isDarkMode(context)?ColorConstants.darkBottomTheme: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorConstants.blueColor),
            child: Text(
              "${widget.teamList.data!.contacts![i].firstname![0].toUpperCase()}${widget.teamList.data!.contacts![i].lastname![0].toUpperCase()}",
              style: TextDecoration.subHeader.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            width: 7,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.teamList.data!.contacts![i].firstname} ${widget.teamList.data!.contacts![i].lastname}",
                style: TextDecoration.subHeader,
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                widget.teamList.data!.contacts![i].isactive == true
                    ? "Active"
                    : "Inactive",
                style: TextDecoration.smallDescriptionGrey,
              ),
            ],
          ),
          Spacer(),
          Text(
            "${widget.teamList.data!.contacts![i].roleName}",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  _inviteContainer(int i){
    return InkWell(
      onTap: (){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => InviteScreen(
          inviteEmail: widget.teamList.data!.invites![i].email!,
          role: widget.teamList.data!.invites![i].configName!,
        )));
      },
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color:isDarkMode(context)?ColorConstants.darkBottomTheme: Colors.white,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorConstants.brownColor),
              child: Text(
                " ${widget.teamList.data!.invites![i].email![0].toUpperCase()} ",
                style: TextDecoration.subHeader.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              width: 7,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.teamList.data!.invites![i].email}",
                  style: TextDecoration.subHeader,
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "Active",
                  style: TextDecoration.smallDescriptionGrey,
                ),
              ],
            ),
            Spacer(),
            Text(
              "${widget.teamList.data!.invites![i].configName}",
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  _floatingButton() {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: ColorConstants.themeColor,
            boxShadow: [
              BoxShadow(
                  color: ColorConstants.themeColor.withOpacity(.3),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 3))
            ]),
        child: Icon(
          Icons.add,
          color:isDarkMode(context)?Colors.black: Colors.white,
          size: 24,
        ),
      ),
    );
  }

  _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 2,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: TextDecoration.bottomNavigationLabel,
      unselectedLabelStyle: TextDecoration.bottomNavigationLabel,
      selectedItemColor: ColorConstants.themeColor,
      unselectedItemColor: ColorConstants.greyColor,
      items: [
        BottomNavigationBarItem(
            icon: Image.asset(
              Assets.imagesHome,
              height: 24,
            ),
            label: "Home"),
        BottomNavigationBarItem(
            icon: Image.asset(
              Assets.imagesLoans,
              height: 24,
            ),
            label: "Loans"),
        BottomNavigationBarItem(
            icon: Image.asset(
              Assets.imagesContracts,
              height: 24,
            ),
            label: "Contracts"),
        BottomNavigationBarItem(
            icon: Image.asset(
              Assets.imagesTeams,
              height: 24,
            ),
            label: "Teams"),
        BottomNavigationBarItem(
            icon: Image.asset(
              Assets.imagesChat,
              height: 24,
            ),
            label: "Chat"),
      ],
    );
  }
}
