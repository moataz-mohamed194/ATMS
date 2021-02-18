import 'package:firebase_database/firebase_database.dart';

class Department{
  String key;
  String name;
  String des;
  Department(this.des,this.name);
  Department.fromSnapshot(DataSnapshot snapshot)
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