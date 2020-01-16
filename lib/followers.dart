import 'package:flutter/material.dart';

class Followers extends StatefulWidget {
  @override
  _FollowersState createState() => _FollowersState();
}

class _FollowersState extends State<Followers> {
  int i = 0;

  // Generates a list of strings
  List<String> items = List<String>.generate(30, (i) => "RishavRJ${i + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Followers"),
        backgroundColor: Colors.black,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.black,
        ),
        itemCount: items.length,
        itemBuilder: (context, int index) {
          return Container(
              child: ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  "https://ak1.picdn.net/shutterstock/videos/32450041/thumb/12.jpg"),
            ),
            title: Text("${items[index]}"),
            subtitle: Text("117 followers"),
            trailing: ButtonTheme(
              minWidth: 20.0,
              height: 30.0,
              child: FlatButton(
                color: Colors.greenAccent[200],
                child: Text("+ Follow"),
                onPressed: () {},
              ),
            ),
          ));
        },
      ),
    );
  }
}
