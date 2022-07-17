import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/Addnode.dart';
import 'package:portfolio/Editnode.dart';



class Screen1 extends StatelessWidget {
  Screen1({Key? key}) : super(key: key);

  final ref=FirebaseFirestore.instance.collection('title');
  

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.orange])),
      child: Scaffold(
            backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text("TechNotes",style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.lime,
        
    
        ),
        floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return  Addnode();
          }
          ));
        },),
        body: StreamBuilder(
          
          stream: ref.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: snapshot.hasData?snapshot.data?.docs.length:0,
             itemBuilder: (_,index){
              return GestureDetector(
                //onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context){
                   // return EditNode(docToEdit: snapshot.data!.docs[index],);
    
              //  },
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return EditNode(docToEdit: snapshot.data!.docs[index],);
                }));
              },
                child :Center(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 150,
                    color: Color.fromARGB(255, 201, 211, 216),
                    child: Column(
                      children: [
                       Text(snapshot.data!.docs[index]['title'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:  Colors.deepPurple),) ,
                         Center(child: Text(snapshot.data!.docs[index]['content']))
              
                      ],
                    ),
                  ),
                ),
              );
             },
            );
          },
        ),
      ),
    );
  }
}


           
         
          
        
           
        
      
        
  
    





  
