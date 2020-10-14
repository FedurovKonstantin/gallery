import 'package:flutter/material.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          //backgroundColor: Colors.white,
          centerTitle: true,
          title: Container(
            width: 343,
            height: 36,
            color: Colors.grey,
          ),
          bottom: TabBar(
            indicatorPadding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            tabs: [
              Tab(
                text: 'New',
              ),
              Tab(
                text: 'Popular',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Text('1111'),
            Text('2222'),
          ],
        ),
      ),
    );
  }
}
