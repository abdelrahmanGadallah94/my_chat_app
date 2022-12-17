import 'package:cloud_firestore/cloud_firestore.dart';
import '../presentation/utilities/app_string.dart';

Stream<QuerySnapshot> readMessageAndShowItInMyScreen()  {
  CollectionReference message = FirebaseFirestore.instance.collection(AppString.messageStored);
  return message.orderBy(AppString.time,descending: true).snapshots();
}