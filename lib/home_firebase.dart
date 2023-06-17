import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //
  // getData()async{
  //   QuerySnapshot<Map<String, dynamic>> collection=await FirebaseFirestore.instance.collection('Notes').get();
  //   collection.docs[0].data()['title'];
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    FutureBuilder(
      future: FirebaseFirestore.instance.collection('Notes').get(),
      builder: (context,snap){
        if(snap.connectionState==ConnectionState.waiting){
          return CircularProgressIndicator();
        }
        else if(snap.hasData){
          return ListView.builder(itemBuilder: (context, index) {},
              itemCount:snap.data!.docs[0].data()['title']);
        }
        // snap.data!.docs[index].data()['title'];
        return ListView();
      },
    ),
      floatingActionButton:  FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return ToDo();
        }));
      }),
      );
  }
}
