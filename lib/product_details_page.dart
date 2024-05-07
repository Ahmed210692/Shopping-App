import 'package:flutter/material.dart';

class product_details_page extends StatefulWidget {
  final Map<String, Object> product;
  const product_details_page({
    super.key,
  required this.product,
  });

  @override
  State<product_details_page> createState() => _product_details_pageState();
}

class _product_details_pageState extends State<product_details_page> {
  int selectedSize = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Details', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,

      ),

      body: Column(
        children: [
          const SizedBox(height: 20,),
          Text(widget.product['title'] as String , style: Theme.of(context).textTheme.titleLarge,),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Image(
              image: AssetImage(widget.product['imageURl'] as String),
            ),
          ),
          const Spacer(flex: 2,),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Color.fromRGBO(224, 224, 224, 1),
              borderRadius: BorderRadius.circular(40),
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 15,),
                Text("\$${widget.product['price'] as double}",
                style: Theme.of(context).textTheme.titleLarge,),
                SizedBox(
                  height: 20,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemCount:(widget.product['sizes'] as List<int>).length,
                  itemBuilder:(context, index){
                    final size = (widget.product['sizes'] as List<int>)[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(

                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: GestureDetector(

                            child: Chip(
                              label: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: selectedSize == size ? Colors.yellow : Colors.black),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.transparent,
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                                child: Text(size.toString(),style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                              ),
                            ),
                          ),
                        ),

                          ),

                    );

                  }
                  ),
                ),
                const SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.all(20.0),

                  child: ElevatedButton(onPressed: () {},
                    style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50),
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                    ),
                    child: const  Text('Add to Cart', style: TextStyle(color: Colors.black,
                    fontSize: 18,),),),
                ),

              ],
            ),
          ),



        ],
      ),
    );
  }
}