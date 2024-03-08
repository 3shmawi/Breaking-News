import 'package:c3/mostafa_mohamed_l2/rosary/zkr/view.dart';
import 'package:flutter/material.dart';

class HomeRosaryPage extends StatefulWidget {
  const HomeRosaryPage({super.key});

  @override
  State<HomeRosaryPage> createState() => _HomeRosaryPageState();
}

class _HomeRosaryPageState extends State<HomeRosaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Azkari'),
        centerTitle: false,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Item(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const RosaryPage(),
                  ),
                );
              },
              title: 'تسابيح',
              img:
                  'https://images.unsplash.com/photo-1470252649378-9c29740c9fa8?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c3VucmlzZXxlbnwwfHwwfHx8MA%3D%3D');
        },
        itemCount: 5,
      ),
    );
  }
}

class Item extends StatelessWidget {
  const Item({required this.title, required this.img, this.onTap, super.key});

  final String img;
  final String title;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Card(
        elevation: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: onTap,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Image.network(
                img,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22,
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
