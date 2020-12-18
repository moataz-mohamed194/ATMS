import 'package:firebase_database/firebase_database.dart';

class department{
  String key;
  String name;
  String des;
  department(this.des,this.name);
  department.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        name = snapshot.value["Name"],
        des= snapshot.value["Description"];
  toJson() {
    return {
      "Name": name,
      "Count":0,
      "Description": des,
    };
  }
}