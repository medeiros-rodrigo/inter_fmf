import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inter_app/list.dart';
import 'package:inter_app/home_page.dart';
//import 'background.dart' ;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login: Quanto  Resíduo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: LoginPage(),
    );
  }
}




class LoginPage extends StatefulWidget {
  @override
  //_LoginPageState createState() => _LoginPageState();
  State<StatefulWidget> createState(){
    return _LoginPageState();
  }

}

class _LoginPageState extends State<LoginPage> {
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
                        alignment: Alignment.bottomCenter,
                        child: Image.asset('assets/images/icon.png'),
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
                                  Container(
                                    width: MediaQuery.of(context).size.width/1.5,
                                    height: 40,
                                    padding: EdgeInsets.only(top:4,left:16),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(50)),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 5
                                          )
                                        ]
                                    ),
                                    child: TextField(
                                      //validator: (input){
                                      // if (input.empty){return ' Insira seu email';}}

                                      decoration: InputDecoration(
                                        hintText: 'Email',
                                          //labelText: 'Email',

                                          suffixIcon: Icon(Icons.person_outline,color: Colors.grey,),
                                          border: InputBorder.none
                                      ),
                                    ),
                                  ),



                                  Container(
                                    width: MediaQuery.of(context).size.width/1.5,
                                    height: 40,
                                    margin: EdgeInsets.only(top: 30),
                                    padding: EdgeInsets.only(top:4,left:16),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(50)),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 5
                                          )
                                        ]
                                    ),
                                    child: TextField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        hintText: 'Senha',
                                        suffixIcon: Icon(Icons.vpn_key,color: Colors.grey,),
                                        border: InputBorder.none,
                                      ),

                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only( top:20, right: 72
                          ),
                          child: Text('Esqueceu a senha?',
                            style: TextStyle(
                                color: Colors.teal,
                                fontSize: 14),
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
                            //Navigator.push(
                              //context,
                            //  MaterialPageRoute(builder: (context) => AppList()),
                          //  );
                         // },
                             // {
                              Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage()),
                              );
                              },





                            color: Colors.transparent,
                            focusColor: Colors.transparent,
                            elevation: 0,




                          child: Text(
                            "Entrar",
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
