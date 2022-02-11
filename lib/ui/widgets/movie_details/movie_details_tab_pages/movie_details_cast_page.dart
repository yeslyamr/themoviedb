import 'package:flutter/material.dart';
import 'package:themoviedb/ui/theme/app_colors.dart';

class MovieDetailsCastWidget extends StatelessWidget {
  const MovieDetailsCastWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    

    return ColoredBox(
      color: AppColors.secondary,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50  ,
            child: Text('$index'),
            color: Colors.blue,
          );
        },
      ),
    );
  }
}