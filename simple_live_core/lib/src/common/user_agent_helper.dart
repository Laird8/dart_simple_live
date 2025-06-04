import 'package:simple_live_core/src/common/config_helper.dart';

/// UserAgent 帮助类，提供更新 UserAgent 的方法
class UserAgentHelper {
  /// 默认查询用 UserAgent 配置
  static const Map<String, String> defaultQueryUserAgents = {
    "huya": "Mozilla/5.0 (Linux; Android 11; Pixel 5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.91 Mobile Safari/537.36 Edg/117.0.0.0",
    "douyu": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.43",
    "douyin": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0",
    "bilibili": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0",
  };
  
  /// 默认播放用 UserAgent 配置
  static const Map<String, String> defaultPlayerUserAgents = {
    "huya": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0",
    "douyu": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.43",
    "douyin": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0",
    "bilibili": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0",
  };

  /// 设置虎牙直播查询用 UserAgent
  static void setHuyaQueryUserAgent(String userAgent) {
    ConfigHelper.instance.setQueryUserAgent("huya", userAgent);
  }

  /// 设置斗鱼直播查询用 UserAgent
  static void setDouyuQueryUserAgent(String userAgent) {
    ConfigHelper.instance.setQueryUserAgent("douyu", userAgent);
  }

  /// 设置抖音直播查询用 UserAgent
  static void setDouyinQueryUserAgent(String userAgent) {
    ConfigHelper.instance.setQueryUserAgent("douyin", userAgent);
  }

  /// 设置哔哩哔哩直播查询用 UserAgent
  static void setBiliBiliQueryUserAgent(String userAgent) {
    ConfigHelper.instance.setQueryUserAgent("bilibili", userAgent);
  }

  /// 获取虎牙直播查询用 UserAgent
  static String getHuyaQueryUserAgent() {
    return ConfigHelper.instance.getQueryUserAgent("huya");
  }

  /// 获取斗鱼直播查询用 UserAgent
  static String getDouyuQueryUserAgent() {
    return ConfigHelper.instance.getQueryUserAgent("douyu");
  }

  /// 获取抖音直播查询用 UserAgent
  static String getDouyinQueryUserAgent() {
    return ConfigHelper.instance.getQueryUserAgent("douyin");
  }

  /// 获取哔哩哔哩直播查询用 UserAgent
  static String getBiliBiliQueryUserAgent() {
    return ConfigHelper.instance.getQueryUserAgent("bilibili");
  }

  /// 设置虎牙直播播放用 UserAgent
  static void setHuyaPlayerUserAgent(String userAgent) {
    ConfigHelper.instance.setPlayerUserAgent("huya", userAgent);
  }

  /// 设置斗鱼直播播放用 UserAgent
  static void setDouyuPlayerUserAgent(String userAgent) {
    ConfigHelper.instance.setPlayerUserAgent("douyu", userAgent);
  }

  /// 设置抖音直播播放用 UserAgent
  static void setDouyinPlayerUserAgent(String userAgent) {
    ConfigHelper.instance.setPlayerUserAgent("douyin", userAgent);
  }

  /// 设置哔哩哔哩直播播放用 UserAgent
  static void setBiliBiliPlayerUserAgent(String userAgent) {
    ConfigHelper.instance.setPlayerUserAgent("bilibili", userAgent);
  }

  /// 获取虎牙直播播放用 UserAgent
  static String getHuyaPlayerUserAgent() {
    return ConfigHelper.instance.getPlayerUserAgent("huya");
  }

  /// 获取斗鱼直播播放用 UserAgent
  static String getDouyuPlayerUserAgent() {
    return ConfigHelper.instance.getPlayerUserAgent("douyu");
  }

  /// 获取抖音直播播放用 UserAgent
  static String getDouyinPlayerUserAgent() {
    return ConfigHelper.instance.getPlayerUserAgent("douyin");
  }

  /// 获取哔哩哔哩直播播放用 UserAgent
  static String getBiliBiliPlayerUserAgent() {
    return ConfigHelper.instance.getPlayerUserAgent("bilibili");
  }

  // 向后兼容的方法
  /// 设置虎牙直播 UserAgent (查询用)
  static void setHuyaUserAgent(String userAgent) {
    setHuyaQueryUserAgent(userAgent);
  }

  /// 设置斗鱼直播 UserAgent (查询用)
  static void setDouyuUserAgent(String userAgent) {
    setDouyuQueryUserAgent(userAgent);
  }

  /// 设置抖音直播 UserAgent (查询用)
  static void setDouyinUserAgent(String userAgent) {
    setDouyinQueryUserAgent(userAgent);
  }

  /// 设置哔哩哔哩直播 UserAgent (查询用)
  static void setBiliBiliUserAgent(String userAgent) {
    setBiliBiliQueryUserAgent(userAgent);
  }

  /// 获取虎牙直播 UserAgent (查询用)
  static String getHuyaUserAgent() {
    return getHuyaQueryUserAgent();
  }

  /// 获取斗鱼直播 UserAgent (查询用)
  static String getDouyuUserAgent() {
    return getDouyuQueryUserAgent();
  }

  /// 获取抖音直播 UserAgent (查询用)
  static String getDouyinUserAgent() {
    return getDouyinQueryUserAgent();
  }

  /// 获取哔哩哔哩直播 UserAgent (查询用)
  static String getBiliBiliUserAgent() {
    return getBiliBiliQueryUserAgent();
  }
} 