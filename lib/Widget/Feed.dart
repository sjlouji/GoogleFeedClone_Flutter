import 'package:flutter/material.dart';
import 'package:googlefeedclone_flutter/Data/Feed.dart';
import 'package:googlefeedclone_flutter/Screen/Home.dart';

void main() {
  runApp(FeedWidget());
}

class FeedWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FeedWidgetPage();
  }
}

class FeedWidgetPage extends StatefulWidget {
  FeedWidgetPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FeedWidgetPageState createState() => _FeedWidgetPageState();
}

class _FeedWidgetPageState extends State<FeedWidgetPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: feeds.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return Card(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent
                          ),
                          child: FadeInImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(feeds[index].feed_image),
                            placeholder: AssetImage(feeds[index].feed_image),
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                       Container(
                         padding: EdgeInsets.all(15),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(feeds[index].feed_title, style: TextStyle(color: Colors.grey[900], fontSize: 20, fontWeight: FontWeight.w400),maxLines: 2, overflow: TextOverflow.ellipsis ),
                             SizedBox(height: 5,),
                             Text(feeds[index].feed_caption, maxLines: 2, overflow: TextOverflow.ellipsis ,style: TextStyle(color: Colors.grey[700], fontSize: 16),)
                           ],
                         ),
                       ),
                        Container(
                          padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Icon(Icons.book, color: Colors.blue.shade900, size: 17,),
                                    SizedBox(width: 5,),
                                    Text(feeds[index].punlished_by + ' - '+ feeds[index].timeage),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Icon(Icons.share, color: Colors.grey[600], size: 20,),
                                    SizedBox(width: 20,),
                                    Icon(Icons.bookmark_border_outlined, color: Colors.grey[600], size: 20,),
                                    SizedBox(width: 20,),
                                    Icon(Icons.more_vert, color: Colors.grey[600], size: 20,)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
    );
  }
}

