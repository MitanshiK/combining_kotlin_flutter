import 'package:combining_kotlin_flutter/dio/dio_screen.dart';
import 'package:combining_kotlin_flutter/page/page_to_change.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child:  DioScreen()));        // providerscope for riverPod
}

