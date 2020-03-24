import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testlogin/models/brew.dart';
import 'package:testlogin/models/user.dart';
class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });
  
  //collection reference
  final CollectionReference testCollection = Firestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async {
    return await testCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  //brew list from snapshop
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Brew(
        name: doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? 0,
        sugars: doc.data['sugars'] ?? '0',
        
      );
    }).toList();
  }
  
  //userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      sugars: snapshot.data['sugars'],
      strength: snapshot.data['strength']
    );
  }

  //get brews stream
  Stream<List<Brew>> get brews {
    return testCollection.snapshots()
      .map(_brewListFromSnapshot);
  }

  //get user doc stream
  Stream<UserData> get userData {
    return testCollection.document(uid).snapshots()
      .map(_userDataFromSnapshot);
  }

}