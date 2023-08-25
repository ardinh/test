import 'package:haha/models/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:reaction_askany/models/emotions.dart';
import 'package:reaction_askany/models/reaction_box_paramenters.dart';
import 'package:reaction_askany/reaction_askany.dart';

class MessageWidget extends StatefulWidget {
  final ChatMessage? chatMessage;
  final Function(TapDownDetails)? onTap;
  final Emotions? emotions;
  const MessageWidget({Key? key, this.chatMessage, this.onTap, this.emotions})
      : super(key: key);

  @override
  _MessageWidgetState createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTapDown: widget.onTap,
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Align(
          alignment: (!widget.chatMessage!.reciever!
              ? Alignment.topLeft
              : Alignment.topRight),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ReactionWrapper(
                  boxParamenters: ReactionBoxParamenters(
                    brightness: Brightness.light,
                    iconSize: 26,
                    iconSpacing: 10,
                    paddingHorizontal: 30,
                    radiusBox: 40,
                    quantityPerPage: 6,
                  ),
                  buttonReaction: const Padding(
                    padding: EdgeInsets.only(top: 2.0),
                    child: Icon(
                      Icons.face_outlined,
                      size: 20.0,
                      color: Colors.grey,
                    ),
                  ),
                  doubleTapLabel: "Choose Reaction",
                  initialEmotion: widget.emotions,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 20.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent.shade100,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(widget.chatMessage!.message!),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
