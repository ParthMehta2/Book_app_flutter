import 'package:book_app/Models/constants.dart';
import 'package:book_app/UI/Books_page.dart';
import 'package:flutter/material.dart';
class get_started extends StatelessWidget {
  const get_started({super.key});

  @override
  Widget build(BuildContext context) {
    Constants myConstants=Constants();
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      body: Container(
        width: size.width,
        height: size.height,
        color: myConstants.primaryColor.withOpacity(.8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  width: 200,
                  height: 200,


                  child: Image.asset('assets/book.jpg',
                    fit: BoxFit.cover,)),

              const SizedBox(height:30,),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BooksPage()));
                },
                child:
              Container(
                  height: 50,
                  width: size.width *0.7,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),

                  ),
                  child:const Center(
                    child: Text(
                      'Get started',style: TextStyle(color: Colors.white,fontSize: 18),),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),

    );
  }
}
