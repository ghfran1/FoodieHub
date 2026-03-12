class CartState {
  final int quantity;
  final String selectedSize;
  final List<String> selectedExtras; 
  final double basePrice; 

  
  CartState({
    required this.quantity,
    this.selectedSize = 'سنجل',
    this.selectedExtras = const [],
    this.basePrice = 2.20,
  });

 
  double get totalPrice {
    
    double sizePrice = (selectedSize == 'دبل') ? 0.50 : 0.0;
    
    
    double extrasPrice = 0.0; 

    return (basePrice + sizePrice + extrasPrice) * quantity;
  }
}