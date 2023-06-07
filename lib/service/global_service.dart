import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:youdeyiwu_app/service/storage_service.dart';

// GlobalService
class GlobalService {
  static late Logger logger;
  static late StorageService storageService;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load();
    logger = Logger();
    storageService = await StorageService().init();
  }
}
