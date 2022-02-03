import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';
import 'home.dart';

class Info extends StatefulWidget {
  const Info(
      {Key? key,
      required this.Name,
      required this.SurName,
      required this.Email,
      required this.phoneNumber})
      : super(key: key);

  final String Name;
  final String SurName;
  final String Email;
  final String phoneNumber;

  @override
  State<StatefulWidget> createState(){
    return _InfoPageState();
  }
}
class _InfoPageState extends State<Info> {
  @override
  Widget build(BuildContext context){
  
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.Name} ${widget.SurName}'),
        centerTitle: true,
      ),
      body: Container(  
        child: Column( 
          children: [
            Center(
              child: (Image.network("https://www.kindpng.com/picc/m/78-786207_user-avatar-png-user-avatar-icon-png-transparent.png",height: 250, width: 250,)),
            
            ),
            Container(margin: EdgeInsets.all(10), child: Row(children: [
              Text("Phone Number: ", style: TextStyle(fontWeight: FontWeight.bold ),),
              Text("${widget.phoneNumber}"),
            ],),),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text("Email Address: ", style: TextStyle(fontWeight: FontWeight.bold ),),
                  Text("${widget.Email}"),
                ],           
              ),
            ),        
          ],
        ),
      ),
    );  
  } 
}