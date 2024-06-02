import 'package:flutter/material.dart';
import 'AddScreen.dart';

class Homebillscreen extends StatefulWidget {
  const Homebillscreen({super.key});

  @override
  State<Homebillscreen> createState() => _HomebillscreenState();
}

class _HomebillscreenState extends State<Homebillscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          InkWell(
              onTap: () {
                setState(() {});

                Navigator.of(context).pushNamed('/pdf');
              },
              child: const Icon(
                Icons.file_download_outlined,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
                productlist.length,
                (index) => Container(
                      margin: const EdgeInsets.all(20),
                      height: 100,
                      width: 350,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            productlist[index].proname!.text,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            productlist[index].qty!.text,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            productlist[index].price!.text,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ))
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          setState(() {
            Navigator.of(context).pushNamed('/bill');
          });
        },
        child: Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          child: const Center(
              child: Text(
            'Add',
            style: TextStyle(color: Colors.white),
          )),
        ),
      ),
    );
  }
}
