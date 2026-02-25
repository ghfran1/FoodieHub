abstract class CartEvent {}

class IncrementQuantity extends CartEvent {}
class DecrementQuantity extends CartEvent {}


// لازم تضيف دول عشان الـ Bloc يشوفهم
class SelectSize extends CartEvent {
  final String size;
  SelectSize(this.size);
}

class ToggleExtra extends CartEvent {
  final String extra;
  ToggleExtra(this.extra);
}