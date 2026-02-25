import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_event.dart';
import 'cart_state.dart';

export 'cart_state.dart';
export 'cart_event.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState(quantity: 1)) {
    
    // 1. زيادة الكمية
    on<IncrementQuantity>((event, emit) {
      emit(CartState(
        quantity: state.quantity + 1,
        selectedSize: state.selectedSize,
        selectedExtras: state.selectedExtras,
      ));
    });

    // 2. نقص الكمية
    on<DecrementQuantity>((event, emit) {
      if (state.quantity > 1) {
        emit(CartState(
          quantity: state.quantity - 1,
          selectedSize: state.selectedSize,
          selectedExtras: state.selectedExtras,
        ));
      }
    });

    // 3. اختيار الحجم (سنجل أو دبل)
    on<SelectSize>((event, emit) {
      emit(CartState(
        quantity: state.quantity,
        selectedSize: event.size,
        selectedExtras: state.selectedExtras,
      ));
    });

    // 4. إضافة أو حذف الإضافات
    on<ToggleExtra>((event, emit) {
      List<String> newList = List.from(state.selectedExtras);
      if (newList.contains(event.extra)) {
        newList.remove(event.extra);
      } else {
        newList.add(event.extra);
      }
      emit(CartState(
        quantity: state.quantity,
        selectedSize: state.selectedSize,
        selectedExtras: newList,
      ));
    });
  }
}