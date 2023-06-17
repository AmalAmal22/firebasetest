import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/home_firebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToDo extends StatefulWidget {
  const ToDo({Key? key}) : super(key: key);

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('NOTES',
              style: TextStyle(fontSize: 37, color: Colors.brown)),
        ),
        body: Column(
          children: [
            TextField(
              controller: titleController,
            ),
            TextField(
              controller: contentController,
            ),
            ElevatedButton(
                onPressed: () {
                  FirebaseFirestore.instance.collection('Notes').add({
                    'title': titleController.text,
                    'content': contentController.text,
                  });
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Home();
                  }));
                },
                child: Text(''))
          ],
        ));
  }
}
