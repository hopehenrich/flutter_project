import 'package:my_ecom_app/model/user_model.dart';

class Message {
  final User sender;
  final String avatar;
  final String time;
  final int? unreadCount;
  final bool? isRead;
  final String? text;

  Message(
      {required this.sender,
      required this.avatar,
      required this.time,
      this.unreadCount,
      this.isRead,
      this.text});
}

final List<Message> allChats = [
  Message(
      sender: matesson,
      avatar: 'images/man.jpg',
      time: '01:25',
      unreadCount: 1,
      text: "typing..."),
  Message(
      sender: elvis,
      avatar: "images/man.jpg",
      time: '12:46',
      unreadCount: 1,
      text: "Wile I be in it?"),
  Message(
      sender: luck,
      avatar: "images/man.jpg",
      time: "05:26",
      unreadCount: 1,
      text: "That's so cute"),
  Message(
      sender: gracia,
      avatar: "images/man.jpg",
      time: "12:45",
      unreadCount: 2,
      text: "Let me see what i can do"),
  Message(
      sender: bienvenu,
      avatar: "images/man.jpg",
      time: "05:48",
      unreadCount: 0,
      text: "No i just wanted",
      isRead: true),
  Message(
      sender: carlos,
      avatar: "images/man.jpg",
      time: "06:58",
      unreadCount: 1,
      text: "You did what? ",
      isRead: false),
  Message(
      sender: matias,
      avatar: "images/man.jpg",
      time: "07:52",
      unreadCount: 0,
      text: "just signed up for a tutor ",
      isRead: true),
  Message(
      sender: eben,
      avatar: "images/man.jpg",
      time: "08:52",
      unreadCount: 2,
      text: "May i ask you something ",
      isRead: false),
  Message(
      sender: tim,
      avatar: "images/man.jpg",
      time: "80:57",
      unreadCount: 1,
      text: "You did nothing ",
      isRead: false),
];

final List<Message> messages = [
  Message(
      sender: matesson,
      avatar: 'images/man.jpg',
      time: '01:25',
      text: "typing..."),
  Message(
      sender: currentUser,
      avatar: 'images/man.jpg',
      time: '12:05',
      text: "I'm going home"),
  Message(
      sender: currentUser,
      avatar: 'images/man.jpg',
      time: '12:05',
      text: "See, I was right, this doesn't interrest me"),
  Message(
      sender: matesson,
      avatar: 'images/man.jpg',
      time: '11:58 PM',
      text: "I sign your paychecks"),
  Message(
      sender: matesson,
      avatar: 'images/man.jpg',
      time: '11:58 PM',
      text: "We thing we have nothing to talk about ?"),
  Message(
      sender: currentUser,
      avatar: 'images/man.jpg',
      time: '01:25',
      text:
          "Well, because I have no intention of being your office? 20 minutes ago"),
  Message(
      sender: matesson,
      avatar: 'images/man.jpg',
      time: '11:30 PM',
      text: "I was expecting you in my office 20minutes ago"),
];
