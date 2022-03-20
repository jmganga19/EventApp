import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/event_detail.dart';
import 'package:firebase_core/firebase_core.dart';


class EventScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Eventify')),
      body: EventList(),

    );

  }

}
class EventList extends StatefulWidget {

  const EventList({ Key? key,
   }) : super(key: key);
  

  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  final FirebaseFirestore db = FirebaseFirestore.instance;
   List<EventDetail> details =[];

 Future<List<EventDetail>> getDetailsList() async{
   var data = await db.collection('event_details').get();
 //Stream<QuerySnapshot>  data = FirebaseFirestore.instance.collection('event_details').snapshots();
 // ignore: unnecessary_null_comparison
 if(data!=null){
   details = data.docs.map((document) => EventDetail.fromMap(document)).toList();
   int i =0;
   details.forEach((detail) { 

     //detail.id = data.docChanges[i].documentID;
     i ++;
    });
   //
 }
 return details;

 }
 //when the screen is loaded we can get the detail method the details updated and contain event detail
 @override
 void initState(){
   if(mounted){
     getDetailsList().then((data) {
       setState(() {
         details = data;
       });

     });
   }
   super.initState();
 }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: (details!=null)? details.length:0,
      itemBuilder: (context,position){
        String sub = "Date:${details[position].date}-Start ${details[position].startTime} - End: ${details[position].endTime}";
        return ListTile(
          title: Text(details[position].description),
          subtitle: Text(sub),
        );

      });
   }
  }



