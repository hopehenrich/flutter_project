import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_ecom_app/chatapp/chatroom.dart';

import '../model/messsage_model.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ListView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemCount: allChats.length,
          itemBuilder: (context, index) {
            final allChat = allChats[index];
            return Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(allChat.avatar),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) {
                        return ChatRoom(
                          user: allChat.sender,
                        );
                      }));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(allChat.sender.name),
                        Text("${allChat.text}")
                      ],
                    ),
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      allChat.unreadCount == 0
                          ? const Icon(Icons.done_all)
                          : CircleAvatar(
                              radius: 8,
                              backgroundColor: const Color(0xff5E2B9F),
                              child: Text(
                                allChat.unreadCount.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        allChat.time,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      )
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
