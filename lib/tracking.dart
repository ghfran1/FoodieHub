import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class OrderTrackingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
       leading: Padding(
  padding: const EdgeInsets.all(8.0),
  child: Image.asset(
    'images/Bell.png', 
    width: 24,
    height: 24,
  ),
),

        title: Text('تتبع الطلب', 
        style:GoogleFonts.notoKufiArabic(color: Colors.black, fontWeight: FontWeight.bold)  ),
        centerTitle: true,
        actions: [
       Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
    width: 80,
    height: 80,
    padding: const EdgeInsets.fromLTRB(9, 6, 9, 6),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
    ),
    child: Image.asset(
      'images/Left action.png',
      fit: BoxFit.contain,
    ),
  ),
),



        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [

           Container(
  width: 350, 
  height: 235.85, 
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
  ),
  child: ClipRRect( 
    borderRadius: BorderRadius.circular(10),
    child: Image.asset(
      'images/cuate.png', 
      width: 350,
      height: 235.85,
      fit: BoxFit.cover, 
    ),
  ),
),
            SizedBox(height: 20),

             Container(
 
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "سيتم توصيل طعامك خلال",
        style:          
        GoogleFonts.notoKufiArabic(
          fontSize: 18, 
          color: Colors.grey[600],
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 2),
       
      Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
   
    Text(
      "دقيقة",
      style: GoogleFonts.notoKufiArabic(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Colors.orange,
        height: 1.0, // line-height: 100%
      ),
    ),
    const SizedBox(width: 5), 
  
    Text(
      "20/15",
      style: GoogleFonts.notoKufiArabic(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Colors.black,
        height: 1.0,
      ),
    ),
  ],
)
    ],  
  ),
),
 
            Divider(height: 30),

          
            Align(
              alignment: Alignment.centerRight,
              child: Text("معلومات الطلب", style: GoogleFonts.notoKufiArabic (fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("معكرونه بالصوص و قطع بانية حار", style:  GoogleFonts.notoKufiArabic(fontWeight: FontWeight.bold, fontSize: 13)),
                      Text(
                        "هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة",
                        textAlign: TextAlign.right,
                        style: GoogleFonts.notoKufiArabic(color: const Color.fromARGB(255, 8, 8, 8), fontSize: 12),
                      ),
                      Text("د.ك2.20  ", style: GoogleFonts.notoKufiArabic(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
                    ],
                  ),
                ),
              
   const SizedBox(width: 15),



               ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child:  Image.asset(
                    'images/Basta.png',  
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10),

              ],
            ),
            
            SizedBox(height: 20),

              Divider(height: 30),

            // تفاصيل الفاتورة
            _buildDetailRow("رقم التعريف بالطلب", "#8456156"),
            _buildDetailRow("كود التحقق", "1973"),
            _buildDetailRow("عدد العناصر", "1"),

        

            // el asrar
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.redAccent),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text("الغاء الطلب", style: GoogleFonts.notoKufiArabic(color: Colors.redAccent, fontSize: 18)),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text("تتبع الطلب", style: GoogleFonts.notoKufiArabic(color: Colors.white, fontSize: 18)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(value, style:GoogleFonts.notoKufiArabic(color: const Color.fromARGB(255, 16, 16, 16))),
          Text(label, style:GoogleFonts.notoKufiArabic(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}