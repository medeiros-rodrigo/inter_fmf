import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inter_app/list.dart';
//import 'background.dart' ;

void main() => runApp(MyView());

class MyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login: Quanto  Resíduo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyPersonal(),
    );
  }
}




class MyPersonal extends StatefulWidget {
  @override
  //_LoginPageState createState() => _LoginPageState();
  State<StatefulWidget> createState(){
    return _MyPersonalState();
  }

}

class _MyPersonalState extends State<MyPersonal> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,

      body:
      Stack(
        children: <Widget>[
          Positioned(
            top: 0.0,
            child: new Image.asset(
              'assets/images/background.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,

              fit: BoxFit.fill,
            ),
          ),



          SingleChildScrollView(
            child: Column (
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/1,
                  decoration: BoxDecoration(

                    //borderRadius: BorderRadius.only(
                    // bottomLeft: Radius.circular(150),
                    //bottomRight: Radius.circular(150),
                    //)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 45),
                      ),


                      Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 32
                            ),
                            child: Text('',
                              style: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 18
                              ),
                            ),
                          )
                      ),


                      Container(
                        padding: EdgeInsets.only(top:32),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 32),
                              child: Column(
                                children: <Widget>[
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only( top:20, right: 0, bottom: 80
                          ),
                          child: Text('76%',
                            style: TextStyle(
                                color: Colors.teal,
                                fontSize: 90),
                          ),
                        ),
                      ),

                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width/3,
                        margin: EdgeInsets.only(top: 30),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color(0xFF2be974),
                                Color(0xFF2ccf5a)
                              ]
                          ),

                          borderRadius: BorderRadius.all(
                            Radius.circular(50),

                          ),
                        ),
                        child: Center(
                          child: RaisedButton(


                            onPressed: () {
                              Navigator.pop(context);
                              //Navigator.push(
                              //  context,
                               // MaterialPageRoute(builder: (context) => AppList()),
                             // );
                            },
                            color: Colors.transparent,
                            focusColor: Colors.transparent,
                            elevation: 0,




                            child: Text(
                              "Voltar",
                              style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

              ],
            ),




          ),
        ],



      ),




    );
  }
}
