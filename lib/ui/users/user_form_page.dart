import 'package:flutter_database/ui/home_page.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_database/providers/db_provider.dart';
import 'package:flutter_database/ui/users/model/user_model.dart';

class UserFormPage extends StatefulWidget {
  UserFormPage({this.userModel});
  UserModel? userModel;
  @override
  _EditarState createState() => _EditarState();
}

class _EditarState extends State<UserFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _cFirstName = TextEditingController();
  final _cLastName = TextEditingController();
  final _cEmail = TextEditingController();
  final _cId = TextEditingController();
  final _cAvatar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
   return Scaffold(
     backgroundColor: Color(0xfffffefe),
    body: Container(
     child: ListView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
       children: [
        Padding(
          child: Form(
              key: _formKey,
              child: Column(children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(left: 23.0, right: 23.0, top: 1.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Material(
                      color: Color(0xfffffefe),
                      elevation: 18.0,
                      borderRadius: BorderRadius.circular(10.0),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 1.5, left: 10.0, right: 10.0, bottom: 1.5),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: _cId,
                          validator: (value) {
                            if (value!.isEmpty) return "El ID es obligatorio";
                            return null;
                          },
                          style: TextStyle(color: Color(0xff094043)),
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(5),
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.format_list_numbered_rounded,
                              color: Color(0xff03888f),
                            ),
                            labelText: "ID",
                            labelStyle: TextStyle(
                                color: Color(0xff094043).withOpacity(0.55),
                                fontSize: 13.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 23.0, right: 23.0, top: 1.0),
                  child: Material(
                    color: Color(0xfffffefe),
                    elevation: 18.0,
                    borderRadius: BorderRadius.circular(10.0),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 1.5, left: 10.0, right: 10.0, bottom: 1.5),
                      child: TextFormField(
                        controller: _cFirstName,
                        validator: (value) {
                          if (value!.isEmpty) return "El nombre es obligatorio";
                          return null;
                        },
                        style: TextStyle(color: Color(0xff094043)),
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.all(5),
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.person_add_alt_1_rounded,
                            color: Color(0xff03888f),
                          ),
                          labelText: "Nombre",
                          labelStyle: TextStyle(
                              color: Color(0xff094043).withOpacity(0.55),
                              fontSize: 13.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 23.0, right: 23.0, top: 1.0),
                  child: Material(
                    color: Color(0xfffffefe),
                    elevation: 18.0,
                    borderRadius: BorderRadius.circular(10.0),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 1.5, left: 10.0, right: 10.0, bottom: 1.5),
                      child: TextFormField(
                        controller: _cLastName,
                        validator: (value) {
                          if (value!.isEmpty)
                            return "El apellido es obligatorio";
                          return null;
                        },
                        style: TextStyle(color: Color(0xff094043)),
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.all(5),
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.person_add_alt_1_rounded,
                            color: Color(0xff03888f),
                          ),
                          labelText: "Apellido",
                          labelStyle: TextStyle(
                              color: Color(0xff094043).withOpacity(0.55),
                              fontSize: 13.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 23.0, right: 23.0, top: 1.0),
                  child: Material(
                    color: Color(0xfffffefe),
                    elevation: 18.0,
                    borderRadius: BorderRadius.circular(10.0),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 1.5, left: 10.0, right: 10.0, bottom: 1.5),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _cEmail,
                        validator: (value) {
                          if (value!.isEmpty) return "El email es obligatorio";
                          return null;
                        },
                        style: TextStyle(color: Color(0xff094043)),
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.all(5),
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.email_rounded,
                            color: Color(0xff03888f),
                          ),
                          labelText: "Email",
                          labelStyle: TextStyle(
                              color: Color(0xff094043).withOpacity(0.55),
                              fontSize: 13.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 23.0, right: 23.0, top: 1.0),
                  child: Material(
                    color: Color(0xfffffefe),
                    elevation: 18.0,
                    borderRadius: BorderRadius.circular(10.0),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 1.5, left: 10.0, right: 10.0, bottom: 1.5),
                      child: TextFormField(
                        keyboardType: TextInputType.url,
                        controller: _cAvatar,
                        validator: (value) {
                          if (value!.isEmpty) return "El avatar es obligatorio";
                          return null;
                        },
                        style: TextStyle(color: Color(0xff094043)),
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.all(5),
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.image_rounded,
                            color: Color(0xff03888f),
                          ),
                          labelText: "Avatar",
                          labelStyle: TextStyle(
                              color: Color(0xff094043).withOpacity(0.55),
                              fontSize: 13.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (widget.userModel!.id > 0) {
                          widget.userModel!.firstname = _cFirstName.text;
                          widget.userModel!.lastname = _cLastName.text;
                          widget.userModel!.email = _cEmail.text;
                          widget.userModel!.avatar = _cAvatar.text;
                          widget.userModel!.id = int.parse(_cId.text);
                        } else
                          setState(() async {
                            var response = await http.post(
                                Uri.parse('https://reqres.in/api/users'),
                                headers: {
                                  'contentType':
                                      "application/x-www-form-urlencoded; charset=UTF-8"
                                },
                                body: {
                                  "name": "morpheus",
                                  "job": "leader"
                                });
                            DBProvider.db.createUsers(UserModel(
                              id: int.parse(_cId.text),
                              email: _cEmail.text,
                              firstname: _cFirstName.text,
                              lastname: _cLastName.text,
                              avatar: _cAvatar.text,
                            ));
                            Navigator.pop(context);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return HomePage();
                            }));
                          });
                      }
                    },
                    style: ElevatedButton.styleFrom(primary: Color(0xff03888f)),
                    child: Text("GUARDAR"))
              ])),
          padding: EdgeInsets.all(15),
        ),
      ],
    )));
  }
}
