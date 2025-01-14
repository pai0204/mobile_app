import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  final String title;

  const Page1({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.indigo[100],
        leading: IconButton(
          icon: const Icon(Icons.add_business_outlined, color: Color.fromARGB(255, 50, 0, 107)),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('เมนูถูกกด')),
            );
          },
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildSectionTitle('อาหาร', screenWidth),
              const SizedBox(height: 16),
              _buildHorizontalListView(
                context,
                items: [
                  _FoodItem('assets/images/ก๋วยเตี๋ยว.jpg', 'ก๋วยเตี๋ยว', '/Page2'),
                  _FoodItem('assets/images/ผัดกระเพรา.jpg', 'ผัดกระเพรา', '/Page3'),
                  _FoodItem('assets/images/ไข่ลูกเขย.jpg', 'ไข่ลูกเขย', '/Page4'),
                  _FoodItem('assets/images/หมูกระทะ.jpg', 'หมูกระทะ', '/Page5'),
                ],
              ),
              const SizedBox(height: 32),
              _buildSectionTitle('ของว่าง', screenWidth),
              const SizedBox(height: 16),
              _buildHorizontalListView(
                context,
                items: [
                  _FoodItem('assets/images/ตะโก้เผือก.jpg', 'ตะโก้เผือก', '/Page6'),
                  _FoodItem('assets/images/ปอเปี๊ยะทอด.jpg', 'ปอเปี๊ยะทอด', '/Page7'),
                  _FoodItem('assets/images/เฟรนฟราย.jpg', 'เฟรนฟราย', '/Page8'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, double screenWidth) {
    return Center(
      child: Text(
        title,
        style: TextStyle(
          fontSize: screenWidth * 0.06,
          fontWeight: FontWeight.bold,
          color: Colors.blue[900],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildHorizontalListView(BuildContext context, {required List<_FoodItem> items}) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: _buildFoodCard(context, items[index]),
          );
        },
      ),
    );
  }

  Widget _buildFoodCard(BuildContext context, _FoodItem item) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, item.pageRoute),
      child: Container(
        width: 140,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                item.imagePath,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                item.foodName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8),
            Icon(
              Icons.food_bank_outlined , // เพิ่มไอคอนใต้ชื่อรูป
              color: const Color.fromARGB(255, 3, 128, 65),
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}

class _FoodItem {
  final String imagePath;
  final String foodName;
  final String pageRoute;

  const _FoodItem(this.imagePath, this.foodName, this.pageRoute);
}
