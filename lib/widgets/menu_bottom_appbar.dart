import 'package:flutter/material.dart';
import 'package:todolist/views/dev_info.dart';
import 'package:todolist/views/recycle_bin.dart';

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
              Icons.restore_from_trash,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RecycleBin()));
            },
          ),
          Spacer(),
          IconButton(
            icon: Icon(
              Icons.contact_mail,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => DevInfo()));
            },
          ),
        ],
      ),
    );
  }
}
