import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_book_selling/model/book.dart';

class Details extends StatefulWidget {
  final Book bookObject;
  Details(this.bookObject);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 25,
              ),
            ),
            actions: <Widget>[
              Icon(
                Icons.file_upload,
                color: Colors.black87,
                size: 25,
              ),
              SizedBox(
                width: 25,
              ),
              Icon(
                Icons.favorite_border,
                color: Colors.black87,
              ),
              SizedBox(
                width: 25,
              )
            ],
          ),
        ),
      ),
      body: DetailsPageBody(widget.bookObject),
    ));
  }
}

class DetailsPageBody extends StatefulWidget {
  final Book bookObject;
  DetailsPageBody(this.bookObject);
  @override
  _DetailsPageBodyState createState() => _DetailsPageBodyState();
}

class _DetailsPageBodyState extends State<DetailsPageBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 30, bottom: 30),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Color(0xFFF8F8F8), Colors.white],
                      ),
                      border: Border(
                        bottom: BorderSide(color: Color(0xFFF0F0F0), width: 2),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 5.0,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: EdgeInsets.only(left: 10),
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              widget.bookObject.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black54,
                                  fontSize: 25),
                              softWrap: true,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              //Positioned(),
            ],
          )
        ],
      ),
    );
  }
}
