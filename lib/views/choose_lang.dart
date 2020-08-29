import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';

enum Langs { Hindi, English}

class ChooseLang extends StatefulWidget {

  @override
  _ChooseLangState createState() => _ChooseLangState();
}

class _ChooseLangState extends State<ChooseLang> {
  // _read() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final key = 'my_int_key';
  //   final value = prefs.getInt(key) ?? 0;
  //   print('Read $value');    
  // }

  String language = '';
  List<String> langArr = [
    'Hindi',
    'English',
    'Marathi',
    'Punjabi',
    'French',
    'German',
    'Spanish'
  ];
  handleRadioValueChanged(String value) {
    setState( () {
      language = value;
    });
  }

  handleContinue() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'user_lang';
    final value = 'English'; //language;
    prefs.setString(key,value);
    Navigator.pushNamed(context, '/get-number');
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
              Text('Select Language',style: TextStyle(fontWeight: FontWeight.bold,fontSize:20),),
              SizedBox(height: 5,),
              Text('Please select a language that you can read and understand comfortably',style: TextStyle(
                  color: Colors.grey[600],
                  height: 1.4,
                  fontSize: 14
                ),
              ),
              SizedBox(height: 30,),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 3/2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: langArr.map<Widget>((String lang) => 
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(3)
                      ),
                      child: Row(
                        children: <Widget>[
                          Radio(
                            value: lang, //Langs.Hindi.toString(),
                            groupValue: language,
                            onChanged: handleRadioValueChanged,
                            activeColor: Colors.blue
                          ),
                          Flexible(child: Text(lang,style:TextStyle(fontSize: 20))),
                        ],
                      ),
                      
                    ),
                  ).toList(),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                  padding: EdgeInsets.all(16),
                  disabledColor: Color(0xFF7fb1fe),                  
                  onPressed: (language == '') ? null : handleContinue,
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