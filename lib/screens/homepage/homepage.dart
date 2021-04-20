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
        title: Text(widget.title!),
      ),
      body: TweetStreamBuilder(canEdit: false),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog<void>(context: context, builder: (context) => NewTweet()),
        child: Icon(
          Icons.add_circle,
          semanticLabel: "Create Tweet",
        ),
      ),
    );
  }
}
