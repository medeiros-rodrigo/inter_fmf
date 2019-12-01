import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inter_app/user_helper.dart';
import 'package:image_picker/image_picker.dart';

class UserPage extends StatefulWidget {

  final User user;

  UserPage({this.user});

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  final _nameController = TextEditingController();
  final _typeController = TextEditingController();
  final _descriptionController = TextEditingController();

  final _nameFocus = FocusNode();

  bool _userEdited = false;

  User _editedUser;

  @override
  void initState() {
    super.initState();

    if (widget.user == null) {
      _editedUser = User();
    } else {
      _editedUser = User.fromMap((widget.user.toMap()));

      _nameController.text = _editedUser.name;
      _typeController.text = _editedUser.type;
      _descriptionController.text = _editedUser.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(_editedUser.name ?? "Novo Recipiente"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_editedUser.name != null && _editedUser.name.isNotEmpty) {
              Navigator.pop(context, _editedUser);
            } else {
              FocusScope.of(context).requestFocus(_nameFocus);
            }
          },
          child: Icon(Icons.save),
          backgroundColor: Colors.teal,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              GestureDetector(
                child: Container(
                  width: 140.0,
                  height: 140.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: _editedUser.img != null
                            ? FileImage(File(_editedUser.img))
                            : AssetImage("assets/images/icon.png"),
                        fit: BoxFit.cover
                    ),
                  ),
                ),
                onTap: (){
                  ImagePicker.pickImage(source: ImageSource.camera).then((file){
                    if(file == null) return;
                    setState(() {
                      _editedUser.img = file.path;
                    });
                  });
                },
              ),
              TextField(
                controller: _nameController,
                focusNode: _nameFocus,
                decoration: InputDecoration(labelText: "Nome"),
                onChanged: (text) {
                  _userEdited = true;
                  setState(() {
                    _editedUser.name = text;
                  });
                },
              ),
              TextField(
                controller: _typeController,
                decoration: InputDecoration(labelText: "Tipo"),
                onChanged: (text) {
                  _userEdited = true;
                  _editedUser.type = text;
                },

              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: "Descrição"),
                onChanged: (text) {
                  _userEdited = true;
                  _editedUser.description = text;
                },
                //keyboardType: TextInputType.description,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _requestPop() {
    if (_userEdited) {
      showDialog(context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Descartar Alterações?"),
              content: Text("Se sair as alterações serão perdidas."),
              actions: <Widget>[
                FlatButton(
                  child: Text("Cancelar"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text("Sim"),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                )
              ],
            );
          }
        );
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
