import 'package:flutter/material.dart';
import 'package:liveasy/view/mobilenumber.dart';

class FramePage extends StatefulWidget {
  const FramePage({super.key});

  @override
  State<FramePage> createState() => _FramePageState();
}

class _FramePageState extends State<FramePage> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
                    height: screenHeight,
                    width: screenWidth,
                    color: Colors.white,
                    child: Column(children: [
            Padding(
              padding: EdgeInsets.only(top: 128, left: 152, right: 152),
              child: Container(
                height: 56,
                width: 56,
                child: Image.asset("assets/emptyimg.png"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, left: 50, right: 50),
              child: Container(
                height: 23.44,
                width: 261,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "Please select your Language",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Roboto"),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 88, right: 88),
              child: Container(
                alignment: Alignment.center,
                height: 32,
                width: screenWidth,
                child: Column(
                  children: [
                    Text(
                      "You can change the language",
                      style: TextStyle(
                        color: Color.fromRGBO(106, 108, 123, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto",
                      ),
                    ),
                    Text(
                      "at any time.",
                      style: TextStyle(
                        color: Color.fromRGBO(106, 108, 123, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: 48,
              width: 216,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border:
                      Border.all(color: Color.fromARGB(47, 48, 55, 1), width: 1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "English",
                    style: TextStyle(
                        color: Color.fromRGBO(47, 48, 55, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Montserrat"),
                  ),
                  DropdownButton(
                    dropdownColor: Colors.white,
                    underline: SizedBox.shrink(),
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Color.fromARGB(156, 156, 156, 1),
                      weight: 12,
                    ),
                    onChanged: (value) => (),
                    items: const [
                      DropdownMenuItem(
                        value: Locale('en'),
                        child: Text('English'),
                      ),
                      DropdownMenuItem(
                        value: Locale('ta'),
                        child: Text('தமிழ்'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MobileNumber(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.only(),
                child: Container(
                  height: 48,
                  width: 216,
                  color: Color.fromRGBO(46, 59, 98, 1),
                  child: Container(
                    alignment: Alignment.center,
                    height: 20,
                    width: 46,
                    child: Text(
                      "NEXT",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Montserrat"),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Container(
              height: 102.66,
              width: screenWidth,
              child: Stack(
                children: [
                  Container(
                      height: 102.66,
                      width: screenWidth,
                      child: Image.asset(
                        "assets/img_1.png",
                        height: 102.66,
                      )),
                  Container(
                      height: 112.89,
                      width: screenWidth,
                      child: Image.asset(
                        "assets/img.png",
                        height: 112.89,
                      )),
                ],
              ),
            ),
                    ]),
                  ),
          )),
    );
  }
}
