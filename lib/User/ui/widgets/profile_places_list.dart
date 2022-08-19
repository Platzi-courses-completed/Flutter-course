import 'package:basic_flutter/Place/model/place.dart';
import 'package:basic_flutter/User/bloc/bloc_user.dart';
import 'package:basic_flutter/User/model/user.dart';
import 'package:basic_flutter/User/ui/widgets/profile_place.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ProfilePlacesList extends StatelessWidget {
  const ProfilePlacesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    final Place place = Place(
      id: '1',
      name: 'Place 1',
      description: 'Description Place 1',
      uriImage: 'assets/img/paisaje1.jpg',
      likes: 0,
    );
    final Place place2 = Place(
      id: '2',
      name: 'Place 2',
      description: 'Description Place 2',
      uriImage: 'assets/img/paisaje2.jpg',
      likes: 0,
    );

    return Container(
        margin: EdgeInsets.only(
          top: 10.0,
          bottom: 10.0,
          left: 20.0,
          right: 20.0,
        ),
        child: StreamBuilder(
          stream: userBloc.placesListStream(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              case ConnectionState.done:
                return Column(children: []);
              default:
                return CircularProgressIndicator();
            }
          },
        ));
  }
}
