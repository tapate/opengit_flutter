import 'package:flutter/widgets.dart';
import 'package:flutter_base_ui/bloc/page_type.dart';
import 'package:open_git/ui/page/profile/user_page.dart';

class StargazerPage extends UserPage {
  @override
  PageType getPageType() {
    return PageType.repo_stargazers;
  }

  @override
  String getTitle(BuildContext context) {
    return 'Stargazers';
  }
}