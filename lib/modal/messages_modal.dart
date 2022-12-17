import '../presentation/utilities/app_string.dart';

class MessagesModal{
  String message;
  String id;
  MessagesModal({required this.message,required this.id});

  factory MessagesModal.fromJson(json){
    return MessagesModal(
        message: json[AppString.message],
        id: json[AppString.id],
    );
  }
}