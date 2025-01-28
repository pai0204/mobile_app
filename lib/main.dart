import 'package:flutter/material.dart';

// นำเข้าไฟล์เพจต่างๆ
import 'page1.dart';
import 'Page2.dart';
import 'page3.dart';
import 'page4.dart';
import 'page5.dart';
import 'page6.dart';
import 'page7.dart';
import 'page8.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'การใช้งาน Route',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        // เส้นทางเริ่มต้น"/"
        '/': (context) => const Page1(
          title: "อาหารเเละของว่างที่เเนะนำ",
        ),
        // เส้นทาง"/page2"
        '/Page2': (context) => const Page2(
          title: "ก๋วยเตี๋ยว",
        ),
        // เส้นทาง"/page3"
        '/Page3': (context) => const Page3(
          title: "ผัดกระเพรา",
        ),
        // เส้นทาง"/page4"
        '/Page4': (context) =>  const Page4(
          title: "ไข่ลูกเขย",
        ),
        // เส้นทาง"/page5"
        '/Page5': (context) => const Page5(
          title: "หมูกระทะ",
        ),
        // เส้นทาง"/page6"
        '/Page6': (context) => const Page6(
          title: "ตะโก้เผือก",
        ),
        // เส้นทาง"/page7"
        '/Page7': (context) => const Page7(
          title: "ปอเปี๊ยะทอด",
        ),
        // เส้นทาง"/page8"
        '/Page8': (context) => const Page8(
          title: "เฟรนฟราย",
        ),
      },
    );
  }
}