import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hello_cnode/routes/routeParams.dart';
import 'package:hello_cnode/utils/utils.dart';
import 'package:hello_cnode/utils/request.dart';
import 'package:hello_cnode/constants/index.dart';
import 'package:hello_cnode/widgets/userMoment.dart';
import 'package:hello_cnode/models/userCenter.dart';
import 'package:hello_cnode/models/userDetail.dart';
import 'package:hello_cnode/widgets/loadingOrDefault.dart';

class UserProfile extends StatefulWidget {
  UserProfile({Key key, this.loginName, this.avatarUrl}) : super(key: key);

  final String loginName;
  final String avatarUrl;

  @override
  _UserProfile createState() => _UserProfile();
}

class _UserProfile extends State<UserProfile> {
  bool _isFinish = false;
  UserCenter _userCenter;
  List<UserDetail> _userDetail;
  String _currentTab = TAB_TYPE_OF_THEME;
  String _userAvatar = Utils.randomAvatar();

  Future<Null> _getUserCenter() async {
    _userCenter = await Request.getUserCenter(widget.loginName);
    setState(() {
      _isFinish = true;
      _userCenter = _userCenter;
      _userDetail = _userCenter.recentTopics;
    });
    return;
  }

  void _changeTab(String tab) {
    if (tab == TAB_TYPE_OF_THEME) {
      _userDetail = _userCenter.recentTopics;
    } else if (tab == TAB_TYPE_OF_REPLY) {
      _userDetail = _userCenter.recentReplies;
    }
    setState(() {
      _currentTab = tab;
      _userDetail = _userDetail;
    });
  }

  @override
  void initState() {
    super.initState();
    _getUserCenter();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人中心'),
        centerTitle: true,
      ),
      body: !_isFinish
          ? loading()
          : SafeArea(
              child: CustomScrollView(
              slivers: <Widget>[
                _buildBanner(),
                _buildStickyBar(),
                _buildList(_userDetail),
              ],
            )),
    );
  }

  Widget _buildBanner() {
    return SliverToBoxAdapter(
      child: Container(
          color: Colors.blue,
          child: UnconstrainedBox(
              child: Column(
            children: <Widget>[
              Container(
                  width: 90.0,
                  height: 90.0,
                  margin: EdgeInsets.only(bottom: 15, top: 25),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.asset(_userAvatar,
                        height: 70, fit: BoxFit.fitHeight),
                  )),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 4),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/webview', arguments: ToWebView(WEB_VIEW_BASE_URL + widget.loginName, widget.loginName));
                        },
                        child: Text('@ ${widget?.loginName ?? '--'}',
                            style: TextStyle(fontSize: H2_SIZE, color: Colors.white)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 4),
                      decoration: BoxDecoration(),
                      child: Text('积分 ${_userCenter?.score ?? '0'}',
                          style: TextStyle(fontSize: H2_SIZE, color: Colors.white)),
                    ),
                  ],
                ),
              )
            ],
          ))),
    );
  }

  Widget _buildStickyBar() {
    return SliverPersistentHeader(
      pinned: true, //是否固定在顶部
      floating: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 60, //收起的高度
        maxHeight: 60, //展开的最大高度
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Material(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                      _changeTab(TAB_TYPE_OF_THEME);
                    },
                    child: Container(
                      height: 50.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1.0,
                            color: _currentTab == TAB_TYPE_OF_THEME
                              ? Colors.blue
                              : Colors.grey[400]),
                        )),
                      child: Text('主题', style: TextStyle(fontSize: H2_SIZE)),
                    ),
                  ),
                )),
              Expanded(
                flex: 1,
                child: Material(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                      _changeTab(TAB_TYPE_OF_REPLY);
                    },
                    child: Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(width: 1.0, color: Colors.grey[200]),
                          bottom: BorderSide(
                            width: 1.0,
                            color: _currentTab == TAB_TYPE_OF_REPLY
                              ? Colors.blue
                              : Colors.grey[400]),
                        )),
                      alignment: Alignment.center,
                      child: Text('回复', style: TextStyle(fontSize: H2_SIZE)),
                    ),
                  ),
                ))
            ],
          ),
        )
      ),
    );
  }

  Widget _buildList(List<UserDetail> detail) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (context, index) {
        return !_isFinish
            ? loading()
            : detail == null || detail.isEmpty
                ? Container(
                    margin: EdgeInsets.only(top: 50),
                    child: empty(),
                  )
                : userMoment(detail[index], context);
      },
      childCount: detail.isEmpty ? 1 : detail.length,
    ));
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
