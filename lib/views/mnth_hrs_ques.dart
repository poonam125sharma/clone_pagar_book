import 'package:flutter/material.dart';
// import 'package:pagar_book/models/business-dtls.dart';
// import 'package:intl/intl.dart';

class MnthHrsQues extends StatefulWidget {
  @override
  _MnthHrsQuesState createState() => _MnthHrsQuesState();
}

class _MnthHrsQuesState extends State<MnthHrsQues> {
  TextEditingController _shiftHrsCntlr;
  String monthType = '';
  bool _continueBtnEnabled = false;

  void handleMonthTypeChange(String value) {
    setState(() {
      monthType = value;
      _continueBtnEnabled = true;
    });
  }

  handleContinueBtn() async {
    if(!_continueBtnEnabled) return false;
    // final DateTime now = DateTime.now();
    // final DateFormat formatter = DateFormat('yyyy-MM-dd');
    // final String formattedDate = formatter.format(now);
    
    // BusinessDetails bsnsdtls = BusinessDetails(
    //   businessId: bsnsId,
    //   mnthTyp: monthType,
    //   shiftHrs: _shiftHrsCntlr.text,
    //   uDate: formattedDate,
    // );
    // int bsnsId = await bsnsdtls.updateBusinessDetails(bsnsdtls);
    // print('Business Id is $bsnsId');
    Navigator.pushNamed(context, '/dashboard');
  }

  @override
  void initState() {
    super.initState();
    _shiftHrsCntlr = TextEditingController();
    _shiftHrsCntlr.text = '9';    // Initial value of the Shift Hours text field
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
              Flexible(
                child: ListView(
                  children: <Widget>[
                    HeadingWithIcon(icon: Icon(Icons.calendar_today), text: 'How do you calculate monthly salary?'),
                    SizedBox(height: 10),
                    Container(
                      child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 3/2.5,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          MonthTypeSelectionBox(
                            radioValue: 'month_calendar',
                            groupValue: monthType,
                            radioBtnHandle: handleMonthTypeChange,
                            title: 'Calendar Month',
                            subTitle: '(Ex: March - 31 days, April - 30 Days etc)'
                          ),
                          MonthTypeSelectionBox(
                            radioValue: 'month_30_days',
                            groupValue: monthType,
                            radioBtnHandle: handleMonthTypeChange,
                            title: 'Every Month 30 Days',
                            subTitle: '(Ex: March - 30 days, April - 30 Days etc)'
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50,),
                    HeadingWithIcon(icon: Icon(Icons.schedule), text: 'How many hours does your staff work in a shift?'),
                    SizedBox(height: 10,),
                    TextField(
                      keyboardType: TextInputType.phone,
                      controller: _shiftHrsCntlr,
                      onChanged: (value) {
                        setState(() {
                          if(value.isNotEmpty) {
                            _continueBtnEnabled = (monthType.isNotEmpty) ? true : false;
                          }else{
                            _continueBtnEnabled = false;
                          }
                        });
                      },
                      decoration: InputDecoration(
                        helperText: 'Enter the number of hours in a shift',
                        hintStyle: TextStyle(color:Colors.grey[600],fontWeight:FontWeight.w500,fontSize:14),
                        labelText: 'Shift Hours',
                        labelStyle: TextStyle(color:Colors.grey[600],fontWeight:FontWeight.w500,fontSize:14),
                        counterText: ''
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              Align(
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
            ],
          ),
        ),
      ),
    );
  }
}

class CircleIcon extends StatelessWidget {

  final Icon icon;
  final dynamic bgColor;

  CircleIcon({this.icon, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      foregroundColor: Colors.white,
      child: icon,
      backgroundColor: bgColor,
      radius: 16,
    );
  }
}

class HeadingWithIcon extends StatelessWidget {
  final dynamic icon;
  final dynamic text;

  HeadingWithIcon({this.icon,this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleIcon(icon: icon, bgColor: Color(0xFF0065fd)),
        SizedBox(width: 10,),
        Flexible(
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold,fontSize:20,color:Colors.black)
          ),
        ),
      ],
    );
  }
}

class MonthTypeSelectionBox extends StatelessWidget {
  final String radioValue;
  final String groupValue;
  final Function radioBtnHandle;
  final String title;
  final String subTitle;

  MonthTypeSelectionBox({this.radioValue, this.groupValue, this.radioBtnHandle, this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleIcon(icon: Icon(Icons.calendar_today), bgColor: Colors.grey[500]),
              Radio(
                value: radioValue,
                groupValue: groupValue,
                onChanged: radioBtnHandle,
                activeColor: Colors.blue
              ),
            ],
          ),
          Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize:14),),
          Text(subTitle,style: TextStyle(fontSize:14,color: Colors.grey[600]),)
        ],
      ),      
    );
  }
}