// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Page8 extends StatefulWidget {
  const Page8({super.key, required this.title});

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _Page8State createState() => _Page8State();
}

class _Page8State extends State<Page8> {
  int likeCount = 0;  // To keep track of the number of likes
  int dislikeCount = 0;  // To keep track of the number of dislikes

  final youtubeUrl = "https://youtu.be/CviwWu6fCmU?si=tcmfPBM4h15zNl8g";
  
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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0), // Add padding around the content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Center the image
            Center(
              child: Image.asset(
                'assets/images/เฟรนฟราย.jpg',
                width: 300, // Image width
                height: 200, // Image height
                fit: BoxFit.cover, // Ensure the image does not stretch or distort
              ),
            ),
            const SizedBox(height: 20), // Space between the image and text
            
            // Text describing the steps
            const Text(
              'เฟรนฟราย : อาหารที่ได้รับความนิยมทั่วโลก\n\n'
              'โดยมีลักษณะเป็นมันฝรั่งที่ถูกหั่นเป็นเส้นยาวๆ และทอดจนกรอบภายนอกและนุ่มภายใน การทำเฟรนฟรายมีหลายวิธี โดยทั่วไปจะเริ่มจากการปอกเปลือกมันฝรั่งแล้วหั่นให้เป็นเส้นยาว ขนาดบางหรือหนาขึ้นอยู่กับความชอบ หลังจากนั้นจะนำไปทอดในน้ำมันร้อนจนกรอบและมีสีทองสวยงาม '
              'บางครั้งอาจมีการปรุงรสด้วยเกลือหรือเครื่องเทศต่างๆ เพื่อเพิ่มรสชาติ โดยส่วนใหญ่แล้วเฟรนฟรายมักจะถูกเสิร์ฟเป็นของขบเคี้ยวหรืออาหารข้างเคียงกับจานหลัก เช่น แฮมเบอร์เกอร์ ชีสเบอร์เกอร์ หรือไก่ทอด',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20), // Space between text and next section
            
            const Text(
              'ลักษณะสำคัญของเฟรนฟราย',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10), // Space between title and list items

            // List items for ลักษณะสำคัญของเฟรนฟราย
            _buildStep(1, 'เนื้อสัมผัส: เฟรนฟรายที่ดีจะมีความกรอบนอกและนุ่มใน การทอดในน้ำมันร้อนช่วยให้ได้ความกรอบที่เหมาะสม'),
            _buildStep(2, 'ขนาด: เฟรนฟรายสามารถหั่นได้หลายขนาด ทั้งแบบบางและหนา ซึ่งจะมีผลต่อความกรอบและรสชาติ'),
            _buildStep(3, 'รสชาติ: รสเค็มจากเกลือและรสสัมผัสมันจากน้ำมันที่ใช้ทอด เป็นส่วนประกอบที่ทำให้เฟรนฟรายอร่อย'),
            _buildStep(4, 'การเสิร์ฟ: มักเสิร์ฟในถาดหรือถ้วยพร้อมน้ำจิ้มหลากหลายชนิด เช่น ซอสมะเขือเทศ, มายองเนส, หรือซอสทาบาสโก'),
            _buildStep(5, 'การปรับแต่งรสชาติ: สามารถปรุงรสเพิ่มเติมได้ตามชอบ เช่น การใช้เครื่องเทศอย่างพริกปาปริก้าหรือกระเทียมผงเพื่อเพิ่มรสชาติ'),
            const SizedBox(height: 20), // Space between list and buttons
            
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
            const SizedBox(height: 50), // Space between buttons and the next content
            
            // Center the "Open Page 1" button
            Center(
              child: ElevatedButton(
                child: const Text('เปิดหน้าที่ 1'),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
            ),

            const SizedBox(height: 20), // Space between the buttons

            // Center the "ดูวิดีโอ" button
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
