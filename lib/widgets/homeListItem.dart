import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_cnode/constants/index.dart';
import 'package:hello_cnode/models/home.dart';
import 'package:hello_cnode/eumns//index.dart';
import 'package:date_format/date_format.dart';
import 'package:hello_cnode/routes/routeParams.dart';

Widget homeListItem(Home detail, BuildContext context) {
  return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed('/detail', arguments: ToDetail(detail.id));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey[300],
                offset: Offset(0.0, 0.0),
                blurRadius: 3.0)
          ],
          borderRadius: BorderRadius.circular(6),
        ),
        alignment: Alignment.centerLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                width: 60,
                height: 60,
                alignment: Alignment.center,
                child: UnconstrainedBox(
                  child: Image.asset(
                    detail.author.avatarUrl,
                    fit: BoxFit.fitHeight,
                    height: 45,
                    width: 45,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: null,
              child: UnconstrainedBox(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 32,
                  height: 18,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 10, top: 2, right: 10),
                  child: Text(tabsMap[detail.tab ?? 'index'],
                      style: TextStyle(fontSize: H4_SIZE, color: Colors.white)),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 45.0,
                    ),
                    child: Text(detail.title ?? '-',
                        maxLines: 2, overflow: TextOverflow.ellipsis),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Text.rich(
                          TextSpan(
                              style: TextStyle(fontSize: H4_SIZE),
                              children: <TextSpan>[
                                TextSpan(
                                  text: detail.replyCount != null
                                      ? detail.replyCount.toString()
                                      : '=',
                                ),
                                TextSpan(
                                  text: '/',
                                ),
                                TextSpan(
                                    text: detail.visitCount != null
                                        ? detail.visitCount.toString()
                                        : '=')
                              ]),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                            detail.createAt != null
                                ? formatDate(detail.createAt, [
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
                                  ]).toString()
                                : '-',
                            style: TextStyle(fontSize: H4_SIZE)),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ));
}
