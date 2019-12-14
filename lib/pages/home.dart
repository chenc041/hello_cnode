import 'package:flutter/material.dart';
import 'package:hello_cnode/models/home.dart';
import 'package:hello_cnode/utils/utils.dart';
import 'package:hello_cnode/utils/request.dart';
import 'package:hello_cnode/widgets/drawer.dart';
import 'package:hello_cnode/iconFonts/MyIcons.dart';
import 'package:hello_cnode/widgets/homeListItem.dart';
import 'package:hello_cnode/widgets/loadingOrDefault.dart';
import 'package:hello_cnode/widgets/bottomNavigationBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String barcode; // 二维码扫描结果
  bool _isShow = false; // 回到顶部按钮 是否展示
  List<Home> _data = []; // 返回的数据
  bool _isFinish = false; // 数据是否加载结束
  int _selectedIndex = 0; // 当前选中的bottom下标
  int _currentPage = 1; // 当前页数
  String _currentTab = 'index'; // 当前tab值
  final Color _selectedColor = Colors.blue; // bottom tab 选中的颜色
  final Color _unselectedColor = Colors.black; // bottom tab 未选中的颜色
  ScrollController _scrollController = new ScrollController(); // 控制滚动的实例
  List<String> _tabs = ['index', 'good', 'share', 'ask', 'job']; // 数据关联的 tab 值
  Map<String, String> _tabName = {
    'index': '首页',
    'good': '精华',
    'share': '分享',
    'ask': '问答',
    'job': '招聘'
  };

  // 底部tab 点击切换
  void _onItemTapped(int index) {
    _isFinish = false;
    setState(() {
      _data = [];
      _isShow = false;
      _currentPage = 1;
      _selectedIndex = index;
      _currentTab = _tabs[index];
    });
    _getHomeData(_tabs[index]);
  }

  // 获取首页列表数据
  Future<Null> _getHomeData(String tab, [int page = 1]) async {
    List<Home> _result = await Request.getHomeData(tab, page);
    _data.addAll(_result);
    setState(() {
      _data = _data;
      _isFinish = true;
    });
  }

  // 下拉刷新
  Future<Null> _pullRefresh() async {
    _data = await Request.getHomeData(_currentTab);
    setState(() {
      _data = _data;
      _isFinish = true;
    });
    return;
  }

  Future<Null> _scan() async {
    await Utils.scanQrCode(context);
  }

  // 初始化数据
  @override
  void initState() {
    super.initState();
    _getHomeData(_tabs[_selectedIndex]);
    _scrollController.addListener(() {
      if (_scrollController.offset >= 1000) {
        setState(() {
          _isShow = true;
        });
      } else if (_scrollController.offset < 1000) {
        setState(() {
          _isShow = false;
        });
      }
      if (_scrollController.position.atEdge == true &&
          _scrollController.offset != 0) {
        setState(() {
          _currentPage += 1;
        });
        _getHomeData(_tabs[_selectedIndex], _currentPage);
      }
    });
  }

  // 释放滚动控件的引用
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_tabName[_currentTab]),
        actions: <Widget>[
          InkWell(
            onTap: _scan,
            child: Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Icon(MyIcons.scan),
            ),
          )
        ],
      ),
      drawer: drawerPage(context),
      body: !_isFinish
          ? loading()
          : _data.isEmpty
              ? empty(_getHomeData(_tabs[_selectedIndex]))
              : RefreshIndicator(
                  onRefresh: _pullRefresh,
                  child: Container(
                    margin: EdgeInsets.only(top: 12, bottom: 12),
                    child: ListView.builder(
                      itemExtent: 94.0,
                      itemCount: _data.length != null ? _data.length : 1,
                      controller: _scrollController,
                      itemBuilder: (context, index) {
                        if (index == (_data.length - 1)) {
                          return loading();
                        } else {
                          return homeListItem(_data[index], context);
                        }
                      },
                    ),
                  ),
                ),
      bottomNavigationBar: bottomNavigationBar(
        unselectedColor: _unselectedColor,
        selectedColor: _selectedColor,
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      floatingActionButton: !_isShow
          ? null
          : FloatingActionButton(
              tooltip: 'scrollTop',
              onPressed: () {
                _scrollController.animateTo(.0,
                    duration: Duration(milliseconds: 300), curve: Curves.ease);
              },
              child: Icon(Icons.arrow_upward),
            ),
    );
  }
}
