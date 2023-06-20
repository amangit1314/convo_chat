import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repository/chat_repository.dart';

final chatControllerProvider = Provider<ChatController>((ref) {
  final chatRepository = ref.watch(chatRepositoryProvider);
  return ChatController(chatRepository: chatRepository, ref: ref);
});

class ChatController {
  final ChatRepository chatRepository;
  final ProviderRef ref;

  ChatController({required this.chatRepository, required this.ref});

  Future<void> sendMessage(String receiverId, String message) async {
    await chatRepository.sendMessage(receiverId, message);
  }

  Stream<QuerySnapshot> getMessages(String otherUserId) {
    return chatRepository.getMessages(otherUserId);
  }
}
