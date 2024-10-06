import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_final/models/config.dart';
import 'package:mobile_final/widgets/post_action_button.dart';

class PostCreatePage extends StatefulWidget {
  const PostCreatePage({super.key});

  @override
  _PostCreatePageState createState() => _PostCreatePageState();
}

class _PostCreatePageState extends State<PostCreatePage> {
  final _titleController = TextEditingController();

  Future<void> _createPost() async {
    if (_titleController.text.isEmpty) {
      // แสดงข้อความเตือนถ้าไม่ได้กรอกข้อมูล
      _showEmptyFieldDialog();
      return;
    }

    final url = Uri.parse('http://${Configure.server}/posts');

    final newPost = {
      'title': _titleController.text,
      'author': 'Plum',
      'comments': [],
      'likes': 0,
      'dislikes': 0,
    };

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
      },
      body: jsonEncode(newPost),
    );

    if (response.statusCode == 201) {
      Navigator.pop(context);
      Navigator.pushNamed(context, '/history');
    } else {
      print('Failed to create post');
    }
  }

  // ฟังก์ชันแสดงข้อความเตือน
  void _showEmptyFieldDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ข้อผิดพลาด'),
          content: const Text('กรุณากรอกข้อมูลก่อนโพสต์'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('ตกลง'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(''), 
        backgroundColor: const Color.fromRGBO(0, 105, 20, 1.0), 
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: PostActionButton(onPressed: _createPost),
          ),
        ],
      ),
      body: Container(
        color: Colors.white, 
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              maxLines: 3,
              decoration: const InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                hintText: 'ถ้าคุณมีปัญหาหรือเรื่องที่อยากจะพูดคุยกับเพื่อนๆ\nอย่าลังเลที่จะพูดออกมา :)',
                hintStyle: TextStyle(color: Colors.grey),
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
