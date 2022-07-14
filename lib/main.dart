// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import
import 'package:flutter/material.dart';
import 'package:portfolio/Screen1.dart';
import 'package:firebase_core/firebase_core.dart';





void main()async
{
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      home:Screen1(),
    
          ));
    }