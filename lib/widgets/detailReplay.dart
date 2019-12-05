import 'package:flutter/material.dart';
import 'package:hello_cnode/constants/index.dart';
import 'package:hello_cnode/models/reply.dart';
import 'package:date_format/date_format.dart';
import 'package:hello_cnode/utils/utils.dart';
import 'package:hello_cnode/routes/routeParams.dart';

Widget detailReplay(Reply reply, BuildContext context) {
  return Container(
          padding: EdgeInsets.only(bottom: 6),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black, width: .1)),
          ),
          margin: EdgeInsets.only(bottom: 10, left: 16, right: 16),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: null,
                    child: Container(
                      width: 30.0,
                      height: 30.0,
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(right: 10),
                      child: Image.asset(Utils.randomAvatar()),
                    ),
                  ),
                  Expanded(
                    flex: null,
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/userCenter',
                              arguments: ToUserCenter(reply.author.loginName,
                                  reply.author.avatarUrl));
                        },
                        child: Text('@ ${reply.author.loginName}',
                            style: TextStyle(fontSize: H2_SIZE, color: Colors.blue)),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: null,
                    child: Container(
                      margin: EdgeInsets.only(left: 5),
                      alignment: Alignment.centerRight,
                      child: Text(
                          formatDate(reply.createAt, [
                            yyyy,
                            '-',
                            mm,
                            '-',
                            dd,
                            '  ',
                            hh,
                            ':',
                            mm,
                            ':',
                            ss
                          ]),
                          style: TextStyle(fontSize: H2_SIZE)),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                            reply.isUped
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: reply.isUped ? Colors.red : Colors.grey,
                            size: 18),
                        Container(
                          margin: EdgeInsets.only(left: 6),
                          child: Text('${reply.ups.length.toString()} 赞',
                              style: TextStyle(fontSize: H2_SIZE)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 10, bottom: 8),
                child: Text(reply.content,
                    softWrap: true,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: H3_SIZE)),
              ),
            ],
          ),
        );
}
