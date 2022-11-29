import 'package:flutter/material.dart';
import 'package:team_invite/constants/color_constants.dart';
import 'package:team_invite/constants/text_decoration.dart';
import 'package:team_invite/generated/assets.dart';

class InviteScreen extends StatefulWidget {
  InviteScreen({Key? key}) : super(key: key);

  @override
  State<InviteScreen> createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController adminController = TextEditingController();

  List<String> _roles = [
    "Admin",
    "Approver",
    "Preparer",
    "Viewer",
    "Employee"
  ];

  _emailTextField() {
    return Container(
      height: 60,
      padding: EdgeInsets.only(
        top: 14,
      ),
      decoration: BoxDecoration(
          color: ColorConstants.textFieldBackground,
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: emailController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          filled: true,
          fillColor: ColorConstants.textFieldBackground,
          label: Text("Business email"),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.transparent)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.transparent)),
        ),
      ),
    );
  }

  @override
  void initState() {
    adminController.text = _roles[0];
    emailController.text = "thumb@marlo.online";
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _floatingButton(),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    splashFactory: NoSplash.splashFactory,
                    highlightColor: Colors.transparent,
                    child: Image.asset(
                      Assets.imagesBack,
                      height: 20,
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Invite",
                  style: TextDecoration.header,
                ),
                SizedBox(
                  height: 20,
                ),
                _emailTextField(),
                SizedBox(
                  height: 8,
                ),
                InkWell(
                  onTap: () {
                   _bottomSheet();
                  },
                  child: Container(
                    height: 60,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: ColorConstants.textFieldBackground,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          adminController.value.text,
                          style: TextDecoration.containerLabel,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: ColorConstants.themeColor,
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }

  _bottomSheet(){
    return    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24))
        ),
        context: context,
        builder: (context) => Container(
          padding: EdgeInsets.symmetric(horizontal: 14,vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 5,
                  width: 50,
                  decoration: BoxDecoration(
                      color: ColorConstants.themeColor.withOpacity(.5),
                      borderRadius: BorderRadius.circular(5)
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text("Team roles",style: TextDecoration.subHeader,),
              SizedBox(height: 10,),
              ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context,i)=>SizedBox(height: 10,),
                  itemCount: _roles.length,
                  itemBuilder: (context,i)=>InkWell(
                    onTap: (){
                      adminController.text = _roles[i];
                      Navigator.pop(context);
                      setState(() {

                      });
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color:adminController.value.text==_roles[i]?ColorConstants.lightTheme.withOpacity(.2): Colors.white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text(_roles[i],style: TextDecoration.subHeader.copyWith(color:adminController.value.text==_roles[i]?ColorConstants.themeColor: ColorConstants.greyColor),),
                    ),
                  )),
            ],
          ),
        ));
  }

  _floatingButton() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 15),
      height: 50,
      decoration: BoxDecoration(
          color: ColorConstants.themeColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: ColorConstants.themeColor.withOpacity(.3),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 3))
          ]),
      child: Text(
        "Continue",
        style: TextDecoration.containerLabel
            .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
      ),
    );
  }
}
