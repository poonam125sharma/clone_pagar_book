import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  void _onBtmNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
                    Container(
                      // color: Colors.white,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(3)
                      ),
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Staff Management Made Easy',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize:20,color:Colors.black),
                          ),
                          SizedBox(height: 20,),
                          Column(
                            children: <Widget>[
                              UnorderedList(text: 'Montly fixed, daily, Weekly, hourly and per piece workers'),
                              SizedBox(height: 10,),
                              UnorderedList(text: 'Record salary, advance, pending payments'),
                              SizedBox(height: 10,),
                              UnorderedList(text: 'Mark attendence, overtime (OT) and late deduction'),
                              SizedBox(height: 10,),
                              UnorderedList(text: 'Send SMS andn PDF report to employees'),
                            ],
                          ),
                          ListTile(
                            leading: MyBullet(),
                            title: Text('My first line'),
                            visualDensity:  VisualDensity(horizontal:0,vertical:0),
                          ),
                          ListTile(
                            leading: MyBullet(),
                            title: Text('My second line'),
                            visualDensity:  VisualDensity(horizontal:0,vertical:0),
                          )
                        ],
                      ),
                    ),
                    RaisedButton(
                      padding: EdgeInsets.all(16),
                      disabledColor: Color(0xFF7fb1fe),                  
                      onPressed: () => {

                      },
                      color: Color(0xFF0065fd),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person_add,color: Colors.white,),
                          SizedBox(width: 5),
                          Text('Add Staff',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,letterSpacing: 1.5),),                          
                        ],
                      ),
                      elevation: 3,
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Our Promise:', 
                      style: TextStyle(
                        color: Colors.grey[700],
                        height: 1.4,
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 20,),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SplashIcon2(
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
                        SizedBox(height: 20,),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SplashIcon2(
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
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black45,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF7fb1fe),
        onTap: _onBtmNavItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('Staff'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            title: Text('Attendance'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_add),
            title: Text('Hire'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],        
      ),
    );
  }
}

class SplashIcon2 extends StatelessWidget {

  final dynamic bgColor;
  final dynamic bgIcon;
  final dynamic icon;

  SplashIcon2({this.bgColor, this.icon, this.bgIcon});

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

class MyBullet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 10.0,
      width: 10.0,
      decoration: new BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}

class UnorderedList extends StatelessWidget {
  final String text;

  UnorderedList({this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        MyBullet(),
        SizedBox(width: 5,),
        Text(text)
      ],
    );
  }
}