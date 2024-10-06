import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobile_final/models/config.dart';
import 'package:mobile_final/models/post_model.dart';

class PostStats extends StatefulWidget {
  final Post post;

  const PostStats({super.key, required this.post});

  @override
  _PostStatsState createState() => _PostStatsState();
}

class _PostStatsState extends State<PostStats> {
  bool hasLiked = false;
  bool hasDisliked = false;

  void _handleLike() async {
    if (!hasLiked && !hasDisliked) {
      setState(() {
        widget.post.likes++;
        hasLiked = true;
      });

      final url = Uri.http(Configure.server, "/posts/${widget.post.id}");
      final updatedPost = {
        "likes": widget.post.likes,
        "dislikes": widget.post.dislikes,
        // ส่งข้อมูลใหม่ใน JSON เพื่ออัปเดตโพสต์ในเซิร์ฟเวอร์
      };

      final response = await http.put(
        url,
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        body: jsonEncode(updatedPost),
      );

      if (response.statusCode != 200) {
        // กรณีเกิดข้อผิดพลาด ให้ยกเลิกการเพิ่มจำนวนถูกใจ
        setState(() {
          widget.post.likes--;
          hasLiked = false;
        });
      }
    }
  }

  void _handleDislike() async {
    if (!hasLiked && !hasDisliked) {
      setState(() {
        widget.post.dislikes++;
        hasDisliked = true;
      });

      final url = Uri.http(Configure.server, "/posts/${widget.post.id}");
      final updatedPost = {
        "likes": widget.post.likes,
        "dislikes": widget.post.dislikes,
      };

      final response = await http.put(
        url,
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        body: jsonEncode(updatedPost),
      );

      if (response.statusCode != 200) {
        setState(() {
          widget.post.dislikes--;
          hasDisliked = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.thumb_up,
              color: hasLiked ? Colors.blue : Colors.grey, size: 16),
          onPressed: _handleLike,
        ),
        Text(' ${widget.post.likes} | '),
        IconButton(
          icon: Icon(Icons.thumb_down,
              color: hasDisliked ? Colors.red : Colors.grey, size: 16),
          onPressed: _handleDislike,
        ),
        Text(' ${widget.post.dislikes} | '),
        const Icon(Icons.comment, size: 16),
        Text(' ${widget.post.comments.length}'),
      ],
    );
  }
}
