import 'package:flutter/material.dart';
import 'package:flutter_base_ui/bloc/base_list_stateless_widget.dart';
import 'package:flutter_base_ui/flutter_base_ui.dart';
import 'package:open_git/bean/repos_bean.dart';
import 'package:open_git/bloc/repo_bloc.dart';
import 'package:open_git/route/navigator_util.dart';
import 'package:open_git/ui/widget/repos_item_widget.dart';

class RepoPage extends BaseListStatelessWidget<Repository, RepoBloc> {
  static final String TAG = "ReposPage";

  static final int PAGE_HOME = 0;
  static final int PAGE_USER = 1;
  static final int PAGE_USER_STAR = 2;
  static final int PAGE_ORG = 3;


  final int page;

  RepoPage(this.page);

  @override
  bool isShowAppBar() {
    return page != PAGE_HOME;
  }

  @override
  String getTitle(BuildContext context) {
    String title;
    if (page == PAGE_USER_STAR) {
      title = 'star项目';
    } else {
      title = '项目';
    }
    return title;
  }

  @override
  bool isShowAppBarActions() {
    return page != PAGE_ORG;
  }

  @override
  void openWebView(BuildContext context) {
    RepoBloc bloc = BlocProvider.of<RepoBloc>(context);
    String url;
    if (page == PAGE_USER) {
      url = 'https://github.com/${bloc.userName}?tab=repositories';
    } else {
      url = 'https://github.com/${bloc.userName}?tab=stars';
    }
    NavigatorUtil.goWebView(context, bloc.userName, url);
  }

  @override
  String getShareText(BuildContext context) {
    RepoBloc bloc = BlocProvider.of<RepoBloc>(context);
    String url;
    if (page == PAGE_USER) {
      url = 'https://github.com/${bloc.userName}?tab=repositories';
    } else {
      url = 'https://github.com/${bloc.userName}?tab=stars';
    }
    return url;
  }

  @override
  Widget builderItem(BuildContext context, Repository item) {
    return ReposItemWidget(item);
  }
}
