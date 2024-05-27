import 'package:chatapp/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        //get each user
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  //send Message
  Future<void> sendMessage(String recieverID, String message) async {
    final String curentUserID = _auth.currentUser!.uid;
    final String curentUserEmail = _auth.currentUser!.email!;

    final Timestamp timestamp = Timestamp.now();

    Message newMessage = Message(
        senderID: curentUserID,
        senderEmail: curentUserEmail,
        recieverID: recieverID,
        message: message,
        timestamp: timestamp);

    List<String> ids = [recieverID, curentUserID];
    ids.sort();

    // Create ch:at roomid
    String chatRoomId = ids.join('_');
    // print("send: $chatRoomId");
    // add new message
    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .add(newMessage.toMap());
  }

  Stream<QuerySnapshot> getMessages(String userID, String otherUserID) {
    List<String> ids = [userID, otherUserID];
    ids.sort();

    // Create chat roomid
    String chatRoomId = ids.join('_');
    // print("get: $chatRoomId");
    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
