import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lab9/person.dart' show Person;
import 'package:lab9/services/detabase.dart';

class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  Stream? Studentstream;
  getstudentload() async {
    Studentstream = await DetabaseMethod().getstudentrecord();
    setState(() {});
  }

  TextEditingController Namecontroler = new TextEditingController();
  TextEditingController FNamecontroler = new TextEditingController();
  TextEditingController Agcontroler = new TextEditingController();
  TextEditingController Degreecontroler = new TextEditingController();
  TextEditingController Semestercontroler = new TextEditingController();
  TextEditingController CNICcontroler = new TextEditingController();
  TextEditingController Adresscontroler = new TextEditingController();
  TextEditingController Religioncontroler = new TextEditingController();

  @override
  void initState() {
    getstudentload();
    super.initState();
  }

  Widget Allstusentsdetails() {
    return StreamBuilder(
      stream: Studentstream,
      builder: (Context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.docs[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Name:" + ds["Name"],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Namecontroler.text=ds["Name"];
                                  FNamecontroler.text=ds["FName"];
                                  Agcontroler.text=ds["Ag"];
                                  Degreecontroler.text=ds["Degree"];
                                  Semestercontroler.text=ds["Semester"];
                                  CNICcontroler.text=ds[" CNIC"];
                                  Adresscontroler.text=ds["Adress"];
                                  Religioncontroler.text=ds["Religion"];
                                  EditStudentDetails(ds["id"]);
                                },
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.blueAccent,
                                ),
                              ),
                              GestureDetector(
                                  onTap: ()async{
                                    await DetabaseMethod().DeleteRecord(ds["id"]);
                                  },
                                  child: Icon(Icons.delete, color: Colors.blueAccent)),
                            ],
                          ),
                          Text(
                            "Father" + ds["FName"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.redAccent,
                            ),
                          ),
                          Text(
                            "Ag:" + ds["Ag"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.amber,
                            ),
                          ),
                          Text(
                            "Degree:" + ds["Degree"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Semester:" + ds["Semester"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.redAccent,
                            ),
                          ),
                          Text(
                            "CNIC:" + ds["CNIC"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.amber,
                            ),
                          ),
                          Text(
                            "Adress: " + ds["Adress"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Religion:" + ds["Religion"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
            : Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Person()),
            );
          },
          child: Icon(Icons.add),
        ),
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
                'record',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Column(children: [Expanded(child: Allstusentsdetails())]),
          ),
        ),
      ),
    );
  }
  Future EditStudentDetails(String id) => showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
      content: Container(
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  child: Icon(Icons.cancel),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  "Edit",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Details",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Text(
              'Name',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: Namecontroler,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.blue,
                ),
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Father Name',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: FNamecontroler,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.blue,
                ),
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'AG No',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: Agcontroler,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.blue,
                ),
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Degree',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: Degreecontroler,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.blue,
                ),
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Semester',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: Semestercontroler,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.blue,
                ),
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'CNIC',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: CNICcontroler,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.blue,
                ),
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Adress',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: Adresscontroler,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.blue,
                ),
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Religian',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: Religioncontroler,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.blue,
                ),
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            ElevatedButton(
              child: Text("Update"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent
                ),
                onPressed: ()async {
                  Map<String, dynamic> StudentUpdatedinfomap = {
                    "Name": Namecontroler.text,
                    "FName": FNamecontroler.text,
                    "Ag": Agcontroler.text,
                    "Degree": Degreecontroler.text,
                    "Semester": Semestercontroler.text,
                    "CNIC": CNICcontroler.text,
                    "Adress": Adresscontroler.text,
                    "Religion": Religioncontroler.text,
                    "id": id,
                  };
                  await DetabaseMethod().UpdateRecord(
                      id, StudentUpdatedinfomap).then((value) =>Navigator.pop(context));
                }

  ),
          ],
        ),
      ),
    ),
  );
}
