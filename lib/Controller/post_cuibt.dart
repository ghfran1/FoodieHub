import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'post_state.dart';
import '../model/post_model.dart';
class PostController extends Cubit<PostState> {
  PostController() : super(PostInitial());

  void fetchPosts() async {
    try {
      var dio = Dio();

      var response = await dio.get(
        'https://dummyjson.com/products',
      );

      log(response.statusCode.toString());
      log(response.data.toString());

      if (response.statusCode == 200) {
        ProductsResponse posts = ProductsResponse.fromJson(response.data);
        emit(PostLoaded(posts));
      } else {
        emit(PostError('Failed to load posts'));
      }

    } catch (e) {
      emit(PostError(e.toString()));
    }
  }
}