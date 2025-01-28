// ignore: file_names
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Page5 extends StatefulWidget {
  const Page5({super.key, required this.title});

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _Page5State createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  int likeCount = 0;  // To keep track of the number of likes
  int dislikeCount = 0;  // To keep track of the number of dislikes

  final youtubeUrl = "https://youtu.be/43qBCUb5WZ4?si=V6MrHTBYpy1UT9h0";

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
              Navigator.pushNamed(context, '/Page6'); // ไปหน้าถัดไป
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0), // Add padding around the content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Center the image
            Center(
              child: Image.asset(
                'assets/images/หมูกระทะ.jpg',
                width: 300, // Image width
                height: 200, // Image height
                fit: BoxFit.cover, // Ensure the image does not stretch or distort
              ),
            ),
            const SizedBox(height: 20), // Space between the image and text
            // Text describing the steps
            const Text(
              'หมูกระทะ : อาหารยอดนิยมในประเทศไทย\n\n'
              'ลักษณะการรับประทานแบบหม้อร้อน ซึ่งนิยมรับประทานกันเป็นกลุ่ม โดยเฉพาะในงานสังสรรค์หรือการพบปะสังสรรค์กับเพื่อนหรือครอบครัว',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            // Moo Krata description in steps
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'ลักษณะของหมูกระทะ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                // List items for Moo Krata
                _buildStep(1, 'หม้อร้อน: หมูกระทะจะมีหม้อเหล็กที่มีช่องกลางสำหรับย่างเนื้อและรอบๆ สำหรับต้มซุปหรือผักต่างๆ โดยมักจะมีแผ่นโลหะรูปทรงคล้ายกระทะหรือวงกลมที่มีร่องกลางลึก'),
                _buildStep(2, 'เนื้อหมูและวัตถุดิบ: มีลูกชิ้นหมู, เนื้อหมูหั่นบางๆ และผักสด เช่น ผักบุ้ง, คะน้า, เห็ด ที่จะนำมาหมักในน้ำซอสที่มีรสชาติเปรี้ยวหวานเค็ม'),
                _buildStep(3, 'การย่างและต้ม: ส่วนกลางของหม้อจะเป็นแผ่นโลหะร้อนใช้ในการย่างเนื้อหมู และรอบๆ ใช้ต้มซุปพร้อมผักต่างๆ เช่น ผักบุ้ง, เห็ด, ข้าวโพด'),
                _buildStep(4, 'น้ำจิ้ม: มีน้ำจิ้มหลากหลายประเภท เช่น น้ำจิ้มซีฟู้ดที่มีรสเปรี้ยวเผ็ด หรือน้ำจิ้มงาที่มีรสชาติกลมกล่อมเพื่อเพิ่มความอร่อยในการรับประทาน'),
               
                const SizedBox(height: 20), // Space between text and buttons
              ],
            ),
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
            const SizedBox(height: 20), // Space between buttons and the next content

            // Center the "Open Page 1" button
            Center(
              child: ElevatedButton(
                child: const Text('เปิดหน้าที่ 1'),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
            ),
            const SizedBox(height: 10),
            // Center the "Watch Video" button
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
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
