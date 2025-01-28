// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';  // นำเข้า package url_launcher

class Page7 extends StatefulWidget {
  const Page7({super.key, required this.title});

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _Page7State createState() => _Page7State();
}

class _Page7State extends State<Page7> {
  int likeCount = 0;  // To keep track of the number of likes
  int dislikeCount = 0;  // To keep track of the number of dislikes
  
  final youtubeUrl = "https://youtu.be/fE7qw4hki98?si=KQpXCO2YGsm4bJYD";
  
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
              Navigator.pushNamed(context, '/Page8'); // ไปหน้าถัดไป
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
                'assets/images/ปอเปี๊ยะทอด.jpg',
                width: 300, // Image width
                height: 200, // Image height
                fit: BoxFit.cover, // Ensure the image does not stretch or distort
              ),
            ),
            const SizedBox(height: 50), // Space between the image and text
            
            // Description of ปอเปี๊ยะทอด
            const Text(
              'ปอเปี๊ยะทอด : อาหารว่างที่ได้รับความนิยมในหลายประเทศ\n\n'
              'ปอเปี๊ยะทอดมีลักษณะเป็นแป้งบางๆ ที่ห่อด้วยส่วนผสมต่างๆ ก่อนที่จะนำไปทอดจนกรอบ '
              'มีรสชาติอร่อยและกลมกล่อมพร้อมความกรอบนอกนุ่มใน ทำให้เป็นที่ชื่นชอบในหลายๆ โอกาส '
              'โดยเฉพาะในงานเลี้ยงหรือสังสรรค์ต่างๆ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            
            const SizedBox(height: 30),

            // Title of the characteristics
            const Text(
              'ลักษณะสำคัญของปอเปี๊ยะทอด',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            
            const SizedBox(height: 10),

            // List items for ปอเปี๊ยะทอด
            _buildStep(1, 'แป้งปอเปี๊ยะ: ใช้แผ่นแป้งบางๆ ที่เหนียวนุ่ม และกรอบเมื่อทอด เสริมรสชาติและความกรอบให้อาหาร'),
            _buildStep(2, 'ไส้ภายใน: ปอเปี๊ยะทอดสามารถมีไส้หลากหลาย เช่น เนื้อหมูสับ, กุ้ง, ผัก, หรือเห็ด โดยมีการปรุงรสด้วยเครื่องเทศต่างๆ'),
            _buildStep(3, 'รสชาติ: รสชาติกลมกล่อมจากเครื่องเทศที่ใช้ในไส้ เช่น ซีอิ๊วขาว, น้ำมันหอย, กระเทียม และพริกไทย ที่ผสมผสานได้อย่างลงตัว'),
            _buildStep(4, 'การทอด: ทอดในน้ำมันร้อนจนแป้งกรอบ มีสีทองและสัมผัสกรอบนอกนุ่มใน'),
            _buildStep(5, 'น้ำจิ้ม: ปอเปี๊ยะทอดมักเสิร์ฟพร้อมน้ำจิ้มหลากหลายประเภท เช่น น้ำจิ้มบ๊วย หรือซอสเปรี้ยวหวานเพื่อเพิ่มรสชาติ'),
            
            const SizedBox(height: 30),

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
            
            const SizedBox(height: 30),

            // Center the "Open Page 1" button
            Center(
              child: ElevatedButton(
                child: const Text('เปิดหน้าที่ 1'),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
            ),

            // ปุ่มเปิดลิงก์ YouTube
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
