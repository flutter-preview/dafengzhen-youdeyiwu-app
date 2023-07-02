import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/message/bloc/message_bloc.dart';
import 'package:youdeyiwu_app/message/bloc/message_controller.dart';
import 'package:youdeyiwu_app/message/bloc/message_state.dart';

/// Message
class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

/// _MessageIdState
class _MessageState extends State<Message> {
  late MessageController _messageController;

  @override
  void initState() {
    super.initState();
    _messageController = MessageController(context: context)..init();
  }

  /// _refresh
  Future<void> _refresh() async {
    await _messageController.init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessageBloc, MessageState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: RefreshIndicator(
            onRefresh: _refresh,
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [],
            ),
          ),
        ),
      ));
    });
  }
}
