import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uumlofoss/models/lofossf.dart';
import 'package:uumlofoss/models/lofossf.dart';
import 'package:uumlofoss/models/user.dart';



class DatabaseService {
  
 final String uid;
 DatabaseService({ this.uid });

  // collection reference

  final CollectionReference uumlofossCollection = Firestore.instance.collection('uumlofossfound');



  Future updateUserData(String item, String color, String wherefound, String datefound)async{
    return await uumlofossCollection.document(uid).setData({
      'item':item,
      'color': color,
      'wherefound': wherefound,
      'datefound': datefound,
      
      
    });
  }

 


  // lofossf list from snapshot

  List<Lofossf> _lofossListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return Lofossf(
        item: doc.data['item'] ?? '',
        color: doc.data['color'] ?? '',
        wherefound: doc.data['wherefound'] ?? '',
        datefound: doc.data['datefound'] ?? '', 

      );
    }).toList();
  }

  // userData from snapshot

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid:uid,
      item: snapshot.data['item'],
      color: snapshot.data['color'],
      wherefound: snapshot.data['wherefound'],
      datefound: snapshot.data['datefound'],
    );
  }







// get uumlofossfound stream

Stream <List<Lofossf>> get uumlofossfound{
  return uumlofossCollection.snapshots()
  .map(_lofossListFromSnapshot);
}




// get user doc stream

Stream<UserData> get userData {
  return uumlofossCollection.document(uid).snapshots()
  .map(_userDataFromSnapshot);
}

}
