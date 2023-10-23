import 'package:flutter/material.dart';
import 'package:onlinebookhubapp/models/nursery.dart';
import 'package:onlinebookhubapp/models/product_detail1.dart';

class NurseryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Product Type')),
      ),
      body: Column(
        children: [
          SizedBox(height: 20), // Add some space between title and body
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12), // Set padding to zero
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  InkWell(
                    onDoubleTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Nursery(),
                      ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/cat/nur1.png',
                            width: 100,
                            height: 100,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Nursery 1',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onDoubleTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Nursery(),
                      ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/cat/nur2.png',
                            width: 100,
                            height: 100,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Nursery 2',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onDoubleTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Nursery(),
                      ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/cat/bio1.png',
                            width: 100,
                            height: 100,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Nursery 3',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onDoubleTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Nursery(),
                      ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/cat/book3.png',
                            width: 100,
                            height: 100,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Nursery 4',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                 
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
