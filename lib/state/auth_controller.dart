import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//biar ga login login terus

class AuthController extends ValueNotifier<bool> {
  AuthController._() : super(false);

  static final AuthController instance = AuthController._();

  static const _prefsKey = 'flowee_is_logges_in';

  // di panggil sekali saat aplikasi baru di buka (muncul splassh screen),
  //untuk membaca sttus login yng tersimpan dari sesi SEBELUMNYA

  Future<void> loadPersistedSession() async {
    final prefs = await SharedPreferences.getInstance();
    value = prefs.getBool(_prefsKey) ?? false;
  }

  Future<void> login() async {
    value = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefsKey, true);
  }

  Future<void> logout() async {
    value = false;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefsKey, false);
  }
}
