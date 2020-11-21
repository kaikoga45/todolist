import 'package:flutter/material.dart';

class DevInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0C0F13).withOpacity(0.0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 60.0),
              child: Text(
                'DEVELOPER',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
            ),
            CircleAvatar(
              radius: 75.0,
              backgroundImage: AssetImage('assets/myprofile.jpg'),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              'Kai Koga',
              style: TextStyle(color: Colors.white, fontSize: 25.0),
            ),
            Text(
              '1915093002',
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            ),
            Container(
              margin: EdgeInsets.all(15.0),
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Hello there, i\'m a flutter developer from Singaraja, Bali. I love learning new language and always looking for something new to challenge myself. Currently i am studying Information System in Ganesha University of Education.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.0, color: Colors.grey[300]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
