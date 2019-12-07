import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_cnode/utils/request.dart';
import 'package:hello_cnode/models/detail.dart';
import 'package:hello_cnode/utils/utils.dart';
import 'package:hello_cnode/widgets/detailContent.dart';
import 'package:hello_cnode/widgets/detailReplay.dart';
import 'package:hello_cnode/constants/index.dart';
import 'package:hello_cnode/widgets/loadingOrDefault.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key, this.id}) : super(key: key);

  final String id;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  String _token;
  Detail _detailData;
  bool _isFinish = false;

  Future<Null> _getDetailData(String id) async {
    _detailData = await Request.getDetailData(id);
    final prefs = await Utils.preference();
    setState(() {
      _isFinish = true;
      _detailData = _detailData;
      _token = prefs.get('token');
    });
    return;
  }

  // 下拉刷新
  Future<Null> _pullRefresh() async {
    await _getDetailData(widget.id);
    return;
  }

  void _handleCollect() async {
    if (_token == null){
    }
    await Request.collectContent(widget.id, _token);
  }

  @override
  void initState() {
    super.initState();
    _getDetailData(widget.id);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(_detailData?.title ?? '详情'),
          actions: _token == null ? null : <Widget>[
            InkWell(
              onTap: _handleCollect,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: _detailData?.isCollect != null ? Icon(Icons.favorite, color: Colors.red) : Icon(Icons.favorite_border),
              ),
            )
          ],
        ),
        body: !_isFinish
            ? loading()
            : _detailData == null
                ? empty()
                : SafeArea(
                    child: RefreshIndicator(
                      onRefresh: _pullRefresh,
                      child: CustomScrollView(
                        slivers: <Widget>[
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                return detailContent(_detailData, context);
                              }, childCount: 1),
                          ),
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                return _detailData.replyCount == 0
                                  ? defaultContent(Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(bottom: 40),
                                  child: Text(NO_REPLY_CONTENT, style: TextStyle(fontSize: H2_SIZE, color: Colors.grey[400])),
                                ))
                                  : detailReplay(
                                  _detailData.replies[index], context);
                              },
                              childCount: _detailData.replyCount == 0
                                ? 1
                                : _detailData.replyCount),
                          )
                        ],
                      ),
                    ),
                  )
    );
  }
}
