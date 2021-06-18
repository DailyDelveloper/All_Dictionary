import 'package:dictionary/helper/db_helper.dart';
import 'package:dictionary/model/dictionary_model.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  void dis() async {
    List<String> words;
    DictionaryDBHelper db = DictionaryDBHelper();
    await db.init();
    List<DictionaryModel> result = await db.getAllTheWordsEnglish();
    print(" Words Length ${result.length}");
  }

  @override
  Widget build(BuildContext context) {
    dis();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
