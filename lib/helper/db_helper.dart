import 'package:dictionary/model/dictionary_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;

class DictionaryDBHelper {
  Database _db;

  Future<void> init() async {
    io.Directory applicationDirectory =
        await getApplicationDocumentsDirectory();
    String dbPathEnglish =
        path.join(applicationDirectory.path, "Dictionary.db");
    bool dbExistsEnglish = await io.File(dbPathEnglish).exists();

    if (!dbExistsEnglish) {
      ByteData data =
          await rootBundle.load(path.join("assets/db", "Dictionary.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await io.File(dbPathEnglish).writeAsBytes(bytes, flush: true);
    }

    this._db = await openDatabase(dbPathEnglish);
    
  }

  Future<List<DictionaryModel>> getAllTheWordsEnglish() async {
    if (_db == null) {
      throw "db is not initiated, initiate using [init(db)] function";
    }
    List<Map> words;
    await _db.transaction((txn) async {
      words = await txn.query("entries", columns: [
        "word",
        "wordtype",
        "definition",
      ]);
    });
    return words.map((e) => DictionaryModel.fromJson(e)).toList();
  }
}
