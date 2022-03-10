class Chat {
  final String sender;
  final String message;
  final String receiver;
  final double time;
  final bool isRead;

  Chat({
    required this.sender,
    required this.receiver,
    required this.message,
    required this.time,
    required this.isRead,
  });
  Map<String, dynamic> toJson() => {
        'sender': sender,
        'receiver': receiver,
        'message': message,
        'time': time,
        'isRead': isRead,
      };
}
