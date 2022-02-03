// ignore_for_file: unnecessary_this, prefer_const_constructors, unnecessary_brace_in_string_interps, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Info.dart';
import 'main.dart';
class Information {
  String id = "";
  String name = "";
  String surName = "";
  String phone = "";
  String email = "";

  Information(String name, String surname, String phone, String email){
    this.name = name;
    this.surName = surname;
    this.phone = phone;
    this.email = email;
  }
}
class Home extends StatefulWidget {

  @override
  State<StatefulWidget> createState(){
    return _HomePageState();
  }
}

class _HomePageState extends State<Home> {
  late double name;
  final NameController = TextEditingController();
  final SurnameController = TextEditingController();
  final PhoneController = TextEditingController();
  final EmailController = TextEditingController();
  List<Information> informationList = [];
  
  @override
  Widget build(BuildContext context) {

    
    Future<List<String>> createAlertDialog(BuildContextcontext) async{    
      List<String> result = [];
      List<TextEditingController> _controller =
          List.generate(4, (_) => TextEditingController());      
      return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(child:Text('New Contact') ,) ,
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: NameController,
                    decoration: InputDecoration(hintText: 'First Name'),
                  ),
                  TextField(
                    controller: SurnameController,
                    decoration: InputDecoration(hintText: 'Last Name'),
                  ),
                  TextField(
                    controller: EmailController,
                    decoration: InputDecoration(hintText: 'Email Address'),
                  ),
                  TextField(
                    controller: PhoneController,
                    decoration: InputDecoration(hintText: 'Phone Number'),
                  ),
                ],          
              ),
            ),          
            actions: [       
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(                 
                  children: [
                    ElevatedButton(
                      child: const Text('Cancel'),
                      onPressed: () => Navigator.of(context).pop(result),
                    ),    
                    const Padding(padding: EdgeInsets.all(35)),
                    
                    ElevatedButton(
                      
                      child: const Text('Add'),
                      onPressed: () {
                    
                        if(NameController.text == "" || SurnameController.text == "" || PhoneController.text == "" || EmailController.text == "" ){  
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                            content: Text("Please fill out all the fields")),
                          );
                        }
                        else {
                          Information newNameItem = Information(NameController.text, SurnameController.text, EmailController.text, PhoneController.text);
                          informationList.add(newNameItem);
                          setState((){});   
                          Navigator.of(context).pop(result);
                        }        
                        
                      },
                    ),                                      
                  ],
                ),              
              ),
            ],            
          );
        },
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: informationList.length,
          itemBuilder: (context, position) {
            Information currentList = informationList[position];
            String Name = currentList.name;
            String SurName = currentList.surName;
            String Email = currentList.email;
            String Phone = currentList.phone;
            return Dismissible(
              key: Key(currentList.id),
              child: Card(
                child: ListTile(
                  title: Text("${Name} ${SurName}"),
                  onTap: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Info(Name: Name,SurName: SurName, Email: Email, phoneNumber: Phone),
                          ),
                    );
                  },
                ),
              ),
            );
          },
          
        ),
        
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final List<String> result = await createAlertDialog(context);
         
        },

        child: const Icon(Icons.add),
      ), 
      
      
    );
    

  }
  
}
