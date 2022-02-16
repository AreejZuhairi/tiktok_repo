
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class CustomBottomNavigationBar extends StatelessWidget{
  const CustomBottomNavigationBar({Key? key, 
  required this.selectedPageIndex,required this.onIconTap}):super(key: key);
final int selectedPageIndex;
final Function  onIconTap;
  @override
  Widget build(BuildContext context){
    final barHeight = MediaQuery.of(context).size.height * 0.06;
    final style = Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 11,
    fontWeight: FontWeight.w600);
    return  BottomAppBar(
      color: selectedPageIndex ==0 ? Colors.black:Colors.white,
      child: SizedBox(
        height: barHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
           children: [
             _bottomBarNavItem(0, 'Home',  style, 'home'),
              _bottomBarNavItem(1, 'Discover',  style, 'search'),
              _addVideoNavItem(barHeight),
                _bottomBarNavItem(3, 'Inbox',  style, 'message'),
              _bottomBarNavItem(4, 'Profile',  style, 'account'),
           ],
          )
        ,),
     
    );
  }

  _bottomBarNavItem(
    int index, String label, TextStyle textStyle, 
    String iconName){
      bool isSelected = selectedPageIndex == index;
      Color iconAndTextColor= isSelected? Colors.black: Colors.grey;
      if (isSelected && selectedPageIndex == 0){
        iconAndTextColor = Colors.white;}
      return GestureDetector(
        onTap: () =>{onIconTap(index)},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          SvgPicture.asset('assets/${isSelected ? 
          iconName +'_filled' : iconName}.svg', 
          color: iconAndTextColor,width: 20, height: 20,),
        
          const SizedBox(
            height: 3,
          ),
          Text(label, style: textStyle.copyWith(color: iconAndTextColor),)
        ],),
      );
    }

    _addVideoNavItem (double height){
      return Container(
        height: height -15,
        width: 48,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors:[ Colors.blueAccent, Colors.redAccent]),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Container(
            height: height-20,
            width: 41,
            decoration: BoxDecoration(
              color: selectedPageIndex == 0? Colors.white:Colors.black,

            ),
            child: Icon(
              Icons.add,
              color: selectedPageIndex == 0? Colors.black:Colors.white,
            ),
            ),
        ),
      );
    }
}