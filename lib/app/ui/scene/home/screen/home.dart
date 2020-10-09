import 'package:flutter/material.dart';
import 'package:gallery/app/ui/scene/welcome/screen/welcome.dart';
import 'package:gallery/data/entity/user.dart';
import 'package:gallery/repository/firebase/firebase_auth.dart';

class Home extends StatefulWidget {
  User user;
  Home(this.user);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () async {
            await FirebaseAuth().logOut();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => Welcome(),
              ),
            );
          },
          child: Text(widget.user.id),
        ),
      ),
    );
  }
}
