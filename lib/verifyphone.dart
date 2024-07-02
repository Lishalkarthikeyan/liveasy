import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:liveasy/profileselection.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'dart:async';

class VerifyOtp extends StatefulWidget {
  final String phoneNumber;

  VerifyOtp({required this.phoneNumber});

  @override
  _VerifyOtpState createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  static const String countryCode = '+91';

  OtpFieldController otpController = OtpFieldController();
  String code = "";

  FirebaseAuth _auth = FirebaseAuth.instance;
  late String _verificationId;
  bool _isLoading = false;
  bool _canResendOTP = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _verifyPhoneNumber();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        setState(() {
          _canResendOTP = true;
          timer.cancel();
        });
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,),
      body: Container(
        color: Colors.white,
        height: screenHeight,
        width: screenWidth,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 112, left: 122, right: 122),
              child: Container(
                height: 23,
                width: 117,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "Verify Phone",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Roboto"),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),

            Padding(
              padding: EdgeInsets.only(left: 88, right: 88),
              child: Container(
                alignment: Alignment.center,
                height: 16,
                width: 177,
                child:
                    Text(
                      "Code is sent to ${widget.phoneNumber}",
                      style: TextStyle(
                        color: Color.fromRGBO(106, 108, 123, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto",
                      ),
                    ),
              ),
            ),
            SizedBox(height: 20),
            OTPTextField(
              controller: otpController,
              length: 6,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 48,
              style: TextStyle(fontSize: 17),
              textFieldAlignment: MainAxisAlignment.spaceEvenly,
              fieldStyle: FieldStyle.box,
              onChanged: (value) {
                setState(() {
                  code = value;
                });
              },
              otpFieldStyle: OtpFieldStyle(
                backgroundColor: Color.fromARGB(255, 129, 218, 245),
                focusBorderColor: Color.fromARGB(255, 129, 218, 245),
                enabledBorderColor: Color.fromARGB(255, 129, 218, 245),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.only(left: 50,right: 50),
              child: Container(
                alignment: Alignment.center,
                height: 16,
                width: screenWidth,
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn’t receive the code?",
                      style: TextStyle(
                        color: Color.fromRGBO(106, 108, 123, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto",
                      ),
                    ),
                    SizedBox(width: 5,),
                    InkWell(
                      onTap: _canResendOTP ? _resendOTP : null,
                      child: Text('Request Again',style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Roboto",
                        ),),
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),

            InkWell(
              onTap: (){
                _isLoading ? null : _signInWithPhoneNumber;

              },
              child: Padding(
                padding: EdgeInsets.only(),
                child: Container(
                  height: 56,
                  width: 328,
                  color: Color.fromRGBO(46, 59, 98, 1),
                  child:_isLoading ? Center(child: CircularProgressIndicator(color: Colors.white,)) : Container(
                    alignment: Alignment.center,
                    height: 20,
                    width: 46,
                    child: Text(
                      "VERIFY AND CONTINUE",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Montserrat"),
                    ),
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }

  void _verifyPhoneNumber() async {
    setState(() {
      _isLoading = true;
    });

    await _auth.verifyPhoneNumber(
      phoneNumber: '$countryCode${widget.phoneNumber}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        _showMessage('Phone number automatically verified and user signed in.');
      },
      verificationFailed: (FirebaseAuthException e) {
        setState(() {
          _isLoading = false;
        });

        if (e.code == 'invalid-phone-number') {
          _showMessage('The provided phone number is not valid.');
        } else {
          _showMessage('Error: ${e.message}');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _verificationId = verificationId;
          _isLoading = false;
          startTimer();
        });

        _showMessage('Verification code sent to the phone number.');
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          _verificationId = verificationId;
        });
      },
    );
  }

  void _signInWithPhoneNumber() async {
    if (code.isEmpty) {
      _showMessage('Please enter the OTP.');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: code,
    );

    try {
      await _auth.signInWithCredential(credential);
      _showMessage('Successfully signed in.');
      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileSelection(),));
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      _showMessage('Failed to sign in: $e');
    }
  }

  void _resendOTP() {
    _verifyPhoneNumber();
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
