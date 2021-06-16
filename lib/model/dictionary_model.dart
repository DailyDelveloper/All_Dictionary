import 'dart:convert';

class DictionaryModel {
  DictionaryModel({
    this.word,
    this.wordtype,
    this.definition,
  });

  String word;
  String wordtype;
  String definition;

  factory DictionaryModel.fromRawJson(String str) =>
      DictionaryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DictionaryModel.fromJson(Map<String, dynamic> json) =>
      DictionaryModel(
        word: json["word"],
        wordtype: json["wordtype"],
        definition: json["definition"],
      );
  Map<String, dynamic> toJson() =>
      {"word": word, "wordtype": wordtype, "definition": definition};
}
