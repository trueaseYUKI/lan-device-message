# devices_lan

> ⚠️ **重要提醒**：由于缺乏多台设备进行测试，项目目前只能开发到局域网内的多播寻找设备阶段。开发者需要多台设备才能完整测试和开发后续功能。

> ⚠️ Important Notice: Due to the lack of multiple devices for testing, the project can currently only be developed to the stage of multicast device discovery within the local area network. Developers need multiple devices to fully test and develop subsequent functionalities.

A new Flutter project for local area network messaging.

## 项目简介 | Project Overview

这是一个基于 Flutter 开发的局域网消息通信应用，允许同一局域网内的设备相互发现并进行实时消息传输。

This is a Flutter-based local area network messaging application that allows devices within the same LAN to discover each other and exchange real-time messages.

### 主要功能 | Key Features

- 🌐 局域网设备自动发现 (LAN device auto-discovery)
- 💬 实时文本消息传输 (Real-time text messaging)
- 🔍 设备信息服务 (Device information service)
- 📱 跨平台支持 (Cross-platform support: Android/iOS/Windows/MacOS/Linux)

## 技术架构 | Technical Architecture

### 核心依赖 | Core Dependencies

```yaml
# 网络传输相关 | Network transmission essentials
nsd: ^4.0.0 # 服务发现与注册 | Service discovery and registration
web_socket_channel: ^3.0.0 # WebSocket通信 | WebSocket communication
network_info_plus: ^6.0.0 # 网络信息获取 | Local network information

# 数据持久化 | Data persistence
shared_preferences: ^2.5.3 # 本地数据存储 | Local data storage

# 序列化与安全 | Serialization & Security
protobuf: ^5.0.0 # 协议缓冲区 | Protocol Buffers
encrypt: ^5.0.0 # 加密功能 | Encryption capabilities

# 状态管理 | State management
riverpod: ^3.0.0 # 状态管理框架 | State management framework
freezed_annotation: ^2.4.1 # 不可变数据模型 | Immutable data models
```

### 项目结构 | Project Structure

```
lib/
├── models/                     # 数据模型定义
│   ├── lan_device.dart        # 局域网设备模型
│   └── message_envelope.dart  # 消息封装模型
├── pages/                     # 页面组件
│   ├── home.dart             # 主页
│   ├── chat.dart             # 聊天页面
│   └── settings.dart         # 设置页面
├── protos/                    # Protocol Buffer定义
├── provider/                  # Riverpod状态管理
├── services/                  # 核心服务
│   ├── device_manager.dart   # 设备管理器
│   ├── lan_discovery_service.dart  # 局域网发现服务
│   └── ws_*_manager.dart     # WebSocket客户端/服务端管理
└── utils/                     # 工具类
```

## 工作原理 | How It Works

1. **设备发现**: 使用 mDNS 协议实现局域网内设备的自动发现

   - Device Discovery: Uses mDNS protocol for automatic LAN device discovery

2. **服务注册**: 每个设备启动后会在局域网内注册自己的服务信息

   - Service Registration: Each device registers its service information upon startup

3. **连接建立**: 通过 WebSocket 建立设备间的双向通信通道

   - Connection Establishment: Bidirectional communication channels established via WebSocket

4. **消息传输**: 使用 Protocol Buffers 进行高效的消息序列化
   - Message Transmission: Efficient message serialization using Protocol Buffers

## 快速开始 | Quick Start

### 环境要求 | Prerequisites

- Flutter SDK 3.9.2 or higher
- Dart SDK 3.9.2 or higher
- 支持的 IDE (Android Studio, VS Code 等)
- Supported IDE (Android Studio, VS Code, etc.)

### 安装步骤 | Installation Steps

1. 克隆项目 | Clone the repository

```bash
git clone <repository-url>
```

2. 获取依赖 | Get dependencies

```bash
flutter pub get
```

3. 运行应用 | Run the application

```bash
flutter run
```

## 平台特定配置 | Platform-specific Configuration

### Android

需要在[AndroidManifest.xml](file://d:\Project\CloudPorject\devices_lan\android\app\src\main\AndroidManifest.xml)中添加以下权限：

The following permissions need to be added to [AndroidManifest.xml](file://d:\Project\CloudPorject\devices_lan\android\app\src\main\AndroidManifest.xml):

```xml
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
<uses-permission android:name="android.permission.CHANGE_WIFI_MULTICAST_STATE"/>
<uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.NEARBY_WIFI_DEVICES" />
```

## 开发计划 | Development Roadmap

- [ ] 文件传输功能 (File transfer functionality)
- [ ] 群聊支持 (Group chat support)
- [ ] 消息加密 (Message encryption)
- [ ] 用户界面优化 (UI optimization)
- [ ] 消息历史记录 (Message history)

## 贡献 | Contributing

欢迎提交 Issue 和 Pull Request 来帮助改进这个项目！

Welcome to submit Issues and Pull Requests to help improve this project!

## 许可证 | License

[MIT License](LICENSE)
