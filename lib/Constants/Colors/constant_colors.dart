import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


dprint(content) {
  if (kDebugMode) debugPrint('Debug Mode: $content');
}

showSnackBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
}
