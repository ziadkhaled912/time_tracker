import 'package:flutter/material.dart';

class UserModel{
  final int id;
  final String name;
  final String phone;

  UserModel({
      @required this.id,
      @required this.name,
      @required this.phone
});
}

class UserScreen extends StatelessWidget {

  List<UserModel> users = [
    UserModel(
        id : 2,
        name : 'Osama Mansour',
        phone : '+201115342559'
    ),
    UserModel(
        id : 4,
        name : 'Ahmed Ali',
        phone : '+201115342559'
    ),
    UserModel(
        id : 6,
        name : 'Mohamed Gamal',
        phone : '+201093425222'
    ),
    UserModel(
        id : 2,
        name : 'Osama Mansour',
        phone : '+201115342559'
    ),
    UserModel(
        id : 4,
        name : 'Ziad Khaled',
        phone : '+201146446721'
    ),
    UserModel(
        id : 6,
        name : 'Mohamed Gamal',
        phone : '+201093425222'
    ),
    UserModel(
        id : 2,
        name : 'Osama Mansour',
        phone : '+201115342559'
    ),
    UserModel(
        id : 4,
        name : 'Ahmed Ali',
        phone : '+201115342559'
    ),
    UserModel(
        id : 6,
        name : 'Mohamed Gamal',
        phone : '+201093425222'
    ),
    UserModel(
        id : 2,
        name : 'Osama Mansour',
        phone : '+201115342559'
    ),
    UserModel(
        id : 4,
        name : 'Ahmed Ali',
        phone : '+201115342559'
    ),
    UserModel(
        id : 6,
        name : 'Mohamed Gamal',
        phone : '+201093425222'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
        body: ListView.separated(
            itemBuilder: (context, index) => buildUserItem(users[index]),
            separatorBuilder: (context, index) => Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
            itemCount: users.length,
        ),
    );
  }

  Widget buildUserItem(UserModel user) => Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25.0,
          child: Text(
            '${user.id}',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(width: 20.0),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${user.name}",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600
              ),
            ),
            Text(
              '${user.phone}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
