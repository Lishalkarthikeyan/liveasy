import 'package:flutter/material.dart';

class ProfileSelection extends StatefulWidget {
  const ProfileSelection({super.key});

  @override
  State<ProfileSelection> createState() => _ProfileSelectionState();
}

class _ProfileSelectionState extends State<ProfileSelection> {
  bool _isCheckedShipper = false;
  bool _isCheckedTransporter = false;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Container(
          color: Colors.white,
          height: screenHeight,
          width: screenWidth,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 112, left: 65, right: 65),
                child: Container(
                  height: 23.44,
                  width: 261,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Please select your profile",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Roboto",
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Shipper Container
              Container(
                height: 89,
                width: 328,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 24,
                      width: 24,
                      child: CustomCheckbox(
                        isChecked: _isCheckedShipper,
                        onChanged: (bool? value) {
                          setState(() {
                            _isCheckedShipper = value ?? false;
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      height: 40,
                      width: 40,
                      child:
                      Image.asset("assets/shipper.png", fit: BoxFit.cover),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 65),
                          alignment: Alignment.centerLeft,
                          height: 21,
                          width: 62,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              "Shipper",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 28,
                          width: 155,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              "Lorem ipsum dolor sit amet,\nconsectetur adipiscing",
                              style: TextStyle(
                                color: Color.fromRGBO(106, 108, 123, 1),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto",
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Transporter Container
              Container(
                height: 89,
                width: 328,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 24,
                      width: 24,
                      child: CustomCheckbox(
                        isChecked: _isCheckedTransporter,
                        onChanged: (bool? value) {
                          setState(() {
                            _isCheckedTransporter = value ?? false;
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      height: 25,
                      width: 40,
                      child: Image.asset("assets/transport.png",
                          fit: BoxFit.cover),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 40),
                          alignment: Alignment.centerLeft,
                          height: 21,
                          width: 94,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              "Transporter",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 28,
                          width: 155,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              "Lorem ipsum dolor sit amet,\nconsectetur adipiscing",
                              style: TextStyle(
                                color: Color.fromRGBO(106, 108, 123, 1),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto",
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 56,
                width: 328,
                color: Color.fromRGBO(46, 59, 98, 1),
                child: Container(
                  alignment: Alignment.center,
                  height: 20,
                  width: 46,
                  child: Text(
                    "CONTINUE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCheckbox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool?> onChanged;

  const CustomCheckbox({
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.5,
      child: Checkbox(
        shape: CircleBorder(),
        checkColor: Colors.white,
        hoverColor: Colors.black,
        activeColor: Colors.blue,
        value: isChecked,
        onChanged: onChanged,
      ),
    );
  }
}
