import 'package:cloud_firestore/cloud_firestore.dart';

import '../presentation/utilities/app_string.dart';

 storeMessages({required String message,required String email}) async {

  CollectionReference messages = FirebaseFirestore.instance.collection(AppString.messageStored);

  return messages.add({
    AppString.message: message,
    AppString.id: email,
    AppString.time: DateTime.now(),
  });
}

