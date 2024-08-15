import 'package:chat_app/repo/image_repository.dart';
import 'package:flutter/material.dart';

import '../models/image_model.dart';

class NetworkImagePickerBody extends StatelessWidget {
  final Function(String) onImageSelected;
  NetworkImagePickerBody({Key? key, required this.onImageSelected}) : super(key: key);
  //Image repository
  final ImageRepository _imageRepo = ImageRepository();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PixelFordImage>>(
        future: _imageRepo.getNetworkImages(),
        builder: (BuildContext context,
            AsyncSnapshot<List<PixelFordImage>> snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                      onImageSelected(snapshot.data![index].urlSmallSize);
                  },
                    child: Image.network(snapshot.data![index].urlSmallSize));
              },
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5),
            );
          }

          else if(snapshot.hasError){
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text('This is the Error ${snapshot.error}'),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: CircularProgressIndicator()),
          );
        });
  }
}
