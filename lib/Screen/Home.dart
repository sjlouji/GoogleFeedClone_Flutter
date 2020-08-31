import 'package:flutter/material.dart';
import 'package:googlefeedclone_flutter/Screen/HomeScreen.dart';
import 'package:googlefeedclone_flutter/Widget/Feed.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Feed Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Google Feed Demo'),
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


  Widget _widgetBody = HomeScreen();
  int _currrentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _onItemTapped(int index) async{
    setState(() {
      if(index == 0){
        _currrentIndex = index;
        _widgetBody = HomeScreen();
      }
      else if(index == 1){
        _currrentIndex = index;
        _widgetBody = Center(child: Text('Hell'),);
      }
      else if(index == 2){
        _currrentIndex = index;
        _widgetBody = Center(child: Text('Hell'),);
      }
      else if(index == 3){
        _currrentIndex = index;
        _widgetBody = Center(child: Text('Hell'),);
      }
      else if(index == 4){
        _currrentIndex = index;
        _widgetBody = Center(child: Text('Hell'),);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: new SafeArea(
        child: DefaultTabController(
          length: 4,
          child: NestedScrollView(

              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  PreferredSize(
                    preferredSize: Size.fromHeight(50.0),
                    child: SliverAppBar(
                      pinned: false,
                      backgroundColor: Colors.white,
                      centerTitle: false,
                      floating: true,
                      actions: [
                        Container(
                          padding: EdgeInsets.only(right: 15),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage("https://qph.fs.quoracdn.net/main-qimg-11ef692748351829b4629683eff21100.webp"),
                            radius: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverPersistentHeader(
                      delegate: _SliverAppBarDelegate(
                        Container(
                          width:100,
                          height: 250,
                          child: Column(
                            children: [
                              Image.asset("assets/Google.png",  width: 170,),
                              Container(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Card(
                                  elevation: 0,

                                  shape: RoundedRectangleBorder(side: new BorderSide(color: Colors.grey[300], width: 1.0), borderRadius: BorderRadius.circular(30.0)),
                                  clipBehavior: Clip.antiAlias,
                                  child: Container(
                                    height: 50.0,
                                    width: MediaQuery.of(context).size.width,
                                    color: Colors.white,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(padding: EdgeInsets.only(left:10),),
                                        Icon(Icons.search,color: Colors.grey[800],),
                                        Padding(padding: EdgeInsets.all(5),),
                                        Text('Search...',style: TextStyle(color: Colors.grey[500],fontSize: 17.0, ),),
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Container(
                                              child: Image.network('https://seeklogo.com/images/G/google-mic-logo-EF440C9A6F-seeklogo.com.png', height: 20,width: 20,),
                                            ),
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(5),)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      )
                  ),
                ];
              },
              body: Container(
                  padding: EdgeInsets.all(15),
                  child: _widgetBody
              ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currrentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black54,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.whatshot, color: Colors.blue,size: 25),
              title: Text("Discover")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu, size: 25),
              title: Text("Updates")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 25),
              title: Text("Search")
          ),
          BottomNavigationBarItem(
              icon: _currrentIndex==3?Icon(Icons.collections, size: 25):Icon(Icons.collections, size: 25),
              title: Text("Collections")
          ),
          BottomNavigationBarItem(
              icon: _currrentIndex==4?Icon(Icons.more_horiz, size: 25):Icon(Icons.more_horiz, size: 25),
              title: Text("More")
          ),
        ],
      ),
    );
  }
}


class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._search);

  final Container _search;

  @override
  double get minExtent => 200;
  @override
  double get maxExtent => 200;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Colors.white,
      child: _search,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}