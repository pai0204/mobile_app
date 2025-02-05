// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

importyyy 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key, required this.title});

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  int likeCount = 0; // To keep track of the number of likes
  int dislikeCount = 0; // To keep track of the number of dislikes

  final youtubeUrl = "https://youtu.be/zLpT-JiPPQo?si=1ZO1m-T6UQ810XMU";

  Future<void> _launchYoutube() async {
    final Uri url = Uri.parse(youtubeUrl);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, '/Page4'); // ไปหน้าถัดไป
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0), // Add padding around the content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section
            Center(
              child: Image.asset(
                'assets/images/ผัดกระเพรา.jpg',
                width: 300,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20), // Space between the image and text

            // Introduction text
            const Text(
              'ผัดกะเพรา : อาหารยอดนิยมของคนไทย\n\n'
              'เป็นที่รู้จักทั้งในและต่างประเทศ ด้วยรสชาติที่จัดจ้าน เผ็ดร้อน และมีกลิ่นหอมเฉพาะตัวของใบกะเพรา '
              'เป็นเมนูที่ทำง่ายและสามารถดัดแปลงวัตถุดิบได้หลากหลาย เช่น หมู ไก่ กุ้ง เนื้อวัว หรือแม้แต่เต้าหู้สำหรับผู้ที่ทานมังสวิรัติ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),

            // Section: Key characteristics of Pad Krapow
            const Text(
              'ลักษณะสำคัญของผัดกะเพรา',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStep(1, 'กลิ่นหอมเฉพาะตัวจากใบกะเพรา ที่ช่วยเพิ่มความเผ็ดร้อนให้กับอาหาร'),
                _buildStep(2, 'รสชาติที่ครบเครื่อง ทั้งเผ็ด เค็ม หวาน และกลมกล่อม'),
                _buildStep(3, 'วัตถุดิบหลากหลายที่สามารถเลือกปรับเปลี่ยนได้ตามความชอบ เช่น หมู ไก่ กุ้ง หรือเต้าหู้'),
                _buildStep(4, 'นิยมทานคู่กับข้าวสวยร้อน ๆ และไข่ดาว เพื่อเพิ่มความอร่อย'),
              ],
            ),
            const SizedBox(height: 20),

            // Like and Dislike Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Like button
                IconButton(
                  icon: const Icon(Icons.thumb_up, color: Colors.blue),
                  onPressed: () {
                    setState(() {
                      likeCount++;
                    });
                  },
                ),
                Text(
                  '$likeCount Likes',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 20), // Space between buttons

                // Dislike button
                IconButton(
                  icon: const Icon(Icons.thumb_down, color: Colors.red),
                  onPressed: () {
                    setState(() {
                      dislikeCount++;
                    });
                  },
                ),
                Text(
                  '$dislikeCount Dislikes',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Navigation and external links
            Center(
              child: ElevatedButton(
                child: const Text('เปิดหน้าที่ 1'),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: _launchYoutube,
                child: const Text('ดูวิดีโอ'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method for creating step text
  Widget _buildStep(int stepNumber, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$stepNumber.',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
