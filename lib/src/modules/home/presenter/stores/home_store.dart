import 'package:flutter/material.dart';

class HomeStore extends ValueNotifier<int> {
  HomeStore() : super(0);

  void increment() => value++;
}