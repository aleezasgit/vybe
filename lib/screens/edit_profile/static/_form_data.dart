part of '../edit_profile.dart';

class _FormData {
  static Map<String, dynamic> initialValues() {
    if (!kDebugMode) {
      return {};
    }

    return {
      _FormKeys.userName: '',
      _FormKeys.email: '',
      _FormKeys.phone: '',
      _FormKeys.oldPassword: '',
      _FormKeys.newPassword: '',
      _FormKeys.confirmPassword: '',
    };
  }
}