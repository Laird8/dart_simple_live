import 'dart:convert';
import 'dart:io';

class ConfigHelper {
  static final ConfigHelper _instance = ConfigHelper._internal();
  factory ConfigHelper() => _instance;
  ConfigHelper._internal() {
    _loadConfig();
  }

  static ConfigHelper get instance => _instance;

  // 默认查询用 UserAgent 配置
  final Map<String, String> _queryUserAgentMap = {
    "huya": "Mozilla/5.0 (Linux; Android 11; Pixel 5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.91 Mobile Safari/537.36 Edg/117.0.0.0",
    "douyu": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.43",
    "douyin": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0",
    "bilibili": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0",
  };

  // 默认播放用 UserAgent 配置
  final Map<String, String> _playerUserAgentMap = {
    "huya": "HYSDK(Windows, 30000002)_APP(pc_exe&6070100&official)_SDK(trans&2.21.0.4784)",
    "douyu": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.43",
    "douyin": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0",
    "bilibili": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188",
  };

  // 配置文件路径
  String get _configPath => 'user_agent_config.json';

  // 获取指定站点的查询用 UserAgent
  String getQueryUserAgent(String siteId) {
    return _queryUserAgentMap[siteId] ?? _queryUserAgentMap["huya"]!;
  }

  // 设置指定站点的查询用 UserAgent
  void setQueryUserAgent(String siteId, String userAgent) {
    _queryUserAgentMap[siteId] = userAgent;
    _saveConfig();
  }

  // 获取指定站点的播放用 UserAgent
  String getPlayerUserAgent(String siteId) {
    return _playerUserAgentMap[siteId] ?? _playerUserAgentMap["huya"]!;
  }

  // 设置指定站点的播放用 UserAgent
  void setPlayerUserAgent(String siteId, String userAgent) {
    _playerUserAgentMap[siteId] = userAgent;
    _saveConfig();
  }

  // 向后兼容的方法
  String getUserAgent(String siteId) {
    return getQueryUserAgent(siteId);
  }

  // 向后兼容的方法
  void setUserAgent(String siteId, String userAgent) {
    setQueryUserAgent(siteId, userAgent);
  }

  // 加载配置
  void _loadConfig() {
    try {
      final file = File(_configPath);
      if (file.existsSync()) {
        final content = file.readAsStringSync();
        final Map<String, dynamic> data = json.decode(content);
        
        if (data.containsKey('queryUserAgents')) {
          final Map<String, dynamic> queryMap = data['queryUserAgents'];
          queryMap.forEach((key, value) {
            if (value is String) {
              _queryUserAgentMap[key] = value;
            }
          });
        }
        
        if (data.containsKey('playerUserAgents')) {
          final Map<String, dynamic> playerMap = data['playerUserAgents'];
          playerMap.forEach((key, value) {
            if (value is String) {
              _playerUserAgentMap[key] = value;
            }
          });
        }
      }
    } catch (e) {
      print('Failed to load user agent config: $e');
    }
  }

  // 保存配置
  void _saveConfig() {
    try {
      final file = File(_configPath);
      final data = {
        'queryUserAgents': _queryUserAgentMap,
        'playerUserAgents': _playerUserAgentMap,
      };
      file.writeAsStringSync(json.encode(data));
    } catch (e) {
      print('Failed to save user agent config: $e');
    }
  }
} 