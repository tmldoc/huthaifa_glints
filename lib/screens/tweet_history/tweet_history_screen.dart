import 'package:com_huthaifa_glints/widgets/tweetStreamBuilder_widget.dart';
import 'package:flutter/material.dart';

class TweetHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('Tweet History'),
        ),
        body: TweetStreamBuilder(
          historyView: true,
        ));
  }
}
