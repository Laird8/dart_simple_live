import 'package:simple_live_app/services/user_agent_service.dart';
import 'package:simple_live_core/src/services/user_agent_service.dart' as core_ua_service;

/// 服务初始化器
/// 用于初始化所有服务之间的连接
class ServiceInitializer {
  /// 初始化所有服务
  static void initializeServices() {
    // 设置core层的UserAgentService使用app层的实例
    core_ua_service.UserAgentService.setAppServiceInstance(UserAgentService.instance);
  }
} 