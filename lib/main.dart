import 'package:com_huthaifa_glints/screens/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/login_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  print('💪🐘💪 GLINTSARS... WE GOT THIS 💪🐘💪');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => LoginState(),
      child: MaterialApp(
        title: 'Huthaifa\'s Twitter Clone',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Consumer<LoginState>(builder: (context, loginState, __) {
          return loginState.isSignedIn ? MyHomePage(title: 'Huthaifa\'s Twitter Clone') : LoginPage();
        }),
        onGenerateRoute: (RouteSettings settings) {
          Map<dynamic, dynamic> routes = {};
          WidgetBuilder builder = routes[settings.name]!;

          return MaterialPageRoute(builder: (ctx) => builder(ctx));
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to twitter',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: "Create Tweet",
          child: Icon(
            Icons.add_circle,
            semanticLabel: "Create Tweet",
          )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
