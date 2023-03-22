import 'package:flutter/material.dart';

class MyBigAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double imgheight;
  final double imgwidth;
  final double height;
  const MyBigAppBar({Key key, this.imgheight, this.imgwidth, this.height})
      : super(key: key);
  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: TabBar(
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 3,
        indicatorColor: Colors.white,
        tabs: [
          Text('Top Games', style: TextStyle(fontSize: 24)),
          Text('Articles', style: TextStyle(fontSize: 24)),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      flexibleSpace: Container(
        padding: const EdgeInsets.all(20),
        child: Image(
          image: AssetImage('assets\\images\\logo.png'),
          height: imgheight,
          width: imgwidth,
        ),
      ),
    );
  }
}

class MyBigAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final double imgheight;
  final double imgwidth;
  final double height;
  const MyBigAppBar2({Key key, this.imgheight, this.imgwidth, this.height})
      : super(key: key);
  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: TabBar(
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 3,
        indicatorColor: Colors.white,
        tabs: [
          Text('Chats', style: TextStyle(fontSize: 18)),
          Text('Friends', style: TextStyle(fontSize: 18)),
          Text('Requests', style: TextStyle(fontSize: 16)),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      flexibleSpace: Container(
        padding: const EdgeInsets.all(20),
        child: Image(
          image: AssetImage('assets\\images\\logo.png'),
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 0.15,
        ),
      ),
    );
  }
}














//     Row(
//       children: [
//         CircleAvatar(
//           radius: 30,
//           backgroundColor: Colors.white,
//           child: Icon(
//             EvaIcons.person,
//             color: Theme.of(context).primaryColor,
//             size: 50,
//           ),
//         ),
//         Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Username',
//               style: TextStyle(fontSize: 24),
//             ),
//             Text(
//               '1304',
//               style: TextStyle(fontSize: 18),
//             )
//           ],
//         )
//       ],
//     ),
// ],
