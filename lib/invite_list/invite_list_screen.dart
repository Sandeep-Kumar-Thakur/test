import 'package:flutter/material.dart';
import 'package:team_invite/constants/color_constants.dart';
import 'package:team_invite/constants/text_decoration.dart';
import 'package:team_invite/generated/assets.dart';
import 'package:team_invite/invite_list/invite_screen.dart';

class InviteListScreen extends StatelessWidget {
  const InviteListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(),
      floatingActionButton: _floatingButton(context),
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
                  Text("All people . 3",
                      style: TextDecoration.subHeaderWithGrey),
                  Text("See all", style: TextDecoration.subHeaderWithTheme),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
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
                        "KS",
                        style: TextDecoration.subHeader.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Krishna Soundhar",
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
                      "Admin",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Invited people . 1",
                      style: TextDecoration.subHeaderWithGrey),
                  Text("See all", style: TextDecoration.subHeaderWithTheme),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
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
                        "EJ",
                        style: TextDecoration.subHeader.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Emperor j",
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
                      "Admin",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _floatingButton(context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>InviteScreen()));
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
            ]
        ),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }

  _bottomNavigationBar(){
    return  BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 2,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: TextDecoration.bottomNavigationLabel,
      unselectedLabelStyle: TextDecoration.bottomNavigationLabel,
      selectedItemColor: ColorConstants.themeColor,
      unselectedItemColor: ColorConstants.greyColor,
      items: [
        BottomNavigationBarItem(icon: Image.asset(Assets.imagesHome,height: 24,),label: "Home"),
        BottomNavigationBarItem(icon: Image.asset(Assets.imagesLoans,height: 24,),label: "Loans"),
        BottomNavigationBarItem(icon: Image.asset(Assets.imagesContracts,height: 24,),label: "Contracts"),
        BottomNavigationBarItem(icon: Image.asset(Assets.imagesTeams,height: 24,),label: "Teams"),
        BottomNavigationBarItem(icon: Image.asset(Assets.imagesChat,height: 24,),label: "Chat"),
      ],
    );
  }
}
