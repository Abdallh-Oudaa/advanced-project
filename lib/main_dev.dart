import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/di/dependency_injection.dart';
import 'doc_doc.dart';

void main() async {
  await setup();
  await dotenv.load(fileName: ".env");

  runApp(const DocDoc());
}
