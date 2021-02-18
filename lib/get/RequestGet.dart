import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class RequestGet extends GetxController {
  var data;
  var department=''.obs;
  final values = GetStorage();

  @override
  void onInit() {
    super.onInit();
    String dateFormat = DateFormat('dd/MM/yyyy').format(DateTime.now());
    department="${values.read('department')}".obs;
    data= FirebaseDatabase.instance.reference().child("requests").child(dateFormat);

  }
}
