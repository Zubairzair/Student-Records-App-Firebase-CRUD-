import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lab9/services/detabase.dart';
import 'package:random_string/random_string.dart';

class Person extends StatefulWidget {
  const Person({super.key});

  @override
  State<Person> createState() => _PersonState();
}

class _PersonState extends State<Person> {
  TextEditingController Namecontroler= new TextEditingController();
  TextEditingController FNamecontroler= new TextEditingController();
  TextEditingController Agcontroler= new TextEditingController();
  TextEditingController Degreecontroler= new TextEditingController();
  TextEditingController Semestercontroler= new TextEditingController();
  TextEditingController CNICcontroler= new TextEditingController();
  TextEditingController Adresscontroler= new TextEditingController();
  TextEditingController Religioncontroler= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Row(
            children: [
              Text(
                'person',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Firebase Form',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(child: Container(
          padding: EdgeInsets.only(top: 10,left: 20,right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('Name',     style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(border:Border.all(),borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: Namecontroler,
                    style:
                  TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,color: Colors.blue),  decoration: InputDecoration(border:
                  InputBorder.none),),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Father Name',     style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(border:Border.all(),borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: FNamecontroler,
                    style:
                  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,color: Colors.blue),  decoration: InputDecoration(border:
                  InputBorder.none),),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('AG No',     style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(border:Border.all(),borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: Agcontroler,
                    style:
                  TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,color: Colors.blue),  decoration: InputDecoration(border:
                  InputBorder.none),),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Degree',     style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(border:Border.all(),borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: Degreecontroler,
                    style:
                  TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,color: Colors.blue),  decoration: InputDecoration(border:
                  InputBorder.none),),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Semester',     style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(border:Border.all(),borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: Semestercontroler,
                    style:
                  TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,color: Colors.blue),  decoration: InputDecoration(border:
                  InputBorder.none),),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('CNIC',     style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(border:Border.all(),borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: CNICcontroler,
                    style:
                  TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,color: Colors.blue),  decoration: InputDecoration(border:
                  InputBorder.none),),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Adress',     style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(border:Border.all(),borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: Adresscontroler,
                    style:
                  TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,color: Colors.blue),  decoration: InputDecoration(border:
                  InputBorder.none),),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Religian',     style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(border:Border.all(),borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: Religioncontroler,
                    style:
                  TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,color: Colors.blue),  decoration: InputDecoration(border:
                  InputBorder.none),),
                ),
                SizedBox(
                  height: 20,
                ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent
              ),
                onPressed: ()async{
                String Id=randomAlphaNumeric(15);
                Map<String,dynamic> Studentinfomap={
                  "Name": Namecontroler.text,
                  "FName": FNamecontroler.text,
                  "Ag":Agcontroler.text,
                  "Degree": Degreecontroler.text,
                  "Semester": Semestercontroler.text,
                  "CNIC": CNICcontroler.text,
                  "Adress": Adresscontroler.text,
                  "Religion": Religioncontroler.text,
                  "id":Id
                };
                await DetabaseMethod().addstudentrecord(Studentinfomap, Id);
                Fluttertoast.showToast(msg: "Congredulations your record sucessfuly sabmitted");

                }, child: Text('Submit',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),))
              ],
            ),
          ),
        )),
      ),
    );
  }
}
