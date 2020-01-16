import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'followers.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'Rishav Raj Jain'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool pressed = false;
  String status = "+ Follow";
  Color col = Colors.greenAccent[200];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            widget.title,
            //style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.blue,
        body: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                color: Colors.white,
                elevation: 0.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://ak1.picdn.net/shutterstock/videos/32450041/thumb/12.jpg"),
                    ),
                    title: Row(
                      children: <Widget>[
                        SizedBox(width: 10, height: 10),
                        buildButton("163", "UPVOTES"),
                        SizedBox(width: 15, height: 10),
                        buildButton("10", "FOLLOWERS"),
                        SizedBox(width: 15, height: 10),
                        buildButton("14", "POSTS")
                      ],
                    ),
                    subtitle: ButtonTheme(
                        minWidth: 20.0,
                        height: 30.0,
                        child: FlatButton(
                          color: col,
                          child: new Text(
                            status,
                            style: pressed
                                ? TextStyle(
                                    fontSize: 15.0,
                                  )
                                : TextStyle(fontSize: 15.0),
                          ),
                          onPressed: () {
                            setState(() {
                              pressed = !pressed;
                              if (status == "+ Follow") {
                                status = "- Unfollow";
                                col = Colors.grey;
                              } else {
                                status = "+ Follow";
                                col = Colors.greenAccent[200];
                              }
                            });
                          },
                        )),
                  ),
                ),
              ),
              Container(
                height: 50,
                child: DefaultTabController(
                  length: 2,
                  initialIndex: 1,
                  child: Column(
                    children: <Widget>[
                      Material(
                        color: Colors.grey[200],
                        child: TabBar(
                          indicatorColor: Colors.green,
                          labelColor: Colors.black,
                          tabs: <Widget>[
                            Tab(
                              text: "Posts",
                            ),
                            Tab(
                              text: "Awards",
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(13, 13, 29, 2),
                  child: Text(
                      "Badges are awarded for participation throughout the MoneyVerbs community.",
                      style: GoogleFonts.openSans(
                          fontSize: 16, fontWeight: FontWeight.w600))),
              Padding(
                  padding: const EdgeInsets.fromLTRB(13, 0, 29, 10),
                  child: Text("Jump in and start collecting!",
                      style: GoogleFonts.openSans(
                          fontSize: 15, fontWeight: FontWeight.w600))),
              Container(
                height: 450.0,
                child: ListView(
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  children: <Widget>[
                    buildCard("Social Butterfly",
                        "https://i.ibb.co/1vXpqVs/flutter-logo.jpg"),
                    buildCard(
                        "Scholar", "https://i.ibb.co/1vXpqVs/flutter-logo.jpg"),
                    buildCard("Mathematician",
                        "https://i.ibb.co/1vXpqVs/flutter-logo.jpg"),
                    buildCard("Loren ipsum dolor",
                        "https://i.ibb.co/1vXpqVs/flutter-logo.jpg"),
                    buildCard("Aliquam risus tortor",
                        "https://i.ibb.co/1vXpqVs/flutter-logo.jpg"),
                    buildCard("Riadle risus tortor",
                        "https://i.ibb.co/1vXpqVs/flutter-logo.jpg")
                  ],
                ),
              ),
            ],
          ),
        ));
  }

// This method builds the button for UPVOTES,FOLLOWERS,POSTS

  Padding buildButton(String number, String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Column(
        children: <Widget>[
          RawMaterialButton(
            constraints: BoxConstraints(),
            child: Text(number,
                style: GoogleFonts.openSans(
                    fontSize: 23, fontWeight: FontWeight.w700)),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            ),
          ),
          Text(title,
              style: GoogleFonts.openSans(
                  fontSize: 12, fontWeight: FontWeight.w500))
        ],
      ),
    );
  }

// This method builds the Cards

  Card buildCard(String txt, String img) {
    return Card(
      color: Colors.white,
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: ListTile(
          isThreeLine: true,
          leading: Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Container(
                  child: Align(
                    alignment: Alignment.topLeft,
                    widthFactor: 0.75,
                    heightFactor: 1,
                    child: Image.network(img),
                  ),
                ),
              ),
            ],
          ),
          title:
              Text(txt, style: GoogleFonts.roboto(fontWeight: FontWeight.w500)
                  //style: TextStyle(fontWeight: FontWeight.bold),
                  ),
          subtitle: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Share a post on social media.",
                    style: GoogleFonts.roboto(
                        fontSize: 13, fontWeight: FontWeight.w500)),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 4, 4, 4),
                    child: Text("Earned 4/13/2019",
                        style: GoogleFonts.roboto(
                            fontSize: 10, fontWeight: FontWeight.w300))),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 2, 0),
                      child: Text("SHARE",
                          style: GoogleFonts.roboto(
                              fontSize: 9, fontWeight: FontWeight.w400)),
                    ),
                    Icon(
                      MdiIcons.exportVariant,
                      size: 12,
                      color: Colors.green,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
