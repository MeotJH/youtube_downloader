import 'dart:html' as html;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';

class YoutubeDownloaderPage extends StatefulWidget {
  const YoutubeDownloaderPage({super.key});

  @override
  State<YoutubeDownloaderPage> createState() => _YoutubeDownloaderPageState();
}

class _YoutubeDownloaderPageState extends State<YoutubeDownloaderPage> {
  final idTextController = TextEditingController();
  final Dio _dio = Dio();

  void downloadFile(String id) {
    final url = 'http://127.0.0.1:8080/api/v1/download/$id';
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', '$id.mp4')
      ..click();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            width: 41,
            height: 28,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: ShapeDecoration(
              color: const Color(0xFFF5F5F5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
            ),
            child: const Text(
              '일반',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 14,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    '유튜브 다운로더',
                    style: TextStyle(
                      color: Color(0xFF222222),
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Youtube URL ID를 입력해주세요',
                    style: TextStyle(
                      color: Color(0xFF808080),
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  height: 56,
                  padding: const EdgeInsets.all(8),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Zqjs7onNImg',
                      border: InputBorder.none,
                    ),
                    controller: idTextController,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity, // 원하는 너비
                  height: 56,
                  child: TextButton(
                    onPressed: () async {
                      downloadFile(idTextController.text);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(
                          0xFF009999,
                          //0xFFF0F0F0,
                        ),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Download',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(
                          //0xFFCDCDCD,
                          0xFFFFFFFF,
                        ),
                        fontSize: 18,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
            Column(
              children: [
                TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xFFA0A0A0)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: const Text(
                    '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF808080),
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
