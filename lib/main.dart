import 'package:flutter/material.dart';
import 'model/book.dart';

void main() => runApp(new BooksApp());

class BooksApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BooksApp",
      debugShowCheckedModeBanner: false,
      home: BooksHome(),
    );
  }
}

class BooksHome extends StatefulWidget {
  @override
  _BooksHomeState createState() => _BooksHomeState();
}

class _BooksHomeState extends State<BooksHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            CustomTitleBar(),
            HorizontalListView(),
            HotList(),
          ],
        ),
      ),
    );
  }
}

class CustomTitleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.book,
            size: 30,
            color: Colors.black,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              "BooksApp",
              style: TextStyle(
                fontSize: 30,
                fontFamily: "lovelo",
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HorizontalListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Color(0xFFF8F8F8), Colors.white]),
        border: Border(
          bottom: BorderSide(color: Color(0xFFF0F0F0), width: 2),
        ),
      ),
      padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      child: Column(
        children: <Widget>[
          Container(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: booklist.books.length,
              itemBuilder: (BuildContext context, int index) {
                if (booklist.books[index].franchise) {
                  return ShowCase(
                      wideImage: booklist.books[index].wideImage,
                      bookObject: booklist.books[index]);
                } else {
                  return Container();
                }
              },
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "BEST SELLERS",
            style: TextStyle(letterSpacing: 1.5, color: Colors.black54),
          ),
          Divider(
            color: Colors.black54,
          ),
          Text(
            "Novels with a popular francise",
            style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w700,
                fontSize: 30),
            softWrap: true,
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}

class ShowCase extends StatelessWidget {
  final String wideImage;
  final Book bookObject;
  const ShowCase({@required this.wideImage, @required this.bookObject});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: <Widget>[
          Container(
            height: 250,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(wideImage, fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }
}

class HotList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Color(0xFFF8F8F8), Colors.white],
          ),
          border: Border(
              bottom: BorderSide(
            color: Color(0xFFF0F0F0),
            width: 2,
          ))),
      padding: EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              "Net Book Hot List",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            height: 320,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: booklist.books.length,
              itemBuilder: (BuildContext context, int i) {
                String title = booklist.books[i].title.length > 17
                    ? booklist.books[i].title.substring(0, 15) + '...'
                    : booklist.books[i].title;
                if (booklist.books[i].franchise) {
                  return Container();
                } else {
                  return ShowBooks(
                    bookCoverImg: booklist.books[i].cover,
                    price: booklist.books[i].price,
                    author: booklist.books[i].author,
                    title: title,
                    bookObject: booklist.books[i],
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class ShowBooks extends StatelessWidget {
  const ShowBooks(
      {@required this.bookCoverImg,
      @required this.title,
      @required this.bookObject,
      @required this.price,
      @required this.author});

  final String bookCoverImg;
  final String title;
  final String author;
  final double price;
  final Book bookObject;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 220,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.network(
                    bookCoverImg,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                author,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black45,
                    fontWeight: FontWeight.w300),
                softWrap: true,
              ),
              SizedBox(
                height: 12,
              ),
              Text("\$$price",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500))
            ],
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }
}
