// lib/pages/chat.dart
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/lan_device.dart';
import '../services/device_manager.dart'; // 导入 DeviceManager
import '../protos/message.pb.dart' as proto; // 导入 Protobuf 类型
import 'package:uuid/uuid.dart'; // 用于生成唯一消息 ID

class ChatPage extends ConsumerStatefulWidget {
  final List<LANDevice>? devices;
  final LANDevice? device;

  const ChatPage({super.key, this.devices, this.device});

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  final TextEditingController _textController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  late final List<LANDevice> devices;

  @override
  void initState() {
    super.initState();
    devices = widget.devices ?? (widget.device != null ? [widget.device!] : []);
  }

  void _sendMessage() async {
    if (_textController.text.isNotEmpty) {
      final text = _textController.text;

      // 构造 Protobuf 消息对象
      final envelope = proto.Envelope(
        version: '1.0.0',
        messageId: const Uuid().v4(),
        timestamp: Int64(DateTime.now().millisecondsSinceEpoch),
        payloadType: proto.PayloadType.TEXT,
        text: proto.TextPayload(content: text),
      );

      // 发送消息到每个目标设备
      final deviceManager = ref.read(deviceManagerProvider);
      for (final device in devices) {
        deviceManager.send(device.ip, device.port, envelope);
      }

      setState(() {
        _messages.add({'text': text, 'isMe': true, 'time': DateTime.now()});
      });

      _textController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          devices.length > 1
              ? '群聊 (${devices.length})'
              : devices.isNotEmpty
              ? devices.first.name
              : '聊天',
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return _buildMessageItem(message);
              },
            ),
          ),
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildMessageItem(Map<String, dynamic> message) {
    final isMe = message['isMe'] as bool;
    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          message['text'] as String,
          style: TextStyle(color: isMe ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  Widget _buildInputArea() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                hintText: '输入消息...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          IconButton(onPressed: _sendMessage, icon: const Icon(Icons.send)),
        ],
      ),
    );
  }
}
