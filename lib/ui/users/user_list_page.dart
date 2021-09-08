import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_database/providers/db_provider.dart';
import 'package:flutter_database/ui/users/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserListPage extends StatefulWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List<UserModel> users = [];

  getApiUser() async {
    
    var response = await http.get(Uri.parse('https://reqres.in/api/users'));
    var jsonData = jsonDecode(response.body);

    for (var item in jsonData["data"]) {
      UserModel user = UserModel(id: item['id'], firstname: item['first_name'], lastname: item['last_name'], email: item['email'], avatar: item['avatar'],);
      users.add(user);
    }
    return users;
  }

  getLocalUser() async {
    users = [];
    DBProvider.db.getAllUsers().then((value) {
      setState(() {
        users = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getLocalUser();
    getApiUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfffffefe),
        body: Container(
          child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 23.0, right: 23.0, top: 2.0),
                  child: GestureDetector(
                    onTap: () async {
                      await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return advancedAlertDialog(context, users[i]);
                          });
                    },
                    child: Card(
                      elevation: 10.0,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: ListTile(
                        leading: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 0.1),
                          height: 44.0,
                          width: 44.0,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            image: DecorationImage(
                              image: NetworkImage(users[i].avatar),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                        title: Text(users[i].email,
                            style: TextStyle(color: Color(0xff094043))),
                        trailing: Icon(
                          Icons.search_rounded,
                          color: Color(0xff094043).withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ));
  }

  advancedAlertDialog(BuildContext context, UserModel userModel) {
    return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Container(
              constraints: BoxConstraints(maxHeight: 196, maxWidth: 400),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 55, 10, 0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    RichText(
                        text: TextSpan(
                            style: TextStyle(
                                fontSize: 14.5,
                                color: Color(0xff094043),
                                fontWeight: FontWeight.w400),
                            children: [
                          TextSpan(text: "ID: "),
                          TextSpan(
                              text: "${userModel.id}",
                              style: TextStyle(
                                  color: Color(0xff094043),
                                  fontWeight: FontWeight.bold)),
                        ])),
                    SizedBox(height: 4),
                    RichText(
                        text: TextSpan(
                            style: TextStyle(
                                fontSize: 14.5,
                                color: Color(0xff094043),
                                fontWeight: FontWeight.w400),
                            children: [
                          TextSpan(text: "Nombre completo: "),
                          TextSpan(
                              text:
                                  "${userModel.firstname} ${userModel.lastname}",
                              style: TextStyle(
                                  color: Color(0xff094043),
                                  fontWeight: FontWeight.bold)),
                        ])),
                    SizedBox(height: 4),
                    RichText(
                        text: TextSpan(
                            style: TextStyle(
                                fontSize: 14.5,
                                color: Color(0xff094043),
                                fontWeight: FontWeight.w400),
                            children: [
                          TextSpan(text: "Email: "),
                          TextSpan(
                              text: "${userModel.email}",
                              style: TextStyle(
                                  color: Color(0xff094043),
                                  fontWeight: FontWeight.bold)),
                        ])),
                    SizedBox(
                      height: 15.0,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                DBProvider.db.deleteUser(userModel.id);
                                setState(() {
                                  getLocalUser();
                                  getApiUser();
                                });
                                Navigator.of(context).pop();
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff03888f),
                            ),
                            child: Text(
                              'Eliminar',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff03888f),
                            ),
                            child: Text(
                              'Aceptar',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: -40,
                child: CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  backgroundImage: NetworkImage(userModel.avatar),
                  radius: 40,
                )),
          ],
        ));
  }
}

showAlertDialog(BuildContext context) {
  Widget acceptButton = ElevatedButton(
    child: Text("Aceptar"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    actions: [
      acceptButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
