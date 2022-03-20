import 'package:eventapp/screens/event_screen.dart';
import 'package:eventapp/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'firebase_options.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(
   home: LoginScreen(),
  ));
}
//connect to database
Future testData() async{
  FirebaseFirestore db = FirebaseFirestore.instance;
//method to get all available data from the collection
  var data = await db.collection('event_details').get();
  //if data is not null create list 'details'
  var details  = data.docs.toList();
  //for each item in details we will print documentId
  details.forEach((item) { 
    print(item.id);
  });

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     testData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyEvent',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      
    );
    
   
  }
}


 