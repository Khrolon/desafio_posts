import 'package:get/get.dart';

const baseUrl = 'https://jsonplaceholder.typicode.com/posts';

class PostApi extends GetConnect {
  
// Get request
  Future<Response> getPostResponse() => get('https://jsonplaceholder.typicode.com/posts');
}
