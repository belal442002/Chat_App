import 'package:chat_app/components/custom_chat_buble.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  static const String id = 'ChatPage';

  String text = "";
  CollectionReference messages =
      FirebaseFirestore.instance.collection(KMessagesCollection);
  final textEditingController = TextEditingController();
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy(KCreateTime, descending: true).snapshots(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            List<Message> messageList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messageList.add(Message.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
              appBar: AppBar(
                backgroundColor: KPrimaryColor,
                automaticallyImplyLeading: false,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      KLogo,
                      height: 50,
                    ),
                    const Text('Chat'),
                  ],
                ),
                centerTitle: true,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        reverse: true,
                        controller: scrollController,
                        itemCount: messageList.length,
                        itemBuilder: (context, index) {
                          return (email == messageList[index].id)
                              ? CustomChatBuble(message: messageList[index])
                              : CustomFriendChatBuble(
                                  message: messageList[index]);
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: textEditingController,
                      onChanged: (value) {
                        text = value;
                      },
                      onSubmitted: (data) {
                        messages.add({
                          KMessage: data,
                          KCreateTime: DateTime.now(),
                          'id': email,
                        });
                        textEditingController.clear();
                        scrollController.animateTo(
                          0,
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastOutSlowIn,
                        );
                      },
                      decoration: InputDecoration(
                          suffix: IconButton(
                            onPressed: () {
                              if (text.isNotEmpty) {
                                messages.add({
                                  KMessage: text,
                                  KCreateTime: DateTime.now(),
                                  'id': email,
                                });
                                textEditingController.clear();
                                scrollController.animateTo(
                                  0,
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.fastOutSlowIn,
                                );
                              }
                            },
                            icon: const Icon(
                              Icons.send,
                              color: KPrimaryColor,
                            ),
                          ),
                          hintText: 'send message',
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: KPrimaryColor,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          )),
                    ),
                  )
                ],
              ),
            );
          } else {
            return const Text('Loading...');
          }
        }));
  }
}
