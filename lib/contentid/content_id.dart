import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/contentid/bloc/content_id_bloc.dart';
import 'package:youdeyiwu_app/contentid/bloc/content_id_controller.dart';
import 'package:youdeyiwu_app/contentid/bloc/content_id_state.dart';
import 'package:youdeyiwu_app/contentid/widget/content.dart';
import 'package:youdeyiwu_app/contentid/widget/posts.dart';
import 'package:youdeyiwu_app/contentid/widget/tags.dart';
import 'package:youdeyiwu_app/tool/tool.dart';

/// ContentId
class ContentId extends StatefulWidget {
  const ContentId({Key? key}) : super(key: key);

  @override
  State<ContentId> createState() => _ContentIdState();
}

/// _ContentIdState
class _ContentIdState extends State<ContentId> {
  late ScrollController _scrollController;
  late ContentIdController _contentIdController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var arguments = ModalRoute.of(context)?.settings.arguments;
    if (arguments is Map<String, dynamic> && arguments['id'] != null) {
      var id = arguments['id'].toString();
      _contentIdController = ContentIdController(context: context)
        ..init(id: id);
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  /// _scrollListener
  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _contentIdController.LoadMoreData();
    }
  }

  /// _refresh
  Future<void> _refresh() async {
    await _contentIdController.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContentIdBloc, ContentIdState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: RefreshIndicator(
            onRefresh: _refresh,
            child: ListView(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              children: state.details == null
                  ? [buildLoadingIndicator()]
                  : [
                      buildSectionContent(
                        context: context,
                        details: state.details!,
                      ),
                      if (state.details!.tags.isNotEmpty)
                        buildTags(
                          context: context,
                          tags: state.details!.tags,
                        ),
                      buildPosts(
                        context: context,
                        postData: state.details!.data,
                        isLoading: state.isLoading,
                      ),
                    ],
            ),
          ),
        ),
        bottomNavigationBar:
            buildBottomNavigationBar(context: context, isOnTap: true),
      ));
    });
  }
}
