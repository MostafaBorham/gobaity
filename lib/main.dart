
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yallabaity/gobaity_app.dart';
import 'injection_container.dart' as di; // for dependancy inversion
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();


  runApp( const GoBaityApp());
}
