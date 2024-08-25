import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  final List<String> imageUrls = [
    'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Durga_Puja_Festival%2C_Kolkata.jpg/1200px-Durga_Puja_Festival%2C_Kolkata.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/0/0c/Durga_Puja%2C_Kolkata_2018.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/Durga_Puja_Kolkata_2015.jpg/1280px-Durga_Puja_Kolkata_2015.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Durga_Puja_2021.jpg/1200px-Durga_Puja_2021.jpg',
    'https://media.gettyimages.com/id/458583265/photo/goddess-during-durga-puja-celebrations.jpg?s=170667a&w=gi&k=20&c=gsFTh47LFP1486n9q4n8EXuQ3coo4NNE-c2_GSwo1EU=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        padding: EdgeInsets.all(8.0),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Card(
            child: Image.network(
              imageUrls[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
