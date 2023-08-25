import 'package:reaction_askany/models/emotions.dart';

class ChatMessage {
  String? message;
  bool? reciever;
  Emotions? emotions;
  ChatMessage({this.message, this.reciever, this.emotions});
}
