import 'package:flutter/material.dart';
import 'package:flutter_database/ui/users/model/user_model.dart';
import 'package:flutter_database/ui/users/user_form_page.dart';
import 'package:flutter_database/ui/users/user_list_page.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({this.userModel});
  UserModel? userModel;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, initialIndex: 0, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        FocusScope.of(context).unfocus();
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: Color(0xff03888f),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Color(0xff33ee7c),
          tabs: [
            Tab(
                icon: Icon(
              Icons.person_outline_outlined,
              color: Color(0xfffffefe),
            )),
            Tab(
                icon: Icon(
              Icons.create_outlined,
              color: Color(0xfffffefe),
            )),
          ],
        ),
        title: Text(
          "fake software",
          style: GoogleFonts.nunito(
            color: Color(0xfffffefe),
            fontSize: 22.5,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.4,
          ),
        ),
      ),
      body: Center(
          child: TabBarView(
        children: [
          new UserListPage(),
          UserFormPage(
            userModel: new UserModel(
                id: 0, firstname: '', lastname: '', email: '', avatar: ''),
          )
        ],
        controller: _tabController,
      )),
    );
  }
}
