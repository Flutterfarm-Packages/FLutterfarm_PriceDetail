import 'package:flutter/material.dart';

class BlandPriceDetailCard extends StatefulWidget {
  final double? cardWidth;
  final String heading;
  final TextStyle? headingTextStyle;
  final String price;
  final TextStyle? priceTextStyle;
  final String pricePeriod;
  final TextStyle? pricePeriodTextStyle;
  final Color? dividerColor;
  final Color? cardBgColor;
  final List detailsList;

  const BlandPriceDetailCard(
      {Key? key,
      this.cardWidth,
      required this.heading,
      required this.price,
      required this.pricePeriod,
      this.dividerColor,
      this.cardBgColor,
      required this.detailsList,
      this.headingTextStyle,
      this.priceTextStyle,
      this.pricePeriodTextStyle})
      : super(key: key);

  @override
  _BlandPriceDetailCardState createState() => _BlandPriceDetailCardState();
}

class _BlandPriceDetailCardState extends State<BlandPriceDetailCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.cardWidth == null
          ? MediaQuery.of(context).size.width * 0.7
          : widget.cardWidth,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x9e787777),
            offset: Offset(
              1.0,
              3.0,
            ),
            blurRadius: 15,
          ),
        ],
        color: widget.cardBgColor == null ? Colors.white : widget.cardBgColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              '${widget.heading}',
              style: widget.headingTextStyle == null
                  ? TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2)
                  : widget.headingTextStyle,
            ),
            SizedBox(
              height: 19,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  ' ${widget.price}',
                  style: widget.priceTextStyle == null
                      ? TextStyle(
                          fontSize: 30,
                          color: Color(0xb0000000),
                          fontWeight: FontWeight.bold,
                        )
                      : widget.priceTextStyle,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Text(
                    ' /${widget.pricePeriod}',
                    style: widget.pricePeriodTextStyle == null
                        ? TextStyle(
                            fontSize: 12,
                          )
                        : widget.pricePeriodTextStyle,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(5)),
              width: 100,
              height: 5,
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: FittedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for(int i = 0; i< widget.detailsList.length;i++)
                      widget.detailsList[i]
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailList extends StatelessWidget {
  final _detailItems? item;
  final TextStyle? DetailTextStyle;
  const DetailList({Key? key, this.DetailTextStyle, this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            item?.icon,
            size: 20,
            color: Colors.blue,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            '${item?.detailText}',
            style: DetailTextStyle == null
                ? TextStyle(
                    fontSize: 13.5,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.5)
                : DetailTextStyle,
          ),
        ],
      ),
    );
  }
}

class _detailItems {
  _detailItems({
    required this.icon,
    required this.detailText,
  });
  final IconData icon;
  final String detailText;
}
