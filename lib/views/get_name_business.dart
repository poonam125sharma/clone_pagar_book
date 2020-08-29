import 'package:flutter/material.dart';
import 'package:pagar_book/models/employer.dart';
import 'package:pagar_book/models/business-dtls.dart';
import 'package:intl/intl.dart';

class GetProfileBusiness extends StatefulWidget {
  @override
  _GetProfileBusinessState createState() => _GetProfileBusinessState();
}

class _GetProfileBusinessState extends State<GetProfileBusiness> {

  TextEditingController _nameCntlr;
  TextEditingController _businessNameCntlr;
  bool _continueBtnEnabled = false;
  bool _isNameValid = true;
  bool _isBusinessNameValid = true;

  handleContinueBtn() async {
    if(!_continueBtnEnabled) return false;
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formattedDate = formatter.format(now);


    Employer employer = Employer(
      name: _nameCntlr.text,
      rDate: formattedDate,
      uDate: formattedDate,
    );
    int empId = await employer.insertEmployer(employer);
    print('Employer Id is $empId');
    if(empId > 0) {
      BusinessDetails bsnsdtls = BusinessDetails(
        employerId: empId,
        businessName: _businessNameCntlr.text,
        rDate: formattedDate,
        uDate: formattedDate,
      );
      int bsnsId = await bsnsdtls.insertBusinessDetails(bsnsdtls);
      print('Business Id is $bsnsId');
      Navigator.pushNamed(context, '/bsns-mnth-hrs-ques');
    }
  }

  @override
  void initState() {
    super.initState();
    _nameCntlr = TextEditingController();
    _businessNameCntlr = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.grey[500],
        ),
      ), 
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('Business Details',style: TextStyle(fontWeight: FontWeight.bold,fontSize:20,),),
              SizedBox(height: 5,),
              Text('Please provide details as asked below for unique account creation',style: TextStyle(
                  color: Colors.grey[600],
                  height: 1.4,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 30,),              
              TextField(
                keyboardType: TextInputType.text,
                maxLength: 50,
                controller: _nameCntlr,
                onChanged: (value) {
                  setState(() {
                    if(value.isNotEmpty) {
                      _isNameValid = true;
                      _continueBtnEnabled = (_businessNameCntlr.text.isNotEmpty) ? true : false;
                    }else{
                      _isNameValid = false;
                      _continueBtnEnabled = false;
                    }
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Your Name',
                  hintStyle: TextStyle(color:Colors.grey[600],fontWeight:FontWeight.w500,fontSize:20),
                  errorText: _isNameValid ? null : 'Enter name',
                  counterText: '',
                ),
              ),
              SizedBox(height: 30),
              TextField(
                keyboardType: TextInputType.text,
                maxLength: 50,
                controller: _businessNameCntlr,
                onChanged: (value) {
                  setState(() {
                    if(value.isNotEmpty) {
                      _isBusinessNameValid = true;
                      _continueBtnEnabled = (_nameCntlr.text.isNotEmpty) ? true : false;
                    }else{
                      _isBusinessNameValid = false;
                      _continueBtnEnabled = false;
                    }
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Business Name',
                  hintStyle: TextStyle(color:Colors.grey[600],fontWeight:FontWeight.w500,fontSize:20),
                  counterText: '',
                  errorText: _isBusinessNameValid ? null : 'Enter business name',
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                    padding: EdgeInsets.all(16),
                    disabledColor: Color(0xFF7fb1fe),                  
                    onPressed: _continueBtnEnabled ? handleContinueBtn : null,
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
}