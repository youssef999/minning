import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
//   final title;
//   final function;
//   final mdw ;
//   const MyButton({Key key, this.function, this.title , this.mdw}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FlatButton(
//         color: Colors.orange[900],
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//         onPressed: function,
//         minWidth: mdw/1.5,
//         child: Text("$title" , style: TextStyle(color: Colors.white , fontSize: 25),));
//   }

// }



  @override
  Widget build(BuildContext context) {

    Widget defaultTextButton({
    @required Function function,
    @required String text,
  }) =>
      TextButton(
        onPressed: function,
        child: Text(text.toUpperCase()),
      );
  }
 
}


 void navigateAndFinish(
  context,
  widget, {Text child}
) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) => false,
    );

