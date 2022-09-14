import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'model/SocialButton.dart';

String facebook_app_id = "5311034959013096";
String facebook_client_token = "830b7b2200fb90a2b8a208852960d478";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Auth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Social Auth'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildSocialImageButtons(
                  title: 'Google',
                  image: 'assets/google_logo.png',
                  color: Colors.transparent
              ),
              _buildSocialImageButtons(
                  title: 'Facebook',
                  image: 'assets/facebook_logo.png',
                  color: Colors.transparent,
              ),
              _buildSocialImageButtons(
                  title: 'Apple',
                  image: 'assets/apple_logo.png',
                  color: Colors.transparent
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildSocialImageButtons({
    required String title,
    required String image,
    required Color color
  }) {
    return SocialButton(title: title, image: image, color: color, onComplete: () {authenticate(title);},);
  }

  authenticate(String title) {
    switch (title) {
      case "Facebook":
        facebookAuth();
        break;

      case "Google":
        break;

      case "Apple":
        break;
    }
  }

  void facebookAuth() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      // you are logged
      print("Logged in");
      final AccessToken accessToken = result.accessToken!;
    } else {
      print(result.status);
      print(result.message);
    }
  }
}
