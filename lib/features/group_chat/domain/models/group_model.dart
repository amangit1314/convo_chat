class GroupModel {
  final String senderId;
  final String name;
  final String groupId;
  final String lastMessage;
  final String groupPic;
  final List<String> membersUid;
  final DateTime timeSent;

  GroupModel({
    required this.senderId,
    required this.name,
    required this.groupId,
    required this.lastMessage,
    required this.groupPic,
    required this.membersUid,
    required this.timeSent,
  });

  factory GroupModel.fromJson(Map<String, dynamic> json) {
    return GroupModel(
      senderId: json['senderId'],
      name: json['name'],
      groupId: json['groupId'],
      lastMessage: json['lastMessage'],
      groupPic: json['groupPic'],
      membersUid: json['membersUid'],
      timeSent: json['timeSent'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'name': name,
      'groupId': groupId,
      'lastMessage': lastMessage,
      'groupPic': groupPic,
      'membersUid': membersUid,
      'timeSent': timeSent,
    };
  }
}
