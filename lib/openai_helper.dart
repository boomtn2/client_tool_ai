import 'package:dio/dio.dart';

class OpenaiHelper {
  final baseOption = BaseOptions(
      method: 'POST', baseUrl: 'https://api.openai.com/v1/embeddings');
  final option = Options(
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $keyOpenAI'
    },
  );

  Dio dio = Dio();

  Future<List?> getEmbedding(String text) async {
    // print('RESPONSE ${text}');

    final response = await dio.post(
      'https://api.openai.com/v1/embeddings',
      options: option,
      data: {
        "input": text,
        "model": "text-embedding-3-small",
      },
    );

    // print('RESPONSE ${response}');
    return response.data['data'][0]['embedding'];
  }
}
