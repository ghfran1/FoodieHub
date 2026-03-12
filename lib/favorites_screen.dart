import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.notoKufiArabicTextTheme(),
      ),
      home: const FavoritesScreen(),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
    );
  }
}

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  final List<Map<String, String>> meals = const [
    {
      'name': 'اسم الوجبه هنا',
      'restaurant': 'اسم المطعم',
      'price': '250\$',
      'image': 'images/Rectangle.png',
    },
    {
      'name': 'اسم الوجبه هنا',
      'restaurant': 'اسم المطعم',
      'price': '250\$',
      'image': 'images/shrimp.png',
    },
    {
      'name': 'اسم الوجبه هنا',
      'restaurant': 'اسم المطعم',
      'price': '250\$',
      'image': 'images/octopus.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.redAccent,
            child: IconButton(
              icon: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: Text(
          'المفضلة',
          style: GoogleFonts.notoKufiArabic(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: 32,
              height: 32,
              child: Image.asset(
                'images/Bell.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: meals.length,
            itemBuilder: (context, index) {
              return FoodItemCard(
                name: meals[index]['name']!,
                restaurant: meals[index]['restaurant']!,
                price: meals[index]['price']!,
                imagePath: meals[index]['image']!,
              );
            },
          ),
        
        ],
      ),
    );
  }
 
}

class FoodItemCard extends StatelessWidget {
  final String name;
  final String restaurant;
  final String price;
  final String imagePath;

  const FoodItemCard({
    super.key,
    required this.name,
    required this.restaurant,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
         
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 80,
                height: 80,
                color: Colors.grey[200],
                child: const Icon(Icons.image_not_supported),
              ),
            ),
          ),
          const SizedBox(width: 15),
          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  restaurant,
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
                    
                    const SizedBox(width: 10),

    Image.asset(
      'images/Stars.png', 
      width: 16,
      height: 16,
    ),

    const SizedBox(width: 4),

    const Text(
      '0.0',
      style: TextStyle(fontSize: 12),
    ),

    const SizedBox(width: 2),

    Text(
      '(0)',
      style: TextStyle(
        color: Colors.grey.shade400,
        fontSize: 12,
      ),
    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          
        Column(
  children: [
    Image.asset(
      'images/hearts.png',
      width: 24,
      height: 24,
    ),

    const SizedBox(height: 15),

    Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
          
          color: const Color.fromARGB(0, 0, 0, 0).withOpacity(0.1), 
        blurRadius: 10, 
        spreadRadius: 1,
         
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Image.asset(
          'images/add.png',
          width: 20,
          height: 20,
         
        ),
      ),
    ),
  ],
) 
   ], 
      ),  
    );   
  }
}