import 'package:flutter/material.dart';
import 'second_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'MealDetailScreen.dart'; 
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     
      theme: ThemeData(
        textTheme: GoogleFonts.notoKufiArabicTextTheme(),
      ),
      // MainScreen
      home: const MainScreen(),
    );
  }
}

//(Bottom Navigation Bar)
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

// Navigation Pages List 

 final List<Widget> _pages = [
    const FoodAppDetail(), // صفحتك الأصلية
    const Center(child: Text("المفضلة")),
    const Center(child: Text("السلة")), 
    const Center(child: Text("طلباتي")),
    const Center(child: Text("حسابي")),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: _pages[_selectedIndex],

        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() => _selectedIndex = 2),
          backgroundColor: const Color(0xFFFF5722),
          shape: const CircleBorder(), 
          child: Image.asset(
    'images/shopping-cart.png', 
    width: 160, 
    height: 160,
    
        ),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(), 
          notchMargin: 8.0,
          color: Colors.white,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

             IconButton(
  icon: Image.asset('images/Chats.png', width: 40, height: 40),
  onPressed: () {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => MainScreen()), 
      (Route<dynamic> route) => false, 
    );
  },
),

               IconButton(
                   icon: Image.asset(
                     'images/heart.png',  width: 24,  height: 24,
    color: _selectedIndex == 1 ? const Color(0xFFFF5722) : const Color.fromARGB(255, 13, 13, 13),
  ),
  onPressed: () => setState(() => _selectedIndex = 1),
),
              
                const SizedBox(width: 40),
               
               
               
                IconButton(
                   icon: Image.asset(
                     'images/bag-happy.png', 
                       width: 24, 
                        height: 24,
    color: _selectedIndex == 1 ? const Color(0xFFFF5722) : const Color.fromARGB(255, 21, 21, 21),
  ),
  onPressed: () => setState(() => _selectedIndex = 3),
),

                IconButton(
                   icon: Image.asset(
                     'images/frame.png',
                       width: 24, 
                        height: 24,
                     color: _selectedIndex == 1 ? const Color(0xFFFF5722) : const Color.fromARGB(255, 26, 25, 25),
                 ),
                     onPressed: () => setState(() => _selectedIndex = 4),
                      ),

             ],
            ),
          ),
        ),
      ),
    );
  }
}



class FoodAppDetail extends StatelessWidget {
  const FoodAppDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container( 
      color: const Color(0xFFF9F9F9),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              _buildSearchBar(),
              _buildCategories(),
              _buildPromotionBanner(),
              _buildSectionTitle(),
              _buildFoodGrid(context),
            ],
          ),
        ),
      ),
    );
  }
}





// 1. Header Section (Location & Profile)
 Widget _buildHeader() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       // Image with Border
        Container(
          padding: const EdgeInsets.all(0), 
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),

          child: const CircleAvatar(
            radius: 22,
            backgroundColor:Colors.white10,
            backgroundImage: AssetImage('images/boy.png'),
          ),
        ),

        // text
        Column(
          children: [
            Row(
              children: const [
                Icon(Icons.near_me_outlined, color: Colors.orange, size: 18),
                Text(
                  " الموقع الحالي ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),

            const Text(
              "19 الشيخ احمد الصاوي ، مدينة نصر",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),

       // Icon without border
        Container(
        width: 32,
        height: 32,
        child: Image.asset('images/Bell.png'),
),

      ],
    ),
  );
}


  // 2. شريط البحث
 Widget _buildSearchBar() {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Container(
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: const Color(0xFFFF5722).withOpacity(0.5)),
      ),

      child: TextField(
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintText: "تبحث عن وجبة معينة ؟",
          hintStyle: const TextStyle(color: Color(0xFFFFCCBC)),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              'images/serch.png',
              width: 20,
              height: 20,
            ),
          ),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
      ),
    ),
  );
}


// 3. Categories Section (Horizontal List)
Widget _buildCategories() {

  final categories = [
    {
      'name': 'وجبات سريعة',  'color': const Color(0xFFF55540),  'img': 'images/fastfood.png'
    },
    {
      'name': 'مشويات', 'color': const Color(0xFFFCCAC4), 'img': 'images/grill.png'
    },
    {
      'name': 'ماكولات بحرية',  'color': const Color(0xFF00A991), 'img': 'images/seafood.png'
    },
    {
      'name': 'لحوم', 'color': const Color(0xFFB0E4DD), 'img': 'images/meat.png'
    },
  ];

 return SizedBox(
    height: 150,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),


          child: GestureDetector(
            onTap: () {
              if (categories[index]['name'] == 'مشويات') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MealDetailScreen()),
                );
              }
            },
            child: Column(
            children: [

              // مربع الصورة
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: categories[index]['color'] as Color,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Image.asset(
                    categories[index]['img'].toString(),
                    width: 66,
                    height: 66,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              
              Text(
                categories[index]['name'].toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
              ),
        );
      },
    ),
  );
}


  // 4. Banner 
 Widget _buildPromotionBanner() {
  return Container(
    margin: const EdgeInsets.all(20),
    width: double.infinity,
    height: 180,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      image: const DecorationImage(
        image: AssetImage('images/banner.png'), 
        fit: BoxFit.cover, 
      ),
    ),
  );
}


// 5. "Best of the Day" Title
  
  Widget _buildSectionTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: const [
          Text("🔥 الافضل خلال اليوم", 
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }












Widget _buildFoodGrid(BuildContext context) {
  return GridView.count(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    crossAxisCount: 2,
    padding: const EdgeInsets.symmetric(horizontal: 15),
    childAspectRatio: 0.68,
    mainAxisSpacing: 15,
    crossAxisSpacing: 15,
    children: [
      _foodCardWithInfo(
        context,
        "بيج بيرجر سبايسي",
        "150 ج.م",
        'images/seafood.png',
        5.0,
        "100+",
      ),
      _foodCardWithInfo(
        context,
        "بيج بيرجر سبايسي",
        "150 ج.م",
        'images/fastfood.png',
        5.0,
        "100+",
      ),
    ],
  );
}


Widget _foodCardWithInfo(
  BuildContext context,
  String name,
  String price,
  String img,
  double rating,
  String reviews,
) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SecondPage()),
      );
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       
        Container(
          height: 130,
          decoration: BoxDecoration(
            color: const Color(0xFFFDEBED),
          ),
          child: Stack(
            children: [
              Center(
                child: Image.asset(
                  img, 
                  fit: BoxFit.contain),
              ),

            
            ],
          ),
        ),

        const SizedBox(height: 8),

        // الاسم
        Text(
          name,
          style: GoogleFonts.notoKufiArabic(
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
       // Food Type + Image Icon
        Row(
          children: [
            Image.asset('images/brger.png', width: 16),
          
            Text(
              "وجبات سريعة",
              style: GoogleFonts.notoKufiArabic(
             
                fontSize: 11,
              ),
            ),
          ],
        ),

        const SizedBox(height: 6),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // السعر والتقييم
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset('images/Star.png', width: 14),
                    Text(
                      " $rating ($reviews)",
                      style: const TextStyle(fontSize: 11),
                    ),
                  ],
                ),
                Text(
                  price,
                  style: GoogleFonts.notoKufiArabic(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),


          
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFFF5722),
               borderRadius: const BorderRadius.only(     
      topRight: Radius.circular(12),      
      bottomLeft: Radius.circular(12),  
    ),
              ),

              child: Image.asset(    
                'images/Group.png',
                width: 20,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
