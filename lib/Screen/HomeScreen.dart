import 'package:flutter/material.dart';
import 'package:googlefeedclone_flutter/Screen/Home.dart';
import 'package:googlefeedclone_flutter/Widget/Feed.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return HomeScreenPage();
  }
}

class HomeScreenPage extends StatefulWidget {
  HomeScreenPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenPageState createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Container(
        child: FeedWidget(),
      )
    );
  }
}
