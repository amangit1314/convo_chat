class Chat {
  late final String sender;
  late final String message;
  late final String receiver;
  late final double time;
  final bool isRead;

  Chat({
    required this.sender,
    required this.receiver,
    required this.message,
    required this.time,
    required this.isRead,
  });
}
