import 'package:flutter/material.dart';
import 'package:portfolio_web/skills/data_layer/skills_data_layer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SkillsDataLayer aboutDataLayer = SkillsDataLayer();
  final list = await aboutDataLayer.fetchskillsData();
  print(list![2].id);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
    );
  }
}
