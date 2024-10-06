// history.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_final/models/post_model.dart';
import 'package:mobile_final/view/app_bar.dart';
import 'package:mobile_final/models/config.dart';
import 'package:mobile_final/widgets/post_list.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<Post> _posts = [];
  bool _isLoading = true;

  Future<void> _fetchPosts() async {
    final response =
        await http.get(Uri.parse('http://${Configure.server}/posts'));

    if (response.statusCode == 200) {
      final List<Post> posts = postsFromJson(response.body);
      final plumPosts = posts.where((post) => post.author == 'Plum').toList();
      setState(() {
        _posts = plumPosts;
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      print('Failed to load posts');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchPosts(); // ดึงข้อมูลโพสต์เมื่อเพจเริ่มต้น
  }

  void _handlePostDeleted() {
    _fetchPosts(); // รีเฟรซ post หลังมีการลบ
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  backgroundColor: const Color.fromRGBO(0, 105, 20, 1.0),
  centerTitle: true,
  title: Container(
    margin: const EdgeInsets.only(bottom: 15.0), // เว้นขอบล่าง
    child: const Text(
      "ประวัติของคุณ",
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(218, 137, 146, 1.0),
      ),
    ),
  ),
),

      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : PostList(
              posts: _posts,
              isHistoryPage: true,
              onPostDeleted: _handlePostDeleted), // Pass the callback
      bottomNavigationBar: const MyBottomNavigationBar(
        currentIndex: 1,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/postcreate'); // Navigate to NewPostPage
        },
        backgroundColor: const Color.fromRGBO(0, 105, 20, 1.0),
        foregroundColor: const Color.fromRGBO(218,137,146, 1.0), // สี +
        child: const Icon(Icons.add),
      ),
    );
  }
}
