import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_final/models/config.dart';
import 'package:mobile_final/models/post_model.dart';
import 'package:mobile_final/widgets/post_edit.dart';
import 'package:mobile_final/widgets/post_stat.dart';

class PostList extends StatelessWidget {
  final List<Post> posts;
  final bool isHistoryPage; // เอาไว้บอกว่าอยู่ในหน้า History ไหม
  final Function() onPostDeleted;

  const PostList({
    super.key,
    required this.posts,
    required this.isHistoryPage,
    required this.onPostDeleted,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: posts.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final post = posts[index];
        return ListTile(
          title: Text(
            post.title,
            style: const TextStyle(
                color: Colors.black), // กำหนดสีของข้อความเป็นสีขาว
          ),
          subtitle: PostStats(
              post:
                  post), // คุณอาจต้องปรับ PostStats ให้มีสีข้อความเป็นสีขาวเช่นกัน
          tileColor:
              Colors.white, // กำหนดพื้นหลังของ ListTile เป็นสีที่ต้องการ
          trailing: isHistoryPage
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit,
                          color: Colors.black), // เปลี่ยนสีไอคอนเป็นสีขาว
                      onPressed: () {
                        // นำทางไปยัง PostEditPage
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PostEditPage(post: post),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete,
                          color: Colors.black), // เปลี่ยนสีไอคอนเป็นสีขาว
                      onPressed: () {
                        // ฟังก์ชันลบโพสต์
                        _confirmDelete(context, post);
                      },
                    ),
                  ],
                )
              : null, // ถ้าไม่ใช่ HistoryPage จะไม่มีปุ่มแก้ไข
          onTap: () {
            Navigator.pushNamed(
              context,
              '/postdetails',
              arguments: {'post': post},
            );
          },
        );
      },
    );
  }

  void _confirmDelete(BuildContext context, Post post) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("ยืนยันการลบ"),
          content: const Text("คุณแน่ใจว่าต้องการลบโพสต์นี้หรือไม่?"),
          actions: [
            TextButton(
              child: const Text("ยกเลิก"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("ลบ"),
              onPressed: () {
                // Call the delete function with just the post
                _deletePost(context, post);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _deletePost(BuildContext context, Post post) async {
    final url = Uri.http(Configure.server, "/posts/${post.id}");
    final response = await http.delete(url);

    if (response.statusCode == 200) {
      // เมื่อลบสำเร็จ
      print("Post deleted successfully");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Post deleted successfully")),
      );
      onPostDeleted();
    } else {
      // Handle the error
      print("Failed to delete post: ${response.statusCode}, ${response.body}");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to delete post")),
      );
    }
  }
}
