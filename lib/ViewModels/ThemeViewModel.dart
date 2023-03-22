import 'package:flutter/material.dart';

class MyColor extends MaterialStateColor {
  final Color color;
  const MyColor({@required this.color}) : super(0);

  @override
  Color resolve(Set<MaterialState> states) {
    // if (states.contains(MaterialState.pressed)) {
    //   return color;
    // }
    return color;
  }
}

class ThemeViewModel {
  String img;
  String title;
  ThemeViewModel(this.img, this.title);
}

final ThemeData purpleTheme = ThemeData(
  primaryColor: Color(0xff662D91),
  accentColor: Color(0x66662D91),
  fontFamily: 'Lato',
);












// class MyTheme {
//   List<Color> solidColors = new List.filled(4, null);

//   List<LinearGradient> gradientColors = new List.filled(3, null);

//   Color fromStrHex(String strHexColor) {
//     strHexColor = strHexColor.replaceAll("#", "");
//     if (strHexColor.length == 6) {
//       strHexColor = "FF" + strHexColor;
//     }
//     if (strHexColor.length == 8) {
//       return Color(int.parse("0x$strHexColor"));
//     }
//     return null;
//   }

//   LinearGradient fromTowStrHex(String strHexColor1, String strHexColor2) {
//     Color l = fromStrHex(strHexColor1);
//     Color r = fromStrHex(strHexColor2);
//     return LinearGradient(
//       colors: [l, r],
//       begin: Alignment.centerLeft,
//       end: Alignment.centerRight,
//     );
//   }

//   MyTheme myFlagFall() {
//     MyTheme temp = MyTheme();
//     temp.solidColors[0] = fromStrHex('e8e8e8');
//     temp.solidColors[1] = fromStrHex('662d91');
//     temp.solidColors[2] = fromStrHex('666666');
//     temp.solidColors[3] = fromStrHex('ffffff');
//     temp.gradientColors[0] = fromTowStrHex('662d91', 'e3c0d3');
//     temp.gradientColors[1] = fromTowStrHex('63adf2', 'ecfee8');
//     temp.gradientColors[2] = fromTowStrHex('662d91', '63adf2');
//     return temp;
//   }

//   MyTheme myDefault() {
//     MyTheme temp = MyTheme();
//     temp.solidColors[0] = fromStrHex('f2f2f2');
//     temp.solidColors[1] = fromStrHex('8b2635');
//     temp.solidColors[2] = fromStrHex('bfbfbf');
//     temp.solidColors[3] = fromStrHex('ffffff');
//     temp.gradientColors[0] = fromTowStrHex('1a1a1a', '666666');
//     temp.gradientColors[1] = fromTowStrHex('1a1a1a', 'cccccc');
//     temp.gradientColors[2] = fromTowStrHex('1a1a1a', '8b2635');
//     return temp;
//   }

//   MyTheme myClassic() {
//     MyTheme temp = MyTheme();
//     temp.solidColors[0] = fromStrHex('ffffff');
//     temp.solidColors[1] = fromStrHex('432818');
//     temp.solidColors[2] = fromStrHex('666666');
//     temp.solidColors[3] = fromStrHex('ffffff');
//     temp.gradientColors[0] = fromTowStrHex('432818', 'bb9457');
//     temp.gradientColors[1] = fromTowStrHex('99582a', 'ffe6a7');
//     temp.gradientColors[2] = fromTowStrHex('ffe6a7', '6f1d1b');
//     return temp;
//   }
// }
