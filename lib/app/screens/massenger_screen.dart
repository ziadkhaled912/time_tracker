import 'package:flutter/material.dart';

class MassengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(
                  'https://scontent.fcai1-2.fna.fbcdn.net/v/t1.6435-9/121212904_1312392159109414_7290877016294992204_n.jpg?_nc_cat=101&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeGjEb_saHFAqiz0J7ZEZFgrvuLNfeyT5QO-4s197JPlAzfqZzMj4v4Cplt2X9V79Q4trXrrys4yiD0M6QOcWOpV&_nc_ohc=6N4PUPYZ37AAX-DGDl2&_nc_ht=scontent.fcai1-2.fna&oh=1c8eb5c7ed79b1d79fed6a0e9c9e6a1e&oe=60B5BAB3'),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              "Chats",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 23,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              icon: CircleAvatar(
                radius: 25.0,
                backgroundColor: Color(0xFFEAE9E9),
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.black,
                  size: 20.0,
                ),
              ),
              onPressed: () {})
        ],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color(0xFFEAE9E9),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Search',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                height: 102,
                child: ListView.separated(
                  shrinkWrap: true,
                      separatorBuilder: (context, index) => SizedBox(width: 20,),
                      itemBuilder: (context, index) => buildStoryItem(),
                      itemCount: 7,
                      scrollDirection: Axis.horizontal,
                    ),
                ),
              SizedBox(height: 20),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => buildChatItem(),
                  separatorBuilder:(context, index)=> SizedBox(height: 10),
                  itemCount: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildChatItem() => Row(
      children: [
        CircleAvatar(
          radius: 30.0,
          backgroundImage: NetworkImage(
              'https://scontent.fcai1-2.fna.fbcdn.net/v/t1.6435-9/121212904_1312392159109414_7290877016294992204_n.jpg?_nc_cat=101&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeGjEb_saHFAqiz0J7ZEZFgrvuLNfeyT5QO-4s197JPlAzfqZzMj4v4Cplt2X9V79Q4trXrrys4yiD0M6QOcWOpV&_nc_ohc=6N4PUPYZ37AAX-DGDl2&_nc_ht=scontent.fcai1-2.fna&oh=1c8eb5c7ed79b1d79fed6a0e9c9e6a1e&oe=60B5BAB3'),
        ),
        SizedBox(width: 20.0,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ziad Khaled',
                style: TextStyle(
                  fontSize: 18,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Hello my names is ziad khaled',
                      style: TextStyle(
                        color: Color(0xFF797979),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: 5.0,
                      height: 5.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Text('02:00 pm',),
                ],
              ),
            ],
          ),
        ),
      ],
    );

  Widget buildStoryItem() => Container(
    width: 60.0,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                  'https://scontent.fcai1-2.fna.fbcdn.net/v/t1.6435-9/121212904_1312392159109414_7290877016294992204_n.jpg?_nc_cat=101&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeGjEb_saHFAqiz0J7ZEZFgrvuLNfeyT5QO-4s197JPlAzfqZzMj4v4Cplt2X9V79Q4trXrrys4yiD0M6QOcWOpV&_nc_ohc=6N4PUPYZ37AAX-DGDl2&_nc_ht=scontent.fcai1-2.fna&oh=1c8eb5c7ed79b1d79fed6a0e9c9e6a1e&oe=60B5BAB3'),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white,
                    width: 3,
                  )),
              child: CircleAvatar(
                radius: 7.0,
                backgroundColor: Color(0xFF56C45A),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 6.0,
        ),
        Text(
          'Ziad Khaled',
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    ),
  );

}
