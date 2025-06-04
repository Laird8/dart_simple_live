import 'package:simple_live_app/services/local_storage_service.dart';

/// UserAgent 辅助服务，用于管理各直播平台的 UserAgent
class UserAgentService {
  static final UserAgentService _instance = UserAgentService._internal();
  factory UserAgentService() => _instance;
  UserAgentService._internal();

  static UserAgentService get instance => _instance;

  // 默认查询用 UserAgent 配置
  final Map<String, String> defaultQueryUserAgents = {
    "huya": "Mozilla/5.0 (Linux; Android 11; Pixel 5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.91 Mobile Safari/537.36 Edg/117.0.0.0",
    "douyu": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.43",
    "douyin": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0",
    "bilibili": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0",
  };
  
  // 默认播放用 UserAgent 配置
  final Map<String, String> defaultPlayerUserAgents = {
    "huya": "HYSDK(Windows, 30000002)_APP(pc_exe&6070100&official)_SDK(trans&2.21.0.4784)",
    "douyu": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.43",
    "douyin": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0",
    "bilibili": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0",
  };

  // 获取查询用 UserAgent
  String getQueryUserAgent(String platform) {
    return LocalStorageService.instance.getValue(
      _getQueryUserAgentKey(platform),
      defaultQueryUserAgents[platform] ?? "",
    );
  }

  // 获取播放用 UserAgent
  String getPlayerUserAgent(String platform) {
    return LocalStorageService.instance.getValue(
      _getPlayerUserAgentKey(platform),
      defaultPlayerUserAgents[platform] ?? "",
    );
  }

  // 设置查询用 UserAgent
  Future<void> setQueryUserAgent(String platform, String userAgent) async {
    await LocalStorageService.instance.setValue(
      _getQueryUserAgentKey(platform),
      userAgent,
    );
  }

  // 设置播放用 UserAgent
  Future<void> setPlayerUserAgent(String platform, String userAgent) async {
    await LocalStorageService.instance.setValue(
      _getPlayerUserAgentKey(platform),
      userAgent,
    );
  }

  // 获取查询用 UserAgent 的键
  String _getQueryUserAgentKey(String platform) {
    switch (platform) {
      case "huya":
        return LocalStorageService.kHuyaQueryUserAgent;
      case "douyu":
        return LocalStorageService.kDouyuQueryUserAgent;
      case "douyin":
        return LocalStorageService.kDouyinQueryUserAgent;
      case "bilibili":
        return LocalStorageService.kBilibiliQueryUserAgent;
      default:
        return "k${platform}QueryUserAgent";
    }
  }

  // 获取播放用 UserAgent 的键
  String _getPlayerUserAgentKey(String platform) {
    switch (platform) {
      case "huya":
        return LocalStorageService.kHuyaPlayerUserAgent;
      case "douyu":
        return LocalStorageService.kDouyuPlayerUserAgent;
      case "douyin":
        return LocalStorageService.kDouyinPlayerUserAgent;
      case "bilibili":
        return LocalStorageService.kBilibiliPlayerUserAgent;
      default:
        return "k${platform}PlayerUserAgent";
    }
  }
} 