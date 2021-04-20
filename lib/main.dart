import 'package:com_huthaifa_glints/screens/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/login_provider.dart';
import 'screens/homepage/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  print('💪🌟💪 GLINTStars... WE GOT THIS 💪🌟💪');
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
          return loginState.isSignedIn ? HomePage(title: 'Huthaifa\'s Twitter Clone') : LoginPage();
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
