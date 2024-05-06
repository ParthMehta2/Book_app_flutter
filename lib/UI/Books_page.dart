import 'dart:convert';
import 'package:book_app/UI/Book_details.dart';
import 'package:book_app/Models/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => BooksPage(),
      '/bookDetails': (context) => BookDetailsPage(bookId: 9,),
    },
  ));
}

class BooksPage extends StatefulWidget {
  @override
  _BooksPageState  createState() => _BooksPageState();
}

  class _BooksPageState extends State<BooksPage> {
  Constants myConstants = Constants();
  List<dynamic> books = [];

  @override
  void initState() {
    super.initState();
    fetchBooks();
  }

  Future<void> fetchBooks() async {
    final response = await http.get(
        Uri.parse('https://softwium.com/api/books'));
    if (response.statusCode == 200) {
      setState(() {
        books = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load books');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: myConstants.secondaryColor,
          title: Text('Books'),
        ),
        body:  ListView.builder(
    itemCount: books.length,
    itemBuilder: (BuildContext context, int index) {
    return InkWell(
    onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetailsPage(bookId: 23),
      ),
    );
    },
    child: Card(
    elevation: 4,
    color: Colors.lightBlueAccent,
    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Padding(
    padding: EdgeInsets.all(16),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    books[index]['title'],
    style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 8),
    Text(
    'Author(s): ${books[index]['authors'].join(', ')}',
    style: TextStyle(
    fontSize: 14,
    color: Colors.grey[600],
    ),
    ),
    ],
    ),
    ),
    ),
    );
    },
    ),


    );
  }
}



