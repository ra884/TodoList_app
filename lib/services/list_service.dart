import 'package:dio/dio.dart';
import 'package:to_do_list_app/models/list_model.dart';

class ListService {
  static Dio dio = Dio();
  static Future<TodoItems> GetTodoItems() async {
    try {
      Response response = await dio.get(
        "https://mytodoapi.runasp.net/api/TodoItems/",
      );
      return TodoItems.fromjson(response.data);
    } on DioException catch (dioError) {
      throw Exception(dioError.message);
    } catch (anotherError) {
      throw Exception(anotherError.toString());
    }
  }

  static Future<void> CreateTodoItem({required String title}) async {
    try {
      Response response = await dio.post(
        "https://mytodoapi.runasp.net/api/TodoItems/",
        data: {"Title": title},
      );
    } on DioException catch (dioError) {
      throw Exception(dioError.message);
    } catch (anotherError) {
      throw Exception(anotherError.toString());
    }
  }

  static Future<void> UpdateTodoItem({
    required int id,
    required String title,
  }) async {
    try {
      Response response = await dio.put(
        "https://mytodoapi.runasp.net/api/TodoItems/${id}",
        data: {"Title": title},
      );
    } on DioException catch (dioError) {
      throw Exception(dioError.message);
    } catch (anotherError) {
      throw Exception(anotherError.toString());
    }
  }

  static Future<void> DeleteTodoItem({required int id}) async {
    try {
      Response response = await dio.delete(
        "https://mytodoapi.runasp.net/api/TodoItems/${id}",
      );
    } on DioException catch (dioError) {
      throw Exception(dioError.message);
    } catch (anotherError) {
      throw Exception(anotherError.toString());
    }
  }
}
