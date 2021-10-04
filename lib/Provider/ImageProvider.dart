import 'dart:math';

import 'package:flutter_project/View/widgets/logger_widget.dart';

String getImage() {
  List<String> _imgList = [
    'https://images.unsplash.com/photo-1613363174863-5a000a4cb0bf?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8d2F0ZXIlMjBmYWN0b3J5fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1569140733923-84a8df713511?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8d2F0ZXIlMjBmYWN0b3J5fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1524037755327-dc2def03712a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8d2F0ZXIlMjBmYWN0b3J5fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1518471683746-63f3aff4ed13?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzJ8fHdhdGVyJTIwZmFjdG9yeXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1578620164663-a05f05147468?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fHdhdGVyJTIwZmFjdG9yeXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1577586854297-01a2f2aaffa2?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fHdhdGVyJTIwZmFjdG9yeXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1565444600135-45994b3d88bc?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjd8fHdhdGVyJTIwZmFjdG9yeXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
  ];
  Random random = new Random();
  int randomNumber = random.nextInt(_imgList.length - 1);
  return _imgList[randomNumber];
}
