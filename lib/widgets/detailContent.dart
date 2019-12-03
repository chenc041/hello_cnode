import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:hello_cnode/models/detail.dart';
import 'package:hello_cnode/routes/routeParams.dart';
import 'package:hello_cnode/utils/index.dart';
import 'package:hello_cnode/constants/index.dart';

Widget detailContent(Detail detail, BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(detail.title,
            style: TextStyle(fontSize: H1_SIZE, fontWeight: FontWeight.bold)),
        Container(
          margin: EdgeInsets.only(bottom: 15, top: 5),
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.black, width: .1))),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: null,
                child: Container(
                  width: 30.0,
                  height: 30.0,
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.only(top: 10, right: 6, bottom: 15),
                  child: Image.asset(randomAvatar()),
                ),
              ),
              Expanded(
                  flex: null,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/userCenter',
                          arguments: ToUserCenter(detail.author.loginName,
                              detail.author.avatarUrl));
                    },
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text('@ ${detail.author.loginName}',
                          style: TextStyle(fontSize: H2_SIZE, color: Colors.blue)),
                    ),
                  )),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                      formatDate(detail.createAt,
                          [yyyy, '-', mm, '-', dd, '  ', hh, ':', mm, ':', ss]),
                      style: TextStyle(fontSize: H2_SIZE)),
                ),
              )
            ],
          ),
        ),
        Container(
          child: Text(detail.content ?? '暂无内容', style: TextStyle(fontSize: H3_SIZE)),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(bottom: 10),
          margin: EdgeInsets.only(top: 20, bottom: 10),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black, width: .1))
          ),
          child: detail.replyCount != 0 ? Text('回复总数: ${detail.replyCount.toString()}',
              style: TextStyle(fontSize: H2_SIZE)) : null,
        ),
      ],
    ),
  );
}
