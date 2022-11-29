import 'package:flutter/material.dart';

import 'color_constants.dart';

class TextDecoration{

  static const header =  TextStyle(
      fontSize: 34,
      fontWeight: FontWeight.w700
  );
  static const subHeaderWithGrey =   TextStyle(
      color: ColorConstants.greyColor,
      fontSize: 16,
      fontWeight: FontWeight.w600
  );

  static const containerLabel =   TextStyle(
      color: ColorConstants.greyColor,
      fontSize: 14,
      fontWeight: FontWeight.w400
  );

  static const subHeader =   TextStyle(

      fontSize: 16,
      fontWeight: FontWeight.w600
  );
  static const subHeaderWithTheme =    TextStyle(
      color: ColorConstants.themeColor,
      fontSize: 16,
      fontWeight: FontWeight.w600
  );

  static const smallDescriptionGrey =    TextStyle(
      color: ColorConstants.greyColor,
      fontSize: 12,
      fontWeight: FontWeight.w400
  );
  static const bottomNavigationLabel =    TextStyle(
      color: ColorConstants.greyColor,
      fontSize: 10,
      fontWeight: FontWeight.w400
  );



}