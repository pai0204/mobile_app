// ignore: file_names
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Page6 extends StatefulWidget {
  const Page6({super.key, required this.title});

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _Page6State createState() => _Page6State();
}

class _Page6State extends State<Page6> {
  int likeCount = 0;  // To keep track of the number of likes
  int dislikeCount = 0;  // To keep track of the number of dislikes

  final youtubeUrl = "https://youtu.be/5_ApsIOYZeA?si=aLsdt1EmckvWuF77";
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
              Navigator.pushNamed(context, '/Page7'); // ไปหน้าถัดไป
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
                'assets/images/ตะโก้เผือก.jpg',
                width: 300, // Image width
                height: 200, // Image height
                fit: BoxFit.cover, // Ensure the image does not stretch or distort
              ),
            ),
            const SizedBox(height: 20), // Space between the image and text

            // Text describing the steps
            const Text(
              'ตะโก้เผือก : เป็นขนมไทยที่มีลักษณะเด่น\n\n'
              'เนื้อสัมผัสนุ่มนวลและรสชาติหวานมันจากเผือกที่ปรุงเข้ากับกะทิ ในการทำตะโก้เผือก จะมีขั้นตอนการทำที่ละเอียดและต้องการความพิถีพิถันในการเลือกวัตถุดิบและการปรุง '
              'รสชาติของตะโก้เผือกจะมีทั้งความหอมจากเผือกและความมันจากกะทิ ซึ่งให้ความกลมกล่อมและนุ่มละมุน นอกจากนี้ยังมีการปรุงด้วยน้ำตาลและเกลือเพื่อเพิ่มรสชาติให้ลงตัว',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 20), // Space after description

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'ลักษณะสำคัญของตะโก้เผือก',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                // List items for ทะโก้เผือก
                _buildStep(1, 'เนื้อเผือกที่นุ่มและละเอียด: เผือกที่ใช้ในการทำตะโก้ต้องมีเนื้อที่แน่นและละเอียด เมื่อถูกต้มจนสุกแล้วจะมีเนื้อสัมผัสเนียนนุ่มและเข้ากันดีกับกะทิ'),
                _buildStep(2, 'กะทิ: การใช้กะทิสดหรือกะทิสำเร็จรูปช่วยให้ตะโก้เผือกมีความมันและกลิ่นหอม เสริมให้รสชาติของขนมกลมกล่อมขึ้น'),
                _buildStep(3, 'การเสิร์ฟในถ้วยเล็ก: ตะโก้เผือกมักจะเสิร์ฟในถ้วยขนาดเล็ก ซึ่งเหมาะสำหรับการรับประทานและการจัดเตรียมในงานเลี้ยงหรือโอกาสพิเศษ'),
                _buildStep(4, 'สีสัน: สีขาวนวลจากกะทิและเผือกเป็นสีหลักของตะโก้เผือก บางครั้งอาจมีการใช้ใบเตยหรือน้ำตาลเพื่อเพิ่มสีสันให้ดูสวยงาม'),
                _buildStep(5, 'รสชาติ: รสชาติหวานมันจากน้ำตาลและกะทิผสมผสานกับรสสัมผัสนุ่มจากเผือก ทำให้ตะโก้เผือกมีรสชาติกลมกล่อมและลงตัว'),
                const SizedBox(height: 20),
              ],
            ),

            const SizedBox(height: 50), // Space between text and buttons

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
