import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget{
  final String? text;
  final bool received;
  const ChatBubble({super.key, this.text, required this.received});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: received? Colors.deepOrangeAccent : Colors.orange,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(received ? 150:0),
              bottomLeft: Radius.circular(150),
              topRight: Radius.circular(received ? 0:150),
              bottomRight: Radius.circular(150)
          )
      ),
      padding: EdgeInsets.all(10),
      child: Text(text!, textWidthBasis: TextWidthBasis.longestLine,),
    );
  }
}