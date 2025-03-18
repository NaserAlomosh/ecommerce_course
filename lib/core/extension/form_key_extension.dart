import 'package:flutter/material.dart';

extension FormKeyExtinsion on GlobalKey<FormState> {
  bool isValid() {
    return currentState?.validate() ?? false;
  }
}
