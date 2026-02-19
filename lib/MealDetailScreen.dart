import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    _buildTopImageSection(context),

                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         
                          Text(
                            "معكرونه بالصوص و قطع بانية حار",
                            style: GoogleFonts.notoKufiArabic(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص.",
                            style: GoogleFonts.notoKufiArabic(
                              color: const Color.fromARGB(255, 8, 8, 8),
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 20),

                          
                          _buildPriceAndQuantityRow(),
                          const SizedBox(height: 25),

                        
                          _buildSectionHeader("الحجم", "الزامي"),
                          _buildOptionRow("سنجل", "0.50 د.ك"),
                          _buildOptionRow("دبل", "0.50 د.ك"),
                          const SizedBox(height: 20),

                         
                          _buildSectionHeader("الإضافات", "اختياري"),
                          _buildOptionRow("سلطة", "0.00 د.ك"),
                          _buildOptionRow("حار", "0.00 د.ك"),
                          _buildOptionRow("عادي", "0.00 د.ك"),


                         _buildSectionHeader("النوع", "الزامى"),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            _buildAddToCartButton(),
          ],
        ),
      ),
    );
  }

  

  
  Widget _buildTopImageSection(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 300,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFFFDEBED),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
          ),
          child: Center(
            child: Image.asset('images/grill.png', fit: BoxFit.contain, width: 250),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset('images/Left action.png', width: 40, height: 40),
                ),
               
                Image.asset('images/Bell.png', width: 40, height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }

 
  Widget _buildPriceAndQuantityRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "2.20 د.ك",
          style: GoogleFonts.notoKufiArabic(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
          border: Border.all(color: const Color.fromARGB(255, 247, 248, 249)),
          ),
          child: Row(
            children: [
              IconButton(onPressed: () {}, icon: Image.asset('images/minus.png', width: 20)),
              Text("1", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
             IconButton(onPressed: () {}, icon: Image.asset('images/add.png', width: 20)),

            ],
          ),
        ),
      ],
    );
  }

 
  Widget _buildSectionHeader(String title, String tag) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: GoogleFonts.notoKufiArabic(fontSize: 16, fontWeight: FontWeight.bold)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: tag == "الزامي" ? const Color.fromARGB(255, 253, 188, 181) : const Color.fromARGB(255, 245, 196, 165),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(tag, style: GoogleFonts.notoKufiArabic(fontSize: 12, color: tag == "الزامي" ? const Color.fromARGB(245, 85, 64, 1) :  const Color.fromARGB(245, 85, 64, 1))),
        ),
      ],
    );
  }

 
  Widget _buildOptionRow(String label, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset('images/Ellipse.png', width: 22),
              const SizedBox(width: 10),
              Text(label, style: GoogleFonts.notoKufiArabic(fontSize: 14)),
            ],
          ),
          Text(price, style: GoogleFonts.notoKufiArabic(fontSize: 14, color: const Color.fromARGB(255, 8, 8, 8))),
        ],
      ),
    );
  }
           

 
  Widget _buildAddToCartButton() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(color: Colors.white),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: const Color(0xFFF55540),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(10)),
                child: const Text("1", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            Expanded(
              child: Center(
                child: Text("إضافه إلي السله", style: GoogleFonts.notoKufiArabic(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text("150 ج.م", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}