import 'package:ATMS/get/ValidationGet.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  final validation = ValidationGet();

  testWidgets('validation name', (WidgetTester tester) async {
    validation.nameEmployeeValidation("moataz");
    try{
      expect(validation.nameEmployeeData.value, "moataz");
      expect(validation.nameEmployeeData.error, null);
      print("passed 1");
    }catch(e){
      print("not passed 1");
    }
    validation.nameEmployeeValidation("moz");
    try{
    expect(validation.nameEmployeeData.value, null);
      expect(validation.nameEmployeeData.error, "Enter valid name");
      print("passed 2");
    }catch(e){
      print("not passed 2");
    }
    validation.nameEmployeeValidation("null");
    try{
      expect(validation.nameEmployeeData.value, null);
      expect(validation.nameEmployeeData.error, "Enter valid name");
      print("passed 3");
    }catch(e){
      print("not passed 3");
    }
    validation.nameEmployeeValidation("moataz mohamed");
    try{
      expect(validation.nameEmployeeData.value, "moataz mohamed");
      expect(validation.nameEmployeeData.error, null);
      print("passed 4");
    }catch(e){
      print("not passed 4");
    }
    validation.nameEmployeeValidation("moataz mohamed saad");
    try{
      expect(validation.nameEmployeeData.value, "moataz mohamed saad");
      expect(validation.nameEmployeeData.error, null);
      print("passed 5");
    }catch(e){
      print("not passed 5");
    }
    validation.nameEmployeeValidation("123456");
    try{
      expect(validation.nameEmployeeData.value, null);
      expect(validation.nameEmployeeData.error, "Enter valid name");
      print("passed 6");
    }catch(e){
      print("not passed 6");
    }
    validation.nameEmployeeValidation("");
    try{
      expect(validation.nameEmployeeData.value, null);
      expect(validation.nameEmployeeData.error, "Enter valid name");
      print("passed 7");
    }catch(e){
      print("not passed 7");
    }
    validation.nameEmployeeValidation("motaz");
    try{
      expect(validation.nameEmployeeData.value, null);
      expect(validation.nameEmployeeData.error, "Enter valid name");
      print("passed 8");
    }catch(e){
      print("not passed 8");
    }
    validation.nameEmployeeValidation(" motaz ");
    try{
      expect(validation.nameEmployeeData.value, null);
      expect(validation.nameEmployeeData.error, "Enter valid name");
      print("passed 9");
    }catch(e){
      print("not passed 9");
    }
    validation.nameEmployeeValidation(" motoaz ");
    try{
      expect(validation.nameEmployeeData.value, " motoaz ");
      expect(validation.nameEmployeeData.error, null);
      print("passed 10");
    }catch(e){
      print("not passed 10");
    }
  });
  // testWidgets('validation id', (WidgetTester tester) async {
  //   // final controller =await Get.put(ValidationGet());
  //   validation.onInit();
  //   validation.idEmployeeValidation("123456",false);
  //   try{
  //     print(validation.idEmployeeData.value);
  //     print(validation.idEmployeeData.error);
  //     expect(validation.idEmployeeData.value, "123456");
  //     expect(validation.idEmployeeData.error, null);
  //     print("passed 1");
  //   }catch(e){
  //     print("not passed 1");
  //   }
    // validation.idEmployeeValidation("123 456",false);
    // try{
    //   expect(validation.idEmployeeData.value, "123 456");
    //   expect(validation.idEmployeeData.error, null);
    //   print("passed 2");
    // }catch(e){
    //   print("not passed 2");
    // }
    // validation.idEmployeeValidation("1234567",false);
    // try{
    //   expect(validation.idEmployeeData.value, "1234567");
    //   expect(validation.idEmployeeData.error, null);
    //   print("passed 3");
    // }catch(e){
    //   print("not passed 3");
    // }
    // validation.idEmployeeValidation("1 23 45 67",false);
    // try{
    //   expect(validation.idEmployeeData.value, "1 23 45 67");
    //   expect(validation.idEmployeeData.error, null);
    //   print("passed 4");
    // }catch(e){
    //   print("not passed 4");
    // }
    // validation.idEmployeeValidation("12345",false);
    // try{
    //   expect(validation.idEmployeeData.value, null);
    //   expect(validation.idEmployeeData.error, "Enter valid id");
    //   print("passed 5");
    // }catch(e){
    //   print("not passed 5");
    // }
    // validation.idEmployeeValidation("1234",false);
    // try{
    //   expect(validation.idEmployeeData.value, null);
    //   expect(validation.idEmployeeData.error, "Enter valid id");
    //   print("passed 6");
    // }catch(e){
    //   print("not passed 6");
    // }
    // validation.idEmployeeValidation("123",false);
    // try{
    //   expect(validation.idEmployeeData.value, null);
    //   expect(validation.idEmployeeData.error, "Enter valid id");
    //   print("passed 7");
    // }catch(e){
    //   print("not passed 7");
    // }
    // validation.idEmployeeValidation("12",false);
    // try{
    //   expect(validation.idEmployeeData.value, null);
    //   expect(validation.idEmployeeData.error, "Enter valid id");
    //   print("passed 8");
    // }catch(e){
    //   print("not passed 8");
    // }
    // validation.idEmployeeValidation("1",false);
    // try{
    //   expect(validation.idEmployeeData.value, null);
    //   expect(validation.idEmployeeData.error, "Enter valid id");
    //   print("passed 9");
    // }catch(e){
    //   print("not passed 9");
    // }
    // validation.idEmployeeValidation("",false);
    // try{
    //   expect(validation.idEmployeeData.value, null);
    //   expect(validation.idEmployeeData.error, "Enter valid id");
    //   print("passed 10");
    // }catch(e){
    //   print("not passed 10");
    // }
    // validation.idEmployeeValidation("1234hh",false);
    // try{
    //   expect(validation.idEmployeeData.value, null);
    //   expect(validation.idEmployeeData.error, "Enter valid id");
    //   print("passed 11");
    // }catch(e){
    //   print("not passed 11");
    // }
    // validation.idEmployeeValidation("123 4 hh",false);
    // try{
    //   expect(validation.idEmployeeData.value, null);
    //   expect(validation.idEmployeeData.error, "Enter valid id");
    //   print("passed 12");
    // }catch(e){
    //   print("not passed 12");
    // }
  // });

  testWidgets('validation password', (WidgetTester tester) async {
    validation.passwordEmployeeValidation("sQ1.aaaa");
    try{
      expect(validation.passwordEmployeeData.value, "sQ1.aaaa");
      expect(validation.passwordEmployeeData.error, null);
      print("passed 1");
    }catch(e){
      print("not passed 1");
    }
    validation.passwordEmployeeValidation("sQ1.1111");
    try{
      expect(validation.passwordEmployeeData.value, "sQ1.1111");
      expect(validation.passwordEmployeeData.error, null);
      print("passed 2");
    }catch(e){
      print("not passed 2");
    }
    validation.passwordEmployeeValidation("sQ1.WWWW");
    try{
      expect(validation.passwordEmployeeData.value, "sQ1.WWWW");
      expect(validation.passwordEmployeeData.error, null);
      print("passed 3");
    }catch(e){
      print("not passed 3");
    }
    validation.passwordEmployeeValidation("sQ1.++++");
    try{
      expect(validation.passwordEmployeeData.value, "sQ1.++++");
      expect(validation.passwordEmployeeData.error, null);
      print("passed 4");
    }catch(e){
      print("not passed 4");
    }
    validation.passwordEmployeeValidation("sQ1. ++++");
    try{
      expect(validation.passwordEmployeeData.value, "sQ1. ++++");
      expect(validation.passwordEmployeeData.error, null);
      print("passed 5");
    }catch(e){
      print("not passed 5");
    }
    validation.passwordEmployeeValidation("sQ1.dddd ");
    try{
      expect(validation.passwordEmployeeData.value, "sQ1.dddd ");
      expect(validation.passwordEmployeeData.error, null);
      print("passed 6");
    }catch(e){
      print("not passed 6");
    }
    validation.passwordEmployeeValidation("sQ1.");
    try{
      expect(validation.passwordEmployeeData.value, null);
      expect(validation.passwordEmployeeData.error, "Enter valid password");
      print("passed 7");
    }catch(e){
      print("not passed 7");
    }
    validation.passwordEmployeeValidation("sQ1tttt");
    try{
      expect(validation.passwordEmployeeData.value, null);
      expect(validation.passwordEmployeeData.error, "Enter valid password");
      print("passed 8");
    }catch(e){
      print("not passed 8");
    }
    validation.passwordEmployeeValidation("sQ.yyyy");
    try{
      expect(validation.passwordEmployeeData.value, null);
      expect(validation.passwordEmployeeData.error, "Enter valid password");
      print("passed 9");
    }catch(e){
      print("not passed 9");
    }
    validation.passwordEmployeeValidation("s1.oooo");
    try{
      expect(validation.passwordEmployeeData.value, null);
      expect(validation.passwordEmployeeData.error, "Enter valid password");
      print("passed 10");
    }catch(e){
      print("not passed 10");
    }
    validation.passwordEmployeeValidation("T1.oooo");
    try{
      expect(validation.passwordEmployeeData.value, null);
      expect(validation.passwordEmployeeData.error, "Enter valid password");
      print("passed 11");
    }catch(e){
      print("not passed 11");
    }
    validation.passwordEmployeeValidation("sQ 1.dddd");
    try{
      expect(validation.passwordEmployeeData.value, "sQ 1.dddd");
      expect(validation.passwordEmployeeData.error, null);
      print("passed 12");
    }catch(e){
      print("not passed 12");
    }
  });

  testWidgets('validation phone number', (WidgetTester tester) async {
    validation.phoneNumberValidation("01289555089");
    try{
      expect(validation.phoneNumberData.value, "01289555089");
      expect(validation.phoneNumberData.error, null);
      print("passed 1");
    }catch(e){
      print("not passed 1");
    }
    validation.phoneNumberValidation("01289555 089");
    try{
      expect(validation.phoneNumberData.value, "01289555089");
      expect(validation.phoneNumberData.error, null);
      print("passed 2");
    }catch(e){
      print("not passed 2");
    }
    validation.phoneNumberValidation("01289555089 ");
    try{
      expect(validation.phoneNumberData.value, "01289555089");
      expect(validation.phoneNumberData.error, null);
      print("passed 3");
    }catch(e){
      print("not passed 3");
    }
    validation.phoneNumberValidation(" 01289555089");
    try{
      expect(validation.phoneNumberData.value, "01289555089");
      expect(validation.phoneNumberData.error, null);
      print("passed 4");
    }catch(e){
      print("not passed 4");
    }
    validation.phoneNumberValidation(" 01289555089 ");
    try{
      expect(validation.phoneNumberData.value, "01289555089");
      expect(validation.phoneNumberData.error, null);
      print("passed 5");
    }catch(e){
      print("not passed 5");
    }
    validation.phoneNumberValidation("+201289555089");
    try{
      expect(validation.phoneNumberData.value, null);
      expect(validation.phoneNumberData.error, "Enter valid phone number");
      print("passed 6");
    }catch(e){
      print("not passed 6");
    }
    validation.phoneNumberValidation("0128955jj5089");
    try{
      expect(validation.phoneNumberData.value, null);
      expect(validation.phoneNumberData.error, "Enter valid phone number");
      print("passed 7");
    }catch(e){
      print("not passed 7");
    }
    validation.phoneNumberValidation("012895550");
    try{
      expect(validation.phoneNumberData.value, null);
      expect(validation.phoneNumberData.error, "Enter valid phone number");
      print("passed 8");
    }catch(e){
      print("not passed 8");
    }
    validation.phoneNumberValidation("+2012895550");
    try{
      expect(validation.phoneNumberData.value, null);
      expect(validation.phoneNumberData.error, "Enter valid phone number");
      print("passed 9");
    }catch(e){
      print("not passed 9");
    }
  });

  testWidgets('validation Department', (WidgetTester tester) async {
    validation.nameDepartmentValidation("software");
    try{
      expect(validation.nameDepartmentData.value, "software");
      expect(validation.nameDepartmentData.error, null);
      print("passed 1");
    }catch(e){
      print("not passed 1");
    }
    validation.nameDepartmentValidation("software ");
    try{
      expect(validation.nameDepartmentData.value, "software ");
      expect(validation.nameDepartmentData.error, null);
      print("passed 2");
    }catch(e){
      print("not passed 2");
    }
    validation.nameDepartmentValidation(" software");
    try{
      expect(validation.nameDepartmentData.value, " software");
      expect(validation.nameDepartmentData.error, null);
      print("passed 3");
    }catch(e){
      print("not passed 3");
    }
    validation.nameDepartmentValidation(" software ");
    try{
      expect(validation.nameDepartmentData.value, " software ");
      expect(validation.nameDepartmentData.error, null);
      print("passed 4");
    }catch(e){
      print("not passed 4");
    }
    validation.nameDepartmentValidation("softw");
    try{
      expect(validation.nameDepartmentData.value, null);
      expect(validation.nameDepartmentData.error, "Enter valid data");
      print("passed 5");
    }catch(e){
      print("not passed 5");
    }
    validation.nameDepartmentValidation("softw ");
    try{
      expect(validation.nameDepartmentData.value, "softw ");
      expect(validation.nameDepartmentData.error, null);
      print("passed 6");
    }catch(e){
      print("not passed 6");
    }
    validation.nameDepartmentValidation("soft");
    try{
      expect(validation.nameDepartmentData.value, null);
      expect(validation.nameDepartmentData.error, "Enter valid data");
      print("passed 7");
    }catch(e){
      print("not passed 7");
    }
    validation.nameDepartmentValidation("");
    try{
      expect(validation.nameDepartmentData.value, null);
      expect(validation.nameDepartmentData.error, "Enter valid data");
      print("passed 8");
    }catch(e){
      print("not passed 8");
    }
  });

  testWidgets('validation description Department', (WidgetTester tester) async {
    validation.descriptionDepartmentValidation("software");
    try{
      expect(validation.descriptionDepartmentData.value, "software");
      expect(validation.descriptionDepartmentData.error, null);
      print("passed 1");
    }catch(e){
      print("not passed 1");
    }
    validation.descriptionDepartmentValidation("software ");
    try{
      expect(validation.descriptionDepartmentData.value, "software ");
      expect(validation.descriptionDepartmentData.error, null);
      print("passed 2");
    }catch(e){
      print("not passed 2");
    }
    validation.descriptionDepartmentValidation(" software");
    try{
      expect(validation.descriptionDepartmentData.value, " software");
      expect(validation.descriptionDepartmentData.error, null);
      print("passed 3");
    }catch(e){
      print("not passed 3");
    }
    validation.descriptionDepartmentValidation(" software ");
    try{
      expect(validation.descriptionDepartmentData.value, " software ");
      expect(validation.descriptionDepartmentData.error, null);
      print("passed 4");
    }catch(e){
      print("not passed 4");
    }
    validation.descriptionDepartmentValidation("softw");
    try{
      expect(validation.descriptionDepartmentData.value, null);
      expect(validation.descriptionDepartmentData.error, "Enter valid data");
      print("passed 5");
    }catch(e){
      print("not passed 5");
    }
    validation.descriptionDepartmentValidation("softw ");
    try{
      expect(validation.descriptionDepartmentData.value, "softw ");
      expect(validation.descriptionDepartmentData.error, null);
      print("passed 6");
    }catch(e){
      print("not passed 6");
    }
    validation.descriptionDepartmentValidation("soft");
    try{
      expect(validation.descriptionDepartmentData.value, null);
      expect(validation.descriptionDepartmentData.error, "Enter valid data");
      print("passed 7");
    }catch(e){
      print("not passed 7");
    }
    validation.descriptionDepartmentValidation("");
    try{
      expect(validation.descriptionDepartmentData.value, null);
      expect(validation.descriptionDepartmentData.error, "Enter valid data");
      print("passed 8");
    }catch(e){
      print("not passed 8");
    }
  });
}
