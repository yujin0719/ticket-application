import 'package:flutter/material.dart';
import 'package:ticket_app/screens/auth_page.dart';

class ProfileSideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border(left: BorderSide(color: Colors.grey[300])),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.grey[300],
              height: 1,
            ),
            FlatButton.icon(
              onPressed: () {
                final route =
                    MaterialPageRoute(builder: (context) => AuthPage());
                Navigator.pushReplacement(context, route);
              },
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.black87,
              ),
              label: Text("Log out",
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.w500)),
            ),
          ],
        ));
  }
}
