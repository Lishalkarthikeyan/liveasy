import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:liveasy/view/verifyphone.dart';


class MobileNumber extends StatefulWidget {
  const MobileNumber({super.key});

  @override
  State<MobileNumber> createState() => _MobileNumberState();
}

class _MobileNumberState extends State<MobileNumber> {
  final _phoneController = TextEditingController();

  void clear() {
    _phoneController.clear();
  }

  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        body: Container(
          height: screenHeight,
          width: screenWidth,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 112, left: 50, right: 50),
                child: Container(
                  height: 23.44,
                  width: 261,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Please enter your mobile number",
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
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "You’ll receive a 4 digit code",
                            style: TextStyle(
                              color: Color.fromRGBO(106, 108, 123, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Roboto",
                            ),
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "to verify next",
                            style: TextStyle(
                              color: Color.fromRGBO(106, 108, 123, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Roboto",
                            ),
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
                height: 56,
                width: 328,
                child: TextField(
                  cursorColor: Colors.pink,
                  decoration: InputDecoration(
                    prefixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          height: 24, // Adjusted height
                          width: 24, // Adjusted width
                          child:
                              Image.asset("assets/flag.png", fit: BoxFit.cover),
                        ),
                        SizedBox(width: 10),
                        // Add some space between the icon and text
                        Text(
                          "+91   -",
                          style: TextStyle(
                            color: Color.fromRGBO(47, 48, 55, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Montserrat",
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        )
                      ],
                    ),
                    labelText: "Mobile Number",
                    labelStyle: TextStyle(
                      color: Color.fromRGBO(106, 108, 123, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Montserrat",
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(0)), // Adjusted to circular radius
                    ),
                  ),
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  final phoneNumber = _phoneController.text.trim();
                  if (phoneNumber.isNotEmpty) {
                    clear();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerifyOtp(phoneNumber: phoneNumber),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(backgroundColor: Colors.green,
                          content: Text('Please enter a valid phone number.')),
                    );
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(),
                  child: Container(
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
                            fontFamily: "Montserrat"),
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 160,
                  width: screenWidth,
                  child: Stack(
                    children: [
                      Container(
                          height: 200,
                          width: screenWidth,
                          child: Image.asset(
                            "assets/mobi1.png",
                            height: 200,
                          )),
                      Container(
                          height: 200,
                          width: screenWidth,
                          child: Image.asset(
                            "assets/mobi2.png",
                            height: 200,
                          )),
                    ],
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
