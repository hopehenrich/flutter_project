import 'package:flutter/material.dart';
import 'package:my_ecom_app/model/messsage_model.dart';
import 'package:my_ecom_app/model/user_model.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({super.key, required this.user});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
  final User user;
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: const Color(0xff5E2B9F),
        elevation: 0,
        centerTitle: false,
        title: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(widget.user.avatar),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.user.name),
                const Text(
                  'Online',
                  style: TextStyle(color: Color(0xffD9D9D9), fontSize: 14),
                )
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.videocam,
                color: Colors.white,
                size: 20,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.call,
                color: Colors.white,
                size: 20,
              ))
        ],
      ),
      backgroundColor: const Color(0xff5E2B9F),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: const BoxDecoration(
                    color: Color(0xffD9D9D9),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  child: ListView.builder(
                      reverse: true,
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final message = messages[index];
                        bool isMe = message.sender.id == currentUser.id;
                        return Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: isMe
                                      ? MainAxisAlignment.end
                                      : MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    if (!isMe)
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundImage:
                                            AssetImage(widget.user.avatar),
                                      ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        padding: const EdgeInsets.all(10),
                                        constraints: BoxConstraints(
                                            maxWidth: width * 0.6),
                                        decoration: BoxDecoration(
                                            color: isMe
                                                ? const Color(0xff5E2B9F)
                                                : const Color.fromARGB(
                                                    255, 195, 142, 231),
                                            borderRadius: BorderRadius.only(
                                                topLeft:
                                                    const Radius.circular(16),
                                                topRight:
                                                    const Radius.circular(16),
                                                bottomLeft: Radius.circular(
                                                    isMe ? 12 : 0),
                                                bottomRight: Radius.circular(
                                                    isMe ? 0 : 12))),
                                        child: Text(
                                          messages[index].text.toString(),
                                          style: const TextStyle(
                                              color: Colors.white),
                                        )),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    mainAxisAlignment: isMe
                                        ? MainAxisAlignment.end
                                        : MainAxisAlignment.start,
                                    children: [
                                      if (!isMe)
                                        const SizedBox(
                                          width: 40,
                                        ),
                                      const Icon(
                                        Icons.done_all,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        message.time,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ));
                      }),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              color: const Color(0xffD9D9D9),
              height: 100,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    height: 60,
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.emoji_emotions_outlined,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Type your text...",
                              hintStyle: TextStyle(
                                color: Colors.grey[600],
                              )),
                        )),
                        Icon(
                          Icons.attach_file,
                          color: Colors.grey[600],
                        ),
                      ],
                    ),
                  )),
                  const SizedBox(
                    width: 12,
                  ),
                  CircleAvatar(
                    backgroundColor: const Color(0xff5E2B9F),
                    child: Icon(
                      Icons.mic,
                      color: Colors.grey[200],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
