import 'package:flutter/material.dart';

class CustomGradient {
  static final LinearGradient dogLinearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.1, 0.5, 0.7, 0.9],
    colors: [
      Colors.indigo[800],
      Colors.indigo[700],
      Colors.indigo[600],
      Colors.indigo[400],
    ]
  );
}