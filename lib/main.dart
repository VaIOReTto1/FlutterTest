import 'package:flutter/material.dart';
import 'package:learntest/config.dart';

void main() {
  runApp(const MyApp());
}

// 主应用程序类
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

// 主页类
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffafafa),
      body: Column(
        children: [
          const QQBar(), // 顶部QQ栏
          const Search(), // 搜索栏
          for (int i = 0; i < 7; i++) const QQMessage(), // QQ消息列表
        ],
      ),
      bottomNavigationBar: const QQBottomBar(), // 底部导航栏
    );
  }
}

// 通用的标题小部件
class TitleText extends StatelessWidget {
  final String text;
  final int color;

  const TitleText({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: Config.fontSizeTitle, color: Color(color)),
    );
  }
}

// QQ顶部栏
class QQBar extends StatelessWidget {
  const QQBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        Config.paddingRL,
        MediaQuery.of(context).padding.top,
        Config.paddingRL,
        0,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff5DCBEF), Color(0xff50A2F8)],
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  'http://q1.qlogo.cn/g?b=qq&nk=1302140648&s=640',
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleText(text: "Plastic Flower", color: 0xffffffff),
              Row(
                children: [
                  Container(
                    height: Config.myStateIconSize,
                    width: Config.myStateIconSize,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      gradient: const LinearGradient(
                        colors: [Color(0xFF76EA98), Color(0xFF66D88D)],
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "手机在线",
                    style: TextStyle(
                      fontSize: Config.fontSizeState,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Expanded(child: Container()),
          const Icon(
            Icons.add_sharp,
            color: Colors.white,
            size: 40,
          ),
        ],
      ),
    );
  }
}

// 搜索栏
class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: EdgeInsets.fromLTRB(
        Config.marginRL,
        Config.marginTB / 2,
        Config.marginRL,
        Config.marginTB / 2,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Color(Config.searchColor),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search,
              color: Color(Config.searchIconColor),
              size: 18,
            ),
            const SizedBox(width: 7),
            Text(
              "搜索",
              style: TextStyle(
                color: Color(Config.searchIconColor),
                fontSize: Config.fontSizeContent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// QQ消息列表项
class QQMessage extends StatelessWidget {
  const QQMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      padding: EdgeInsets.fromLTRB(
        Config.marginRL,
        Config.marginTB / 2.8,
        Config.marginRL,
        Config.marginTB / 2.8,
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  'http://q1.qlogo.cn/g?b=qq&nk=1302140648&s=640',
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleText(
                text: "吹水群",
                color: 0xff000000,
              ),
              const SizedBox(height: 3),
              Text(
                "叶典林：哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈",
                style: TextStyle(
                  fontSize: Config.fontSizeState,
                  color: const Color(0xff9a9a9a),
                ),
              ),
            ],
          ),
          Expanded(child: Container()),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "晚上7:00",
                style: TextStyle(
                  fontSize: Config.fontSizeTime,
                  color: const Color(0xff8c8c8c),
                ),
              ),
              const SizedBox(height: 3),
              Card(
                color: const Color(0xff8c8c8c),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                  child: Text(
                    "99+",
                    style: TextStyle(
                      color: Color(Config.searchColor),
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// QQ底部导航栏
class QQBottomBar extends StatelessWidget {
  const QQBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const BottomAppBar(
      height: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _BottomBarItem(
            icon: Icons.messenger,
            text: "消息",
            color: Colors.blue,
          ),
          _BottomBarItem(
            icon: Icons.person,
            text: "联系人",
            color: null,
          ),
          _BottomBarItem(
            icon: Icons.star,
            text: "动态",
            color: null,
          ),
        ],
      ),
    );
  }
}

// 底部导航栏的单个项目
class _BottomBarItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? color;

  const _BottomBarItem({
    Key? key,
    required this.icon,
    required this.text,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 25,
          color: color ?? Colors.black,
        ),
        Text(text, style: TextStyle(color: color ?? Colors.black)),
      ],
    );
  }
}