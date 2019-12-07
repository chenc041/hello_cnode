import 'package:flutter/material.dart';
import 'package:hello_cnode/constants/index.dart';
import 'package:hello_cnode/routes/routeParams.dart';
import 'package:hello_cnode/models/userDetail.dart';
import 'package:date_format/date_format.dart';

Widget userMoment(UserDetail detail, BuildContext context) {
  return Container(
    height: 80,
    margin: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
    width: double.infinity,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
            color: Colors.grey[300],
            offset: Offset(0.0, 0.0),
            blurRadius: 10.0)
      ],
    ),
    alignment: Alignment.topLeft,
    child: Material(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed('/detail', arguments: ToDetail(detail.id));
        },
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Text(
                  detail.title ?? '--',
                  style: TextStyle(fontSize: H2_SIZE),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: Text(
                  detail.lastReplyAt != null
                      ? formatDate(detail.lastReplyAt, [
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
                  style: TextStyle(fontSize: H4_SIZE),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
