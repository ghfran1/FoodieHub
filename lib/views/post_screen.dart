// lib/features/posts/views/post_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../controller/post_cuibt.dart';
import '../controller/post_state.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostController()..fetchPosts(),
      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,

          leading: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              'images/Bell.png',
              width: 24,
              height: 24,
            ),
          ),

          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.near_me_outlined, color: Colors.orange, size: 18),
                  Text(
                    " الموقع الحالي ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Text(
                "19 الشيخ احمد الصاوي ، مدينة نصر",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),

          centerTitle: true,

         
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('images/boy.png'),
              ),
            ),
          ],
        ),

        body: BlocBuilder<PostController, PostState>(
          builder: (context, state) {
            if (state is PostLoading) {
              return Center(
                child: LottieBuilder.asset('assets/loading.json'),
              );
            }

            else if (state is PostLoaded) {
              return ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 10), 
                itemCount: state.posts.products.length,
                itemBuilder: (context, index) {
                  final product = state.posts.products[index];

                  return Column(
                    children: [

                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                          
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [

                                  Text(
                                    product.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),

                                  const SizedBox(height: 5),

                                  Text(
                                    product.description,
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 13,
                                    ),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.right,
                                  ),

                                  const SizedBox(height: 10),

                                  Text(
                                    "${product.price} ج.م",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(width: 15),


                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFF1F1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'images/fastfood.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),

                     
                      const Divider(
                        thickness: 1,
                        color: Color(0xFFE0E0E0),
                      ),

                      const SizedBox(height: 10),

                    ],
                  );
                },
              );
            }

            else if (state is PostError) {
              return Center(child: Text(state.message));
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}