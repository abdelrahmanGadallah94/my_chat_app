import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../controller/read_messages.dart';
import '../../controller/scrolling_list_view.dart';
import '../../controller/store_messages_in_firestore.dart';
import '../../modal/messages_modal.dart';
import '../components/chat_bubble.dart';
import '../utilities/app_colors.dart';
import '../utilities/app_string.dart';

// ignore: must_be_immutable
class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  TextEditingController controller = TextEditingController();

  ScrollController listControl = ScrollController();

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.kSecondaryTextColor,
        title: const Text(AppString.chats),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: readMessageAndShowItInMyScreen(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MessagesModal> listOfMessages = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              listOfMessages
                  .add(MessagesModal.fromJson(snapshot.data!.docs[i]));
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: listControl,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return listOfMessages[index].id == email
                          ? ChatBubble(
                              color: AppColors.kSignInColor,
                              bottomRight: const Radius.circular(20),
                              bottomLeft: const Radius.circular(0),
                              message: snapshot.data!.docs[index]
                                  [AppString.message],
                              alignment: Alignment.centerLeft,
                            )
                          : ChatBubble(
                              color: AppColors.kSecondaryTextColor,
                              bottomRight: const Radius.circular(0),
                              bottomLeft: const Radius.circular(20),
                              message: snapshot.data!.docs[index]
                                  [AppString.message],
                              alignment: Alignment.centerRight,
                            );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 2.h,
                    horizontal: 2.w,
                  ),
                  child: Form(
                    key: formKey,
                    child: TextFormField(
                      validator: (data) {
                        if (data!.isEmpty) {
                          return "";
                        }
                      },
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: AppString.sendMessage,
                        suffixIcon: IconButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              await storeMessages(
                                  message: controller.text,
                                  email: email as String);
                              controller.clear();
                              scrollDownListView(listControl);
                            }
                          },
                          icon: const Icon(Icons.send),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.kSignInColor),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: Text(AppString.loading),
            );
          }
        },
      ),
    );
  }
}
