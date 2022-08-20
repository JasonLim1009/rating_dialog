import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:store_redirect/store_redirect.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final _dialog = RatingDialog(
   title: Text('Rating Dialog'),
   message: Text('Tap a star to set your rating'),
   image: const FlutterLogo(size: 60),
   submitButtonText: 'Submit',
   onCancelled: () => print('cancelled'),
   onSubmitted: (response) {
     print('rating: ${response.rating}, comment: ${response.comment}');
     
     if (response.rating < 3.0) {
       
     } else {
       StoreRedirect.redirect(androidAppId: '', iOSAppId: 'com.example.untitled');
     }
   },
  );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(context: context, builder: (context) => _dialog,
            );
          }, child: Text('Show Rating Dialog'),
        ),
      ),
    );
  }
}
