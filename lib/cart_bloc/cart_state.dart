class CartState {
  final int quantity;
  final String selectedSize; // 'سنجل' أو 'دبل'
  final List<String> selectedExtras; // قائمة بالإضافات
  final double basePrice; // سعر الوجبة الأساسي

  // ده الـ Constructor اللي بيجمع كل البيانات
  CartState({
    required this.quantity,
    this.selectedSize = 'سنجل',
    this.selectedExtras = const [],
    this.basePrice = 2.20,
  });

  // حسبة السعر النهائي 
  double get totalPrice {
    // لو الحجم دبل زود 0.50، لو سنجل زود 0.0
    double sizePrice = (selectedSize == 'دبل') ? 0.50 : 0.0;
    
    // هنا ممكن مستقبلاً تحدد سعر لكل إضافة، حالياً هي بـ 0.0
    double extrasPrice = 0.0; 

    return (basePrice + sizePrice + extrasPrice) * quantity;
  }
}