import 'package:flutter/material.dart';

class InvertPriceCard extends StatelessWidget {
  final double cardHeight;
  final double? cardWidth;
  final Color cardColor;
  final String price;
  final TextStyle? priceTextStyle;
  final Color priceBackgroundColor;
  final Color slantingContainerColor;
  final String title;
  final TextStyle? titleTextStyle;
  final String content;
  final TextStyle? contentTextStyle;

  const InvertPriceCard({Key? key, required this.cardHeight, this.cardWidth, required this.cardColor, required this.price, this.priceTextStyle, required this.priceBackgroundColor, required this.slantingContainerColor, required this.title, this.titleTextStyle, required this.content, this.contentTextStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:cardHeight==null? 120 : cardHeight,
      width:cardWidth == null? MediaQuery.of(context).size.width*0.85 : cardWidth,
      decoration: BoxDecoration(
          color:cardColor==null? Color(0xff1d1b1b) : cardColor,
          borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Padding(
            padding: const EdgeInsets.only(left: 15.0,top: 10,bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Center(child: Text('${title}',style:titleTextStyle==null? TextStyle(fontWeight: FontWeight.w800,color: Colors.white,fontSize: 20):titleTextStyle)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Container(
                      width: 150,
                      child: Text('${content}',style:contentTextStyle == null ? TextStyle(color: Colors.white,fontSize: 15):contentTextStyle,textAlign: TextAlign.left,maxLines: 2,overflow: TextOverflow.ellipsis,)),
                ),
              ],
            ),
          ),
          Container(
          //  height:cardHeight!=null? cardHeight/1.2 : 90,
            decoration:

                 BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight: Radius.circular(8),topLeft: Radius.circular(0),bottomLeft: Radius.circular(0)),
              gradient:
                       LinearGradient(
                            colors: [
                              Color(0xffffff) ,
                             slantingContainerColor],
                            stops: [0.5,
                              0.5],
                            begin: Alignment.topLeft, end: Alignment.bottomRight
                        ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Container(
                  height: 90,width: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:priceBackgroundColor
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Center(child: Text('${price}',style:priceTextStyle==null ? TextStyle(fontWeight: FontWeight.w800,color: Colors.teal,fontSize: 25) : priceTextStyle,textAlign: TextAlign.right,)),
                    )),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
