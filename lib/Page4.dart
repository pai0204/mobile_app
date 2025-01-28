// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore


import 'package:url_launcher/url_launcher.dart';

class Page4 extends StatefulWidget {
  const Page4({super.key, required this.title});

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  int likeCount = 0;  // To keep track of the number of likes
  int dislikeCount = 0;  // To keep track of the number of dislikes

  final youtubeUrl = "https://youtu.be/id_OPAvAuMc?si=YM-e872EsANLICNR";

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
              Navigator.pushNamed(context, '/Page5'); // Go to the next page
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
                'assets/images/ไข่ลูกเขย.jpg',
                width: 300, // Image width
                height: 200, // Image height
                fit: BoxFit.cover, // Ensure the image does not stretch or distort
              ),
            ),
            const SizedBox(height: 30), // Space between the image and text

            // Text describing the dish
            const Text(
              'ไข่ลูกเขย : อาหารไทยที่มีรสชาติกลมกล่อม\n\n'
              'และเป็นที่นิยมในครัวเรือนไทย อาหารจานนี้มีลักษณะเด่นคือ ไข่ต้มที่ถูกนำไปทอดจนด้านนอกกรอบ '
              'แล้วราดด้วยน้ำซอสที่มีรสเปรี้ยวหวาน เค็ม และเผ็ดเล็กน้อย กลายเป็นเมนูที่ทั้งเด็กและผู้ใหญ่ชื่นชอบ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 30), // Space between the description and list

            // Characteristics of the dish
            const Text(
              'ลักษณะสำคัญของไข่ลูกเขย',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            _buildStep(1, 'ไข่ต้มที่ทอดจนกรอบ: ไข่ไก่หรือไข่เป็ดต้มสุกจะถูกนำไปทอดในน้ำมันร้อนจนผิวด้านนอกกรอบเล็กน้อย และมีสีเหลืองทองสวยงาม'),
            _buildStep(2, 'ซอสรสเปรี้ยวหวานกลมกล่อม: น้ำซอสทำจากน้ำมะขามเปียก น้ำตาลปี๊บ และน้ำปลา ให้รสชาติเปรี้ยว หวาน และเค็มที่สมดุล'),
            _buildStep(3, 'การตกแต่งด้วยหอมเจียวและพริกแห้งทอด: โรยหน้าด้วยหอมเจียวกรอบและพริกแห้งทอด เพิ่มความหอมและรสชาติที่หลากหลาย'),

            const SizedBox(height: 20), // Space between the steps and buttons

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

            // Button to open the first page
            Center(
              child: ElevatedButton(
                child: const Text('เปิดหน้าที่ 1'),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
            ),

            // Button to open the YouTube video
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
