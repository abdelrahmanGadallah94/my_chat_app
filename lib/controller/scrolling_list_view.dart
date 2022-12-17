import 'package:flutter/material.dart';

scrollDownListView(scroll) {
  scroll.animateTo(
      0.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease);
}
