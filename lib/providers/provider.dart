import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final idProvider = StateProvider<String?>((ref) {
  return null;
});
final isEditProvider = StateProvider<bool>((ref) {
  return false;
});

final nameProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});
final phoneProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});
final bloodgrpProvider = StateProvider<String?>((ref) {
  return null;
});
