import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:book_app/Models/constants.dart';
import 'package:http/http.dart' as http;

class BookDetailsPage extends StatefulWidget {
  final int bookId;

  BookDetailsPage({required this.bookId});

  @override
  _BookDetailsPageState createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  Constants myConstants=Constants();
  Map<String, dynamic> bookDetails = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    print('Book ID: ${widget.bookId}');
    fetchBookDetails();
  }

  Future<void> fetchBookDetails() async {
    print('Book ID: ${widget.bookId}');
    try {
      final response = await http.get(
          Uri.parse('http://softwium.com/api/books/${widget.bookId}'));
      if (response.statusCode == 200) {
        setState(() {
          bookDetails = json.decode(response.body);
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load book details:${response.statusCode}');
      }
    }catch (error) {
      print('Error fetching book details: $error');
      throw Exception('Failed to load book details');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: myConstants.secondaryColor,
        title: Text('Book Details'),
      ),

      body: isLoading
        ? Center(child: CircularProgressIndicator())
        : bookDetails == null  // Add a null check here
    ? Center(child: Text('Failed to load book details'))
        : ListView(
    padding: EdgeInsets.all(16),
    children: [
    Text(
    bookDetails!['title'] ?? 'Title not available',
      //print('title:${widget.title}');// Use null-aware operators to handle null values
    style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 16),
    Text(
    'ISBN: ${bookDetails!['isbn'] ?? 'ISBN not available'}',
    style: TextStyle(
    fontSize: 18,
    color: Colors.grey[600],
    ),
    ),
    SizedBox(height: 8),
    Text(
    'Page Count: ${bookDetails!['pageCount'] ?? 'Page count not available'}',
    style: TextStyle(
    fontSize: 18,
    color: Colors.grey[600],
    ),
    ),
    SizedBox(height: 16),
    Text(
    'Authors: ${bookDetails!['authors'] != null ? bookDetails!['authors'].join(', ') : 'Authors not available'}',
    style: TextStyle(
    fontSize: 18,
    color: Colors.grey[600],
    ),
    ),
    ],
    ),
    );
  }
}
