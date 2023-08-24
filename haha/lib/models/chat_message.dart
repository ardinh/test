class ChatMessage {
  final String sender;
  final String text;
  String? reaction;

  ChatMessage({required this.sender, required this.text, this.reaction});
}
