import 'package:flutter/material.dart';
import 'tracking.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, 
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack( 
          children: [
            SingleChildScrollView(


              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  _buildTopBanner(),
                  
                  _buildRestaurantInfo(),

                  _buildCategoriesFilter(),

                  _buildFoodGrid(),

                  const Padding(
                    padding: EdgeInsets.all(15),
                    child: Text("🍕 بيتزا", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  ),

               
                  _buildDetailedFoodList(),
                  
                  const SizedBox(height: 100), 
                ],
              ),
            ),

            
            _buildCartButton(context),
          ],
        ),
      ),
    );
  }



  Widget _buildTopBanner() {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/banner.png'), 
          fit: BoxFit.cover,
        ),
      ),
    );
  }


Widget _buildRestaurantInfo() {
  return Container(
    margin: const EdgeInsets.all(15),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: Colors.grey.shade200),
    ),


    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'images/rice.png',
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(width: 10), 

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("اسم المطعم هنا",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              
              const SizedBox(height: 5),


              Row(
                children: [
                  Image.asset('images/brger.png', width: 15, height: 15),
                  const SizedBox(width: 5),
                  const Text("طعام بحري ، مشويات",
                      style: TextStyle(fontSize: 13, color: Colors.grey)),
                ],
              ),

              const SizedBox(height: 5),

              
              Row(
                children: [
                  Image.asset('images/Star.png', width: 15, height: 15),
                  const SizedBox(width: 5),
                  const Text("5.0 (100)", style: TextStyle(fontSize: 12)),
                ],
              ),

              const SizedBox(height: 5),

             
              Row(
                children: [
                  Image.asset('images/fast.png', width: 15, height: 15),
                  const SizedBox(width: 5),
                  const Text("متاح التوصيل",
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ],
          ),
        ),

     
        Column(
          children: [
            Image.asset('images/heart.png', width: 22, height: 22),
            const SizedBox(height: 20),
            Image.asset('images/Vector.png', width: 22, height: 22),
          ],
        ),
      ],
    ),
  );
}










Widget _buildCategoriesFilter() {
  
  List<Widget> cats = [
    Image.asset('images/new.png', width: 30),
    Text("🔥 الأفضل"),
    Text("بيتزا"),
    Text("حلويات"),
    Text("مشروبات"),
  ];

  return SizedBox(
    height: 50,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: cats.length,
      itemBuilder: (context, index) {
        Color borderColor;

        if (index == 0 || index == 1) {
        
          borderColor = Colors.orange;
        } else {
         
          borderColor = const Color.fromARGB(255, 113, 109, 109);
        }

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: borderColor, width: 1),
          ),
          child: Center(
            child: cats[index],
          ),
        );
      },
    ),
  );
}




Widget _buildFoodGrid() {
  final List<String> foodImages = [
    'images/grill.png',
    'images/pasta.png',
    'images/makarona.png',
    'images/gpasta.png',
  ];

  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    padding: const EdgeInsets.all(15),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.82,
      crossAxisSpacing: 12,
      mainAxisSpacing: 15,
    ),
    itemCount: foodImages.length,
    itemBuilder: (context, index) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: index == 0 ? const Color.fromARGB(217, 226, 203, 167): Colors.transparent, // الخلفية البرتقالية للصورة الأولى
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  foodImages[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            "معكرونه بالصوص و قطع بانية حار",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            textAlign: TextAlign.right,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Align(
            alignment: Alignment.centerRight, 
            child: const Text(
              "2.20 د.ك",
              style: TextStyle(color: Colors.grey, fontSize: 12),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      );
    },
  );
}






Widget _buildDetailedFoodList() {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: 3,
    itemBuilder: (context, index) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xFFEEEEEE), width: 1)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'images/Basta.png',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15),
           
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end, 
                children: [
                  // العنوان
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "معكرونه بالصوص و قطع بانية حار",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold, 
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  // الوصف
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص...",
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
                        color: Colors.grey, 
                        fontSize: 12,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // السعر
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "2.20 د.ك",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold, 
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
  }


Widget _buildCartButton(BuildContext context) { 
  return Align(
    alignment: Alignment.bottomCenter,
    child: GestureDetector(
      onTap: () {
       
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OrderTrackingScreen()),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: const Color(0xFFF7A899), 
          borderRadius: BorderRadius.circular(15),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3), 
                borderRadius: BorderRadius.circular(10)
              ),
              child: const Text("0", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            const Text("الإطلاع علي السلة", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            const Text("0.00 ج.م", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    ),
  );
}