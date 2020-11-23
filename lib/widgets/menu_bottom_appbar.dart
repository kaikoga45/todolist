import 'package:flutter/material.dart';
import 'package:todolist/authentication_service.dart';
import 'package:todolist/views/dev_info.dart';
import 'package:todolist/views/login_page.dart';
import 'package:todolist/views/recycle_bin.dart';
import 'package:provider/provider.dart';

class MenuBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: Color(0xff000000),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => DevInfo()));
            },
          ),
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () async {
              var checkSignOut =
                  await context.read<AuthenticationService>().signOut();
              if (checkSignOut) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              }
            },
          ),
          Spacer(),
          IconButton(
            icon: Icon(
              Icons.restore_from_trash,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RecycleBin()));
            },
          ),
        ],
      ),
    );
  }
}
