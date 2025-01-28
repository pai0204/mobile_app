// ignore: file_names
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key, required this.title});

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  int likeCount = 0; // To keep track of the number of likes
  int dislikeCount = 0; // To keep track of the number of dislikes

  final youtubeUrl = "https://youtu.be/oFLJyxRsxvQ?si=VaHoWQbuh6rcZi7V";

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
              Navigator.pushNamed(context, '/Page3'); // ไปหน้าถัดไป
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Center(
              child: Image.asset(
                'assets/images/ก๋วยเตี๋ยว.jpg',
                width: 300,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            // Description
            const Text(
              'ก๋วยเตี๋ยว: อาหารยอดนิยมของคนไทย\n\nก๋วยเตี๋ยว เป็นหนึ่งในอาหารยอดนิยมที่คนไทยและชาวต่างชาติรู้จักเป็นอย่างดี โดยเป็นอาหารประเภทเส้นที่มีหลากหลายรูปแบบ ทั้งก๋วยเตี๋ยวน้ำ ก๋วยเตี๋ยวแห้ง หรือก๋วยเตี๋ยวต้มยำ ความหลากหลายในก๋วยเตี๋ยวนี้ขึ้นอยู่กับประเภทของเส้น น้ำซุป และเครื่องปรุงที่ใช้',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),

            // Features
            const Text(
              'ลักษณะสำคัญของก๋วยเตี๋ยว',
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
                _buildFeatureItem('1.', 'เส้นหลากหลายประเภท เช่น เส้นเล็ก เส้นใหญ่ บะหมี่ และวุ้นเส้น'),
                const SizedBox(height: 8),
                _buildFeatureItem('2.', 'น้ำซุปกลมกล่อม เช่น น้ำซุปกระดูกหมูหรือกระดูกไก่'),
                const SizedBox(height: 8),
                _buildFeatureItem('3.', 'เนื้อสัตว์และเครื่องเคียง เช่น หมู ไก่ กุ้ง ลูกชิ้น และเครื่องใน'),
                const SizedBox(height: 8),
                _buildFeatureItem('4.', 'เครื่องปรุงรส เช่น น้ำปลา น้ำตาล น้ำส้มสายชู และพริกป่น'),
              ],
            ),

            const SizedBox(height: 50),

            // Like and Dislike Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                const SizedBox(width: 20),
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

            // Buttons
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: const Text('เปิดหน้าที่ 1'),
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

  // Method for creating feature items
  Widget _buildFeatureItem(String number, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            description,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
