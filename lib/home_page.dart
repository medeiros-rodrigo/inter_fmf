import 'dart:io';

import 'package:inter_app/user_helper.dart';
import 'package:inter_app/user_page.dart';
import 'package:flutter/material.dart';
import 'package:inter_app/view.dart';
import 'package:url_launcher/url_launcher.dart';

enum OrderOptions { orderaz, orderza }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserHelper helper = UserHelper();

  List<User> users = List();

  @override
  void initState() {
    super.initState();

    _getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Usuários"),
        backgroundColor: Colors.teal,
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton<OrderOptions>(
            itemBuilder: (context) => <PopupMenuEntry<OrderOptions>>[
              const PopupMenuItem<OrderOptions>(
                child: Text("Ordenar de A-Z"),
                value: OrderOptions.orderaz,
              ),
              const PopupMenuItem<OrderOptions>(
                child: Text("Ordenar de Z-A"),
                value: OrderOptions.orderza,
              ),
            ],
            onSelected: _orderList,
          )
        ],
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showUserPage();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(10.0),
          itemCount: users.length,
          itemBuilder: (context, index) {
            return _userCard(context, index);
          }
      ),
    );
  }

  Widget _userCard(BuildContext context, int index) {
    return GestureDetector(
        child: Card(
          child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: users[index].img != null
                              ? FileImage(File(users[index].img))
                              : AssetImage("assets/images/icon.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            users[index].name ?? "",
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.bold),
                          ),
                          Text(users[index].type ?? "",
                            style: TextStyle(fontSize: 22.0),
                          ),
                          Text(
                            users[index].description ?? "",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ))
                ],
              )),
        ),
        onTap: () {
          // _showUserPage(user: users[index]);
          _showOptions(context, index);
        });
  }

  void _showOptions(BuildContext, int index) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomSheet(
            onClosing: () {},
            builder: (context) {
              return Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    /////////////////////Visualizar//////////////////////////
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        child: Text(
                          "Visualizar",
                          style: TextStyle(color: Colors.teal, fontSize: 20.0),
                        ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyPersonal()),
                            );
                          },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        child: Text(
                          "Editar",
                          style: TextStyle(color: Colors.teal, fontSize: 20.0),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          _showUserPage(user: users[index]);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        child: Text(
                          "Excluir",
                          style: TextStyle(color: Colors.teal, fontSize: 20.0),
                        ),
                        onPressed: () {
                          helper.deleteUser(users[index].id);
                          setState(() {
                            users.removeAt(index);
                            Navigator.pop(context);
                          });
                        },
                      ),
                    )
                  ],
                ),
              );
            },
          );
        });
  }

  void _showUserPage({User user}) async {
    final recUser = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => UserPage(user: user)));
    if (recUser != null) {
      if (user != null) {
        await helper.updateUser(recUser);
        _getAllUsers();
      } else {
        await helper.saveUser(recUser);
      }
      _getAllUsers();
    }
  }

  void _getAllUsers() {
    helper.getAllUsers().then((list) {
      setState(() {
        users = list;
      });
    });
  }

  void _orderList(OrderOptions result) {
    switch (result) {
      case OrderOptions.orderaz:
        users.sort((a, b) {
          return a.name.toLowerCase().compareTo(b.name.toLowerCase());
        });
        break;
      case OrderOptions.orderza:
        users.sort((a, b) {
          return b.name.toLowerCase().compareTo(a.name.toLowerCase());
        });
        break;
    }
    setState(() {});
  }
}
