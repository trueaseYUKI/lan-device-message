import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'dart:math';

/// 动态获取头像的工具类
class ImageLoadingUtils {
  static const String _avatarAssetPath = 'assets/avatar';
  static List<String>? _cachedAvatarPaths;

  /// 获取头像资源的路径列表
  /// 该方法会动态读取 assets/avatar/ 目标路径下的所有文件
  static Future<List<String>> getAvatarPaths() async {
    // 如果已经有缓存，则直接返回缓存结果
    if (_cachedAvatarPaths != null) {
      return _cachedAvatarPaths!;
    }

    try {
      // 从AssetManifest.json 中获取所有的资源文件信息
      final manifestContent = await rootBundle.loadString('AssetManifest.json');
      final Map<String, dynamic> manifestMap = json.decode(manifestContent);

      // 过滤出avatar目录下的所有文件
      final avartPaths =
          manifestMap.keys
              .where((key) => key.startsWith(_avatarAssetPath))
              .toList()
            ..sort(); // 排序保持一致性

      // 缓存结果
      _cachedAvatarPaths = avartPaths;
      return avartPaths;
    } catch (e) {
      if (kDebugMode) {
        print('读取头像资源失败：$e');
      }
      return _cachedAvatarPaths = [];
    }
  }

  /// 根据索引获取头像路径，支持循环索引
  static Future<String?> getAvatarPathIndex(int index) async {
    final avatarPaths = await getAvatarPaths();
    if (avatarPaths.isEmpty) return null;

    // 使用模运算
    final actualIndex = index % avatarPaths.length;
    return avatarPaths[actualIndex];
  }

  /// 随机获取一个头像路径
  static Future<String?> getRandomAvatarPath() async {
    final avatarPaths = await getAvatarPaths();
    if (avatarPaths.isEmpty) return null;

    final random = Random();
    final randomIndex = random.nextInt(avatarPaths.length);
    return avatarPaths[randomIndex];
  }

  /// 获取所有的头像资源
  static Future<int> getAvatarCount() async {
    final avartPaths = await getAvatarPaths();
    return avartPaths.length;
  }

  /// 清除缓存，下次获取时会重新读取资源列表
  static void clearCache() {
    _cachedAvatarPaths = null;
  }

  /// 预加载所有头像资源
  static Future<void> precacheAvatarImages(BuildContext context) async {
    final avatarPaths = await getAvatarPaths();
    for (final path in avatarPaths) {
      final imageProvider = AssetImage(path);
      await precacheImage(imageProvider, context);
    }
  }
}
