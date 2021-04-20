import 'package:com_huthaifa_glints/widgets/drawer_widget.dart';
import 'package:com_huthaifa_glints/widgets/new_tweet_widget.dart';
import 'package:com_huthaifa_glints/widgets/tweetStreamBuilder_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => showDialog<void>(context: context, builder: (context) => NewTweet()),
            icon: Icon(
              Icons.add,
              size: 35,
              semanticLabel: "Create Tweet",
            ),
          )
        ],
        title: Text('Home Page'),
      ),
      body: TweetStreamBuilder(historyView: false),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog<void>(context: context, builder: (context) => NewTweet()),
        child: Icon(
          Icons.add_circle,
          size: 40,
          semanticLabel: "Create Tweet",
        ),
      ),
    );
  }
}
