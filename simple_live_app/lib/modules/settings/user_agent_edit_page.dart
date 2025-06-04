import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:simple_live_app/app/app_style.dart';
import 'package:simple_live_app/services/user_agent_service.dart';

class UserAgentEditPage extends StatefulWidget {
  final String platform;
  final String platformName;
  final String queryUserAgent;
  final String playerUserAgent;
  final Function(String) onQueryUserAgentChanged;
  final Function(String) onPlayerUserAgentChanged;

  const UserAgentEditPage({
    Key? key,
    required this.platform,
    required this.platformName,
    required this.queryUserAgent,
    required this.playerUserAgent,
    required this.onQueryUserAgentChanged,
    required this.onPlayerUserAgentChanged,
  }) : super(key: key);

  @override
  State<UserAgentEditPage> createState() => _UserAgentEditPageState();
}

class _UserAgentEditPageState extends State<UserAgentEditPage> {
  late TextEditingController _queryController;
  late TextEditingController _playerController;

  @override
  void initState() {
    super.initState();
    _queryController = TextEditingController(text: widget.queryUserAgent);
    _playerController = TextEditingController(text: widget.playerUserAgent);
  }

  @override
  void dispose() {
    _queryController.dispose();
    _playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.platformName} UserAgent"),
        actions: [
          IconButton(
            icon: const Icon(Icons.restore),
            tooltip: "恢复默认值",
            onPressed: () {
              _showResetConfirmDialog();
            },
          ),
        ],
      ),
      body: ListView(
        padding: AppStyle.edgeInsetsA12,
        children: [
          // 查询用 UserAgent
          Card(
            child: Padding(
              padding: AppStyle.edgeInsetsA12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "查询用 UserAgent",
                    style: Get.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "用于获取直播间信息、分类列表等 API 请求",
                    style: Get.textTheme.bodySmall,
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _queryController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "输入查询用 UserAgent",
                      isDense: true,
                    ),
                    maxLines: 3,
                    minLines: 1,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () async {
                          await Clipboard.setData(
                            ClipboardData(text: _queryController.text),
                          );
                          if (!mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("已复制到剪贴板"),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },
                        child: const Text("复制"),
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        onPressed: () async {
                          var data = await Clipboard.getData("text/plain");
                          if (data != null && data.text != null) {
                            setState(() {
                              _queryController.text = data.text!;
                            });
                          }
                        },
                        child: const Text("粘贴"),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          widget.onQueryUserAgentChanged(_queryController.text);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("查询用 UserAgent 已保存"),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },
                        child: const Text("保存"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // 播放用 UserAgent
          Card(
            child: Padding(
              padding: AppStyle.edgeInsetsA12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "播放用 UserAgent",
                    style: Get.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "用于获取直播流，某些平台对播放请求有特殊的 UserAgent 要求",
                    style: Get.textTheme.bodySmall,
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _playerController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "输入播放用 UserAgent",
                      isDense: true,
                    ),
                    maxLines: 3,
                    minLines: 1,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () async {
                          await Clipboard.setData(
                            ClipboardData(text: _playerController.text),
                          );
                          if (!mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("已复制到剪贴板"),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },
                        child: const Text("复制"),
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        onPressed: () async {
                          var data = await Clipboard.getData("text/plain");
                          if (data != null && data.text != null) {
                            setState(() {
                              _playerController.text = data.text!;
                            });
                          }
                        },
                        child: const Text("粘贴"),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          widget.onPlayerUserAgentChanged(_playerController.text);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("播放用 UserAgent 已保存"),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },
                        child: const Text("保存"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // 注意事项
          Card(
            child: Padding(
              padding: AppStyle.edgeInsetsA12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "注意事项",
                    style: Get.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "1. 不建议随意修改 UserAgent，除非你知道你在做什么\n"
                    "2. 修改后如果无法正常获取直播信息或播放，请恢复默认值\n"
                    "3. 某些平台可能对特定 UserAgent 有限制，请谨慎修改\n"
                    "4. 修改后立即生效，无需重启应用",
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showResetConfirmDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("恢复默认值"),
        content: const Text("确定要恢复默认的 UserAgent 设置吗？"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("取消"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              
              // 恢复默认查询用 UserAgent
              final defaultQueryUserAgent = UserAgentService.instance.defaultQueryUserAgents[widget.platform] ?? "";
              setState(() {
                _queryController.text = defaultQueryUserAgent;
              });
              widget.onQueryUserAgentChanged(defaultQueryUserAgent);
              
              // 恢复默认播放用 UserAgent
              final defaultPlayerUserAgent = UserAgentService.instance.defaultPlayerUserAgents[widget.platform] ?? "";
              setState(() {
                _playerController.text = defaultPlayerUserAgent;
              });
              widget.onPlayerUserAgentChanged(defaultPlayerUserAgent);
              
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("已恢复默认 UserAgent 设置"),
                  duration: Duration(seconds: 1),
                ),
              );
            },
            child: const Text("确定"),
          ),
        ],
      ),
    );
  }
} 