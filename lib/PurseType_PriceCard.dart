import 'package:flutter/material.dart';

class PurseTypePriceCard extends StatelessWidget {
  final double cardHeight;
  final double? cardWidth;
  final Color cardColor;
  final bool enableGradient;
  final Color dotColor;
  final LinearGradient? gradient;
  final String price;
  final TextStyle? priceTextStyle;
  final DecorationImage? priceBackgroundImage;
  final String title;
  final TextStyle? titleTextStyle;
  final String content;
  final TextStyle? contentTextStyle;
  const PurseTypePriceCard({Key? key,required this.cardHeight, this.cardWidth, required this.cardColor, required this.dotColor, this.gradient, required this.price,   this.priceTextStyle, this.priceBackgroundImage, required this.title,   this.titleTextStyle, required this.content,   this.contentTextStyle, required this.enableGradient}) : super(key: key);

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
          Container(
            height:cardHeight!=null? cardHeight/1.2 : 90,
            decoration:enableGradient == false ?
            BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(80),bottomRight: Radius.circular(80),topLeft: Radius.circular(8),bottomLeft: Radius.circular(8)),
              image: priceBackgroundImage==null ?
              DecorationImage(
                  image: AssetImage(
                    'assets/credit bg.png',
                  ),fit: BoxFit.fill
              ) : priceBackgroundImage,
            )
           : BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(80),bottomRight: Radius.circular(80),topLeft: Radius.circular(8),bottomLeft: Radius.circular(8)),
              gradient: gradient==null ?
              LinearGradient(
                  colors: [Color(0xff0c7bb3),Color(0xff21aabd)],
                  begin: Alignment.topLeft, end: Alignment.bottomRight
              ):gradient,


            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Text('${price}',style:priceTextStyle==null ? TextStyle(fontWeight: FontWeight.w800,color: Colors.white,fontSize: 30) : priceTextStyle),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0,top: 10,bottom: 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 10,height: 10,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:dotColor==null ? Colors.white : dotColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text('${title}',style:titleTextStyle==null? TextStyle(fontWeight: FontWeight.w800,color: Colors.white,fontSize: 20):titleTextStyle)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                      width: 150,
                      child: Text('${content}',style:contentTextStyle == null ? TextStyle(color: Colors.white,fontSize: 15):contentTextStyle,textAlign: TextAlign.right,maxLines: 2,overflow: TextOverflow.ellipsis,)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
