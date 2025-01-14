import 'package:flutter/material.dart';
import 'Page1.dart';
import 'Page2.dart';
import 'Page3.dart';
import 'Page4.dart';
import 'Page5.dart';
import 'Page6.dart';
import 'Page7.dart';
import 'Page8.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'การใช้งาน Route',
      theme:ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        //เส้นทางเริ่มต้น"/"
        '/':(context)=> Page1(
          title:"อาหารและของว่าง",
       ),
        //เส้นทาง"/page2"
        '/Page2':(context)=> Page2(
          title:"ก๋วยเตี๋ยว",
       ),
        //เส้นทาง"/page3"
        '/Page3':(context)=> Page3(
          title:"ผัดกระเพรา",
        ),
         //เส้นทาง"/page4"
        '/Page4':(context)=> Page4(
          title:"ไข่ลูกเขย",
        ),
         //เส้นทาง"/page5"
        '/Page5':(context)=> Page5(
          title:"หมูกระทะ",
        ),
         //เส้นทาง"/page6"
        '/Page6':(context)=> Page6(
          title:"ตะโก้เผือก",
        ),
         //เส้นทาง"/page7"
        '/Page7':(context)=> Page7(
          title:"ปอเปี๊ยะทอด",
        ),
         //เส้นทาง"/page8"
        '/Page8':(context)=> Page8(
          title:"เฟรนฟราย",
        ),
      },
    );
  }
}