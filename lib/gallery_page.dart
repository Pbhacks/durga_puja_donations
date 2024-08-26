import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  final List<String> imageUrls = [
    'https://upload.wikimedia.org/wikipedia/commons/4/49/Shades_of_Maa_Durga.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaK06X7aB6xTYuUvL0jvByqTqQ5N59LK6SIQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdGsWHbzkaiWxx4sYDYh19tHxV957TijNR0g&s',
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
