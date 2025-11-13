import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';
import '../models/message_envelope.dart';

class ChatNotifier extends StateNotifier<List<MessageEnvelope>> {
  ChatNotifier() : super([]);

  void add(MessageEnvelope env) {
    state = [...state, env];
  }

  void clear() => state = [];
}

final chatProvider = StateNotifierProvider<ChatNotifier, List<MessageEnvelope>>(
  (ref) => ChatNotifier(),
);
