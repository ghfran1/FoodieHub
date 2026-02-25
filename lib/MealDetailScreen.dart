import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cart_bloc/cart_bloc.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartBloc(),
      child: Directionality(
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
                            // نداء ميثود السعر والكمية
                            _buildPriceAndQuantityRow(context),
                            const SizedBox(height: 25),

                            // --- قسم الحجم ---
                            _buildSectionHeader("الحجم", "الزامي"),
                            BlocBuilder<CartBloc, CartState>(
                              builder: (context, state) {
                                return Column(
                                  children: [
                                    _buildOptionRow(
                                      "سنجل",
                                      "0.00 د.ك",
                                      state.selectedSize == "سنجل",
                                      () => context.read<CartBloc>().add(SelectSize("سنجل")),
                                    ),
                                    _buildOptionRow(
                                      "دبل",
                                      "0.50 د.ك",
                                      state.selectedSize == "دبل",
                                      () => context.read<CartBloc>().add(SelectSize("دبل")),
                                    ),
                                  ],
                                );
                              },
                            ),

                            const SizedBox(height: 20),

                            // --- قسم الإضافات ---
                            _buildSectionHeader("الإضافات", "اختياري"),
                            BlocBuilder<CartBloc, CartState>(
                              builder: (context, state) {
                                return Column(
                                  children: [
                                    _buildOptionRow(
                                      "سلطة",
                                      "0.00 د.ك",
                                      state.selectedExtras.contains("سلطة"),
                                      () => context.read<CartBloc>().add(ToggleExtra("سلطة")),
                                    ),
                                    _buildOptionRow(
                                      "حار",
                                      "0.00 د.ك",
                                      state.selectedExtras.contains("حار"),
                                      () => context.read<CartBloc>().add(ToggleExtra("حار")),
                                    ),
                                    _buildOptionRow(
                                      "عادي",
                                      "0.00 د.ك",
                                      state.selectedExtras.contains("عادي"),
                                      () => context.read<CartBloc>().add(ToggleExtra("عادي")),
                                    ),
                                  ],
                                );
                              },
                            ),
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
      ),
    );
  }

  // --- ميثود الصورة ---
  Widget _buildTopImageSection(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 300,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFFFDEBED),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40)),
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

  // --- ميثود السعر والكمية ---
  Widget _buildPriceAndQuantityRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "2.20 د.ك",
          style: GoogleFonts.notoKufiArabic(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color.fromARGB(255, 247, 248, 249)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Row(
                children: [
                  IconButton(
                    onPressed: () => context.read<CartBloc>().add(DecrementQuantity()),
                    icon: Image.asset('images/minus.png', width: 20),
                  ),
                  Text(
                    "${state.quantity}",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () => context.read<CartBloc>().add(IncrementQuantity()),
                    icon: Image.asset('images/add.png', width: 20),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  // --- ميثود رأس القسم ---
  Widget _buildSectionHeader(String title, String tag) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: GoogleFonts.notoKufiArabic(fontSize: 16, fontWeight: FontWeight.bold)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: tag == "الزامي" ? const Color(0xFFFDBCB5) : const Color(0xFFF5C495),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(tag,
              style: GoogleFonts.notoKufiArabic(
                  fontSize: 12, color: const Color.fromARGB(245, 85, 64, 1))),
        ),
      ],
    );
  }

  // --- ميثود الصفوف الاختيارية ---
  Widget _buildOptionRow(String label, String price, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  isSelected ? Icons.check_circle : Icons.radio_button_off,
                  color: isSelected ? const Color(0xFFF55540) : Colors.grey,
                  size: 22,
                ),
                const SizedBox(width: 10),
                Text(
                  label,
                  style: GoogleFonts.notoKufiArabic(
                    fontSize: 14,
                    color: isSelected ? const Color(0xFFF55540) : Colors.black,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            ),
            Text(
              price,
              style: GoogleFonts.notoKufiArabic(
                fontSize: 14,
                color: isSelected ? const Color(0xFFF55540) : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- زر إضافة للسلة ---
  Widget _buildAddToCartButton() {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
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
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text("${state.quantity}",
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text("إضافه إلي السله",
                        style: GoogleFonts.notoKufiArabic(
                            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text("${state.totalPrice.toStringAsFixed(2)} د.ك",
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
} // القوس الأخير للكلاس