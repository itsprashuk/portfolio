import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class EditNode extends StatefulWidget {

  DocumentSnapshot docToEdit;
  EditNode({required this.docToEdit});

  @override
  State<EditNode> createState() => _EditNodeState();
}

class _EditNodeState extends State<EditNode> {
   TextEditingController title=TextEditingController();
  TextEditingController content=TextEditingController();

  @override
  void initState() {
    title=TextEditingController(text: widget.docToEdit['title']);
    content=TextEditingController(text: widget.docToEdit['content']);
    super.initState();
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(onPressed: (){
            
            widget.docToEdit.reference.update({
              'title':title.text,
              'content':content.text,
            }).whenComplete(()=> Navigator.pop(context));

          }, child: Text("Save")),
          


           

      ],),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20,vertical:10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
               controller: title,
                decoration: InputDecoration(hintText:'Title'),
              )
                
              ),
              SizedBox(height: 10,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                 controller: content,
                  maxLines: null,
                  expands:true,
                  decoration:InputDecoration(hintText:'Content'),
                ),

              ),
              ),
            



        ]),
      ),
    );
}
}