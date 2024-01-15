import '../models/user_model.dart';
import '../services/api_service.dart';
class UserRepository {
  final ApiService _apiService;

  UserRepository(this._apiService);

  Future<Welcome> getUserDetails(String userId) async {
    // Perform any necessary logic before making the API call
    final userResponse = await _apiService.getUserDetails(userId);

    // Parse the response and return a UserModel
    return Welcome.fromJson(userResponse);
  }

  // Other methods related to user data could be added here
}
