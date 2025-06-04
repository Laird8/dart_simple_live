/// UserAgent 服务的core层接口
/// 这是一个简单的壳，实际上会转发请求到app层的UserAgentService
class UserAgentService {
  static final UserAgentService _instance = UserAgentService._internal();
  factory UserAgentService() => _instance;
  UserAgentService._internal();

  static UserAgentService get instance => _instance;

  // 应用层的UserAgentService实例
  static dynamic _appServiceInstance;
  
  // 设置应用层的UserAgentService实例
  static void setAppServiceInstance(dynamic appService) {
    _appServiceInstance = appService;
  }

  // 获取查询用 UserAgent
  String getQueryUserAgent(String platform) {
    if (_appServiceInstance != null) {
      try {
        return _appServiceInstance.getQueryUserAgent(platform);
      } catch (e) {
        return _getDefaultQueryUserAgent(platform);
      }
    }
    return _getDefaultQueryUserAgent(platform);
  }

  // 获取播放用 UserAgent
  String getPlayerUserAgent(String platform) {
    if (_appServiceInstance != null) {
      try {
        return _appServiceInstance.getPlayerUserAgent(platform);
      } catch (e) {
        return _getDefaultPlayerUserAgent(platform);
      }
    }
    return _getDefaultPlayerUserAgent(platform);
  }

  // 默认查询用 UserAgent
  String _getDefaultQueryUserAgent(String platform) {
    switch (platform) {
      case "huya":
        return "Mozilla/5.0 (Linux; Android 11; Pixel 5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.91 Mobile Safari/537.36 Edg/117.0.0.0";
      case "douyu":
        return "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.43";
      case "douyin":
        return "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0";
      case "bilibili":
        return "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0";
      default:
        return "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0";
    }
  }

  // 默认播放用 UserAgent
  String _getDefaultPlayerUserAgent(String platform) {
    switch (platform) {
      case "huya":
        return "HYSDK(Windows, 30000002)_APP(pc_exe&6070100&official)_SDK(trans&2.21.0.4784)";
      case "douyu":
        return "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.43";
      case "douyin":
        return "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0";
      case "bilibili":
        return "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0";
      default:
        return "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0";
    }
  }
} 