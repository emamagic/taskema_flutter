import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  final String message;
  const ErrorWidget({super.key, required this.message});
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Center(
        child: Text(message)
      ),
    );
  }
}