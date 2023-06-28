import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

Widget buildPostContent({
  required BuildContext context,
  required String content,
}) {
  return Html(data: content);
}
