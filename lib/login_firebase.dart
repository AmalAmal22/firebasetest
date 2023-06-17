import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Login',style: TextStyle(color: Colors.grey,fontSize: 37),)),
    body: Column(children: [
      TextField(controller:emailcontroller ,),
      TextField(controller: passcontroller,),
      ElevatedButton(onPressed: (){
       FirebaseAuth.instance.signInWithEmailAndPassword(
           email: emailcontroller.text,
           password: passcontroller.text);
      }, child: Text('Login')),
      ElevatedButton(onPressed: (){


        // FirebaseFirestore.instance.collection('Notes').add({'title':'asdfg'});

        // FirebaseFirestore.instance.collection('Notes').get();

       FirebaseAuth.instance.createUserWithEmailAndPassword(
           email: emailcontroller.text,
           password: passcontroller.text);
      }, child: Text('SignUp'))
    ]),);

  }
}
