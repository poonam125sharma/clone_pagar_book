import 'package:flutter/material.dart';
// import 'package:flutter_otp/flutter_otp.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:pagar_book/models/employer.dart';

class GetPhoneNumber extends StatefulWidget {
  @override
  _GetPhoneNumberState createState() => _GetPhoneNumberState();
}

class _GetPhoneNumberState extends State<GetPhoneNumber> {

  TextEditingController _textCntlr;
  // FlutterOtp otp;
  Map rtValObj = {
    'status': false,
    'message': ''
  };

  Map validateMobileWithRegEx(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,10}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
        rtValObj['status'] = false;
        rtValObj['message'] = 'Mobile number is required';
        return rtValObj;
    }
    else if (!regExp.hasMatch(value)) {
        rtValObj['status'] = false;
        rtValObj['message'] = 'Please enter valid mobile number';
        return rtValObj;
    }
    rtValObj['status'] = true;
    rtValObj['message'] = '';
    return rtValObj;
  }

  void saveMobileNumber() async {
    // Save this mobile in the SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    final key = 'user_mobile';
    final value = _textCntlr.text;
    prefs.setString(key,value);
    Navigator.pushNamed(context, '/get-profile-business');
  }

  @override
  void initState() {
    super.initState();
    _textCntlr = TextEditingController();
    // otp = FlutterOtp();
    // otp.sendOtp('9716839998');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: RaisedButton.icon(
                  icon: Icon(Icons.language,color: Colors.black,),
                  label: Text('Change Language', style: TextStyle(color: Colors.black),),
                  padding: EdgeInsets.all(8),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  elevation: 2,
                ),
              ),
              Text('Account Login',style: TextStyle(fontWeight: FontWeight.bold,fontSize:20),),
              SizedBox(height: 5,),
              Text('Please enter a valid mobile number to access your Pagar Book account',style: TextStyle(
                  color: Colors.grey[600],
                  height: 1.4,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 30,),
              Text('Mobile Number'.toUpperCase(),style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
                      children: [
                        WidgetSpan(child: Icon(Icons.phone_android)),
                        TextSpan(text:'+91',)                                              
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      autofocus: true,
                      controller: _textCntlr,
                      onChanged: (value) {
                        setState(() {
                          validateMobileWithRegEx(value);
                        });
                      },
                      decoration: InputDecoration(
                        helperText: 'Enter your 10 digit mobile number',
                        labelStyle: TextStyle(color:Colors.grey[600]),
                        errorText: rtValObj['message'],
                        counterText: '',
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                    padding: EdgeInsets.all(16),
                    disabledColor: Color(0xFF7fb1fe),                  
                    onPressed: (rtValObj['status'] == true) ? saveMobileNumber : null,
                    color: Color(0xFF0065fd),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Continue',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,letterSpacing: 1.5),),
                        Icon(Icons.trending_flat,color: Colors.white,),
                      ],
                    ),
                    elevation: 3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textCntlr.dispose();
    super.dispose();
  }
}