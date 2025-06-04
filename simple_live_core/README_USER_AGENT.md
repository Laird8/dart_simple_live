# UserAgent 配置说明

## 概述

Simple Live Core 库支持为各个直播平台设置自定义的 UserAgent。通过配置自定义 UserAgent，您可以更好地模拟不同的客户端环境，提高访问成功率。

系统支持两种类型的 UserAgent：
- **查询用 UserAgent**：用于获取直播间信息、分类列表等 API 请求
- **播放用 UserAgent**：用于获取直播流，某些平台对播放请求有特殊的 UserAgent 要求

所有 UserAgent 设置都会自动保存到本地文件，重启应用后依然有效。

## 默认配置

### 查询用 UserAgent

各平台默认查询用 UserAgent 如下：

- **虎牙直播**：`Mozilla/5.0 (Linux; Android 11; Pixel 5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.91 Mobile Safari/537.36 Edg/117.0.0.0`
- **斗鱼直播**：`Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.43`
- **抖音直播**：`Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0`
- **哔哩哔哩直播**：`Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0`

### 播放用 UserAgent

各平台默认播放用 UserAgent 如下：

- **虎牙直播**：`HYSDK(Windows, 30000002)_APP(pc_exe&6070100&official)_SDK(trans&2.21.0.4784)`
- **斗鱼直播**：`Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.43`
- **抖音直播**：`Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0`
- **哔哩哔哩直播**：`Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188`

## 使用方法

### 获取当前 UserAgent

```dart
import 'package:simple_live_core/src/common/user_agent_service.dart';

// 获取查询用 UserAgent
String huyaQueryUserAgent = UserAgentHelper.getHuyaQueryUserAgent();
String douyuQueryUserAgent = UserAgentHelper.getDouyuQueryUserAgent();
String douyinQueryUserAgent = UserAgentHelper.getDouyinQueryUserAgent();
String bilibiliQueryUserAgent = UserAgentHelper.getBiliBiliQueryUserAgent();

// 获取播放用 UserAgent
String huyaPlayerUserAgent = UserAgentHelper.getHuyaPlayerUserAgent();
String douyuPlayerUserAgent = UserAgentHelper.getDouyuPlayerUserAgent();
String douyinPlayerUserAgent = UserAgentHelper.getDouyinPlayerUserAgent();
String bilibiliPlayerUserAgent = UserAgentHelper.getBiliBiliPlayerUserAgent();
```

### 更新 UserAgent

```dart
import 'package:simple_live_core/src/common/user_agent_service.dart';

// 更新查询用 UserAgent
UserAgentService.instance.setHuyaQueryUserAgent('Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Mobile/15E148 Safari/604.1');
UserAgentService.instance.setDouyuQueryUserAgent('Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36');

// 更新播放用 UserAgent
UserAgentHelper.setHuyaPlayerUserAgent('Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36');
UserAgentHelper.setBiliBiliPlayerUserAgent('Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36');
```

### 向后兼容方法

为了保持向后兼容，以下方法仍然可用，它们会修改查询用 UserAgent：

```dart
// 获取查询用 UserAgent (旧方法)
String huyaUserAgent = UserAgentService.instance.getHuyaUserAgent();

// 更新查询用 UserAgent (旧方法)
UserAgentService.instance.setHuyaUserAgent('Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Mobile/15E148 Safari/604.1');
```

## 持久化存储

所有 UserAgent 设置都会自动保存到本地文件 `user_agent_config.json`，重启应用后依然有效。
如果需要重置为默认值，删除该文件即可。

## 注意事项

1. 修改 UserAgent 会对直播间的访问和播放产生影响。如果修改后无法正常使用，请恢复默认设置或尝试其他合适的 UserAgent。
2. 不同平台可能需要不同的 UserAgent 才能正常工作，特别是播放链接，建议参考默认配置进行修改。
3. 请不要使用过于特殊或明显不合理的 UserAgent，以免被平台识别为异常请求。 