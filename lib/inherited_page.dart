import 'package:flutter/cupertino.dart';

class MyInheritedWidget extends InheritedWidget {
  final int myData;

  //Là constructor của MyInheritedWidget, constructor này nhận ít nhất 2 param:
  // thứ nhất là child chính là những widget con của nó - những widget mà sau này sẽ giơ cao cánh tay lên chộp lấy data từ nó đó 😄.
  // Thứ 2 là myData chính là data mà nó sẽ chia sẻ đến cho các widget con của nó đó.
  MyInheritedWidget({Widget child, this.myData}) : super(child: child);


  @override
  bool updateShouldNotify(covariant MyInheritedWidget oldWidget) {
    return myData %2 == 1;
  }

  //Hàm dependOnInheritedWidgetOfExactType truyền vào Widget type.
  // Nó sẽ giúp ta get được Widget cha gần vị trí context nhất theo cái Type mình truyền vào. Trong code này, mình truyền vào type là MyInheritedWidget nên nó sẽ tìm widget cha có type là MyInheritedWidget mà gần vị trí context nhất
  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }
}
