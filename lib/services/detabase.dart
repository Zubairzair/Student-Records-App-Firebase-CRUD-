import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lab9/person.dart';

class DetabaseMethod {
  Future addstudentrecord(Map<String, dynamic> Studentmap, String Id) async {
    return await FirebaseFirestore.instance
        .collection('Student')
        .doc(Id)
        .set(Studentmap);
  }

  Future<Stream<QuerySnapshot>> getstudentrecord()async{
    return await FirebaseFirestore.instance.collection("student").snapshots();
  }
Future UpdateRecord(String id, Map<String,dynamic>UpdateMap)async
{
  return await FirebaseFirestore.instance.collection("Student").doc(id).update(UpdateMap);
}
  Future DeleteRecord(String id)async
  {
    return await FirebaseFirestore.instance.collection("Student").doc(id);
  }

}
