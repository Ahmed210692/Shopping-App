import 'package:flutter/material.dart';
import 'package:shop_app_flutter/global_variable.dart';
import 'package:shop_app_flutter/product-card.dart';
import 'package:shop_app_flutter/product_details_page.dart';
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<String> filters = const ['All','Addidas','Nike', 'Bata'];

  late  String selectedfilter;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    selectedfilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
    borderSide: BorderSide(
    color: Color.fromRGBO(225, 225, 225, 1),
    ),
    borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
    );

    return  Scaffold(
      body:
         SafeArea(

          child: Column(
            children: [
            const  Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text('Shoes\nCollection',
                      style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 35),),
                  ),
                  Expanded(child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon((Icons.search)),
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                    ),
                  ),
                  ),

                ],

              ),
             SizedBox(
               height: 120,
                child: ListView.builder(itemCount: filters.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final filter = filters[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedfilter = filter;
                            });
                          },
                          child: Chip(
                            backgroundColor: selectedfilter == filter ? Theme.of(context).colorScheme.primary: const Color.fromRGBO(245, 247, 249, 1),
                            side: const BorderSide(
                              color: Color.fromRGBO(245, 247, 249, 1)
                            ),
                            label: Text(filter),
                          labelStyle: const TextStyle(fontSize: 16),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          ),
                        ),
                      );
                    },
                ),
              ),
             Expanded(
               child: ListView.builder(itemCount: products.length,
               itemBuilder: (context, index){
                 final product = products[index];
                 return GestureDetector(
                   onTap: (){
                     Navigator.of(context).push(
                       MaterialPageRoute(builder: (context){
                         return product_details_page(product: product);
                       }
                       ),
                     );
                   },
                   child: ProductCard(
                       title: product['title'] as String,
                     price: product['price'] as double,
                     imageURL: product['imageURl'] as String,

                   ),
                 );
               }),
             )
            ],
          ),

        ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value){
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items: const  [
        BottomNavigationBarItem(icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),
          label: '',
        ),

      ],

      ),
    );
  }
}
