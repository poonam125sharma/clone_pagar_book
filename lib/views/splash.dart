import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'dart:ui';
import 'dart:async';
// import 'package:google_fonts/google_fonts.dart';
import 'package:pagar_book/utils/db_helper.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    deleteDB();
    Timer(
      Duration(seconds: 5),
      () => {
        print('Done'),
        Navigator.of(context).pushReplacementNamed('/choose-lang')
      }
    );
  }

  deleteDB() async {
    await DatabaseHelper.instance.deleteDB();
  }

  Widget appTitle = RichText(
    text: TextSpan(
      style: TextStyle(color:Colors.black,fontSize:48,fontWeight:FontWeight.bold),
      children: <TextSpan>[
        TextSpan(text:'Pagar'),
        TextSpan(text:'Book',style: TextStyle(fontWeight: FontWeight.normal)),
      ],
    ),
  );

  Widget firstRow = Padding(
    padding: EdgeInsets.symmetric(horizontal:50.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SplashIcon(
          bgColor: Colors.transparent,
          icon: null,
          bgIcon:AssetImage('icons/flags/png/in.png', package: 'country_icons')
        ),
        SizedBox(width: 10,),
        RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:14),
            children: <InlineSpan>[
              TextSpan(text: 'Made with '),
              WidgetSpan(
                child: Icon(Icons.favorite,color: Colors.pink[400],),
                // alignment: ui.PlaceholderAlignment.middle,
              ),
              TextSpan(text: ' in India')
            ],
          ),
        ),
      ],
    ),
  );

  Widget secondRow = Padding(
    padding: EdgeInsets.symmetric(horizontal:50.0),
    child: Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SplashIcon(
          bgColor: Color(0xFF08a862),
          icon:Icon(
            Icons.verified_user,
            color: Colors.white,
          ),
          bgIcon: null
        ),
        SizedBox(width: 10,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('100% Safe & Free', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:14)),
            Text('PagarBook is safe and totally free', style: TextStyle(color: Colors.grey,fontSize:12)),
          ],
        ),
      ],
    ),
  );

  Widget thirdRow = Padding(
    padding: EdgeInsets.symmetric(horizontal:50.0),
    child: Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SplashIcon(
          bgColor: Colors.blue,
          icon:Icon(
            Icons.cloud_done,
            color: Colors.white,
          ),
          bgIcon: null
        ),
        SizedBox(width: 10,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('100% Auto Backup', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:14)),
            Text('PagarBook is safe and totally free', style: TextStyle(color: Colors.grey,fontSize:12)),
          ],
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset('asset/img/wallet.png',width: 120,height: 120,),
          appTitle,
          SizedBox(height: 50,),
          firstRow,
          SizedBox(height: 20,),
          secondRow,
          SizedBox(height: 20,),
          thirdRow,
        ],
      ),
    );
  }
}

class SplashIcon extends StatelessWidget {

  final dynamic bgColor;
  final dynamic bgIcon;
  final dynamic icon;

  SplashIcon({this.bgColor, this.icon, this.bgIcon});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(50),
      padding: EdgeInsets.all(3),
      strokeWidth: 0.5,
      color: Colors.grey[300],
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: CircleAvatar(
          backgroundColor: bgColor,
          radius: 16,
          child: icon,
          backgroundImage: bgIcon,
        ),
      ),
    );
  }
}