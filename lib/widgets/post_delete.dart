import 'package:flutter/material.dart';
import 'package:mobile_final/models/config.dart';
import 'package:mobile_final/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostDelete extends StatelessWidget {
  final Post post;

  const PostDelete({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () async {
        // แสดงการแจ้งเตือนก่อนลบ
        final bool? confirmDelete = await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('ยืนยันการลบ'),
              content: const Text('คุณต้องการลบโพสต์นี้จริงๆ หรือไม่?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false), // ปิดการแจ้งเตือนถ้าไม่ลบ
                  child: const Text('ยกเลิก'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true), // ยืนยันการลบ
                  child: const Text('ลบ'),
                ),
              ],
            );
          },
        );

        // ถ้าผู้ใช้ยืนยันการลบ
        if (confirmDelete == true) {
          final url = Uri.http(Configure.server, "/posts/${post.id}");
          final response = await http.delete(url);

          if (response.statusCode == 200) {
            // แสดง Snackbar หรือข้อความสำเร็จ
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("ลบโพสต์สำเร็จ")),
            );

            // กลับไปยังหน้าประวัติ
            Navigator.pushNamed(context, '/history');
          } else {
            // ถ้าลบไม่สำเร็จ
            print("Failed to delete post: ${response.statusCode}");
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("ไม่สามารถลบโพสต์ได้")),
            );
          }
        }
      },
    );
  }
}
