import 'package:expressreader_flutter/module/bean/magazine_issue.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MagazineCard extends StatelessWidget {
  final IssueList _issueList;

  MagazineCard(this._issueList);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Image.network(
                _issueList.thumbImage[0],
              ),
              Text(
                _issueList.title,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              )
            ],
          ),
        ],
      ),
    );
  }
}
