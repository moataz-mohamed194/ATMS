import 'package:ATMS/models/Validation.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';


class ValidationGet extends GetxController {
  List ids;
  @override
  Future<void> onInit() async {
    super.onInit();
    ids =((await FirebaseDatabase.instance.reference()
        .child('Employee').once()).value).keys.toList();
    print("ids");

  }
    ValidationItem nameEmployeeData = new ValidationItem(null, null);
  ValidationItem get nameEmployee => nameEmployeeData;
  void nameEmployeeValidation(String value){
    String value2=value.replaceAll(" ", "");
    bool departmentValid = RegExp("([a-z])").hasMatch(value);
    if (departmentValid == true && value2.length > 5) {
      nameEmployeeData = ValidationItem(value, null);
    } else {
      nameEmployeeData = ValidationItem(null, "Enter valid name");
    }
    update();
  }

  ValidationItem idEmployeeData = new ValidationItem(null, null);
  ValidationItem get idEmployee => idEmployeeData;
  void idEmployeeValidation(String value,bool add){
    String value2=value.replaceAll(" ", "");
    bool myInt=false;
    try{
      int.parse(value2);
      myInt=true;
    }catch(e){
      myInt=false;
    }
    bool departmentValid = RegExp("([1-9])").hasMatch(value);
    print(ids);
    if(ids.contains(value) && add==true){
      idEmployeeData = ValidationItem(null, "Enter new id");
    }
    else if (departmentValid == true && value2.length > 5 &&myInt==true) {
      idEmployeeData = ValidationItem(value, null);
    } else {
      idEmployeeData = ValidationItem(null, "Enter valid id");
    }
    update();
  }

  ValidationItem passwordEmployeeData = new ValidationItem(null, null);
  ValidationItem get passwordEmployee => passwordEmployeeData;
  void passwordEmployeeValidation(String value){
    bool passwordValid0 = RegExp(r"[a-z]").hasMatch(value);
    bool passwordValid1 = RegExp(r"[A-Z]").hasMatch(value);
    bool passwordValid2 = RegExp(r"[0-9]").hasMatch(value);
    bool passwordValid3 = RegExp(r"[.!#$%&'*+-/=?^_`{|}~]").hasMatch(value);
    String value2=value.replaceAll(" ", "");
    if (passwordValid0 == true &&
        passwordValid1 == true &&
        passwordValid2 == true &&
        passwordValid3 == true && value2.length >= 8) {
      passwordEmployeeData = ValidationItem(value, null);
    } else {
      passwordEmployeeData = ValidationItem(null, "Enter valid password");
    }
    update();
  }
  ValidationItem oldPasswordData = new ValidationItem(null, null);
  ValidationItem get oldPassword => oldPasswordData;
  void validationOldPassword(String value,String old){
    if(old==value){
      oldPasswordData = ValidationItem(value, null);
    }else{
      oldPasswordData = ValidationItem(null, "is not old password");
    }
    update();
  }
  ValidationItem repeatPasswordData = new ValidationItem(null, null);
  ValidationItem get repeatPassword => repeatPasswordData;
  void validationRepeatPassword(String value){
    if(passwordEmployee.value==value){
      repeatPasswordData = ValidationItem(value, null);
    }else{
      repeatPasswordData = ValidationItem(null, "not match");
    }
    update();

  }


  ValidationItem phoneNumberData = new ValidationItem(null, null);
  ValidationItem get phoneNumber => phoneNumberData;
  void phoneNumberValidation(String value){
    String value2=value.replaceAll(" ", "");
    bool myInt=false;
    try{
      int.parse(value2);
      myInt=true;
    }catch(e){
      myInt=false;
    }
    bool departmentValid = RegExp("([1-9])").hasMatch(value2);
    if (departmentValid == true &&value2[0]=="0"&&value2[1]=="1"&& value2.length > 10&&myInt==true) {
      phoneNumberData = ValidationItem(value2, null);
    } else {
      phoneNumberData = ValidationItem(null, "Enter valid phone number");
    }
    update();
  }

  bool get boolAddEmployee{
    if(nameEmployee.value!=null&&idEmployee.value!=null&&passwordEmployee.value!=null){
      return true;
    }else{
      return false;
    }
  }

  ValidationItem nameDepartmentData = new ValidationItem(null, null);
  ValidationItem get nameDepartment => nameDepartmentData;
  void nameDepartmentValidation(String value){
    bool departmentValid = RegExp("([a-z])").hasMatch(value);
    if (departmentValid == true && value.length > 5) {
      nameDepartmentData = ValidationItem(value, null);
    } else {
      nameDepartmentData = ValidationItem(null, "Enter valid data");
    }
    update();
  }

  ValidationItem descriptionDepartmentData = new ValidationItem(null, null);
  ValidationItem get descriptionDepartment => descriptionDepartmentData;
  void descriptionDepartmentValidation(String value){
    bool departmentValid = RegExp("([a-z])").hasMatch(value);
    if (departmentValid == true && value.length > 5) {
      descriptionDepartmentData = ValidationItem(value, null);
    } else {
      descriptionDepartmentData = ValidationItem(null, "Enter valid data");
    }
    update();
  }

  bool get boolAddDepartment{
    if(nameDepartment.value!=null&&descriptionDepartment.value!=null){
      return true;
    }else{
      return false;
    }
  }

  bool get boolLogin{
    if(idEmployee.value!=null&&passwordEmployee.value!=null){
      return true;
    }else{
      return false;
    }
  }

  ValidationItem reasonData = new ValidationItem(null, null);
  ValidationItem get reason => reasonData;
  void reasonValidation(String value){
    if(value.length>0){
      reasonData=ValidationItem(value, null);
    }else{
      reasonData=ValidationItem(null, "enter reason");
    }
    update();
  }
  bool get sendReason{
    if(reasonData.value!=null){
      return true;
    }else{
      return false;
    }
  }

}