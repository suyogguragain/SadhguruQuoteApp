import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:quote_app/ui/styleguide/theme_text.dart';
import 'dart:math';


class QuoteWidget extends StatelessWidget {

  final Color backgroundColor;
  final String quote, author;

   QuoteWidget({ this.backgroundColor, this.quote, this.author});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,width: 350,height: 660);
    Random random = new Random();
    int randomNumber = random.nextInt(2);
    return Container(
      width: ScreenUtil.screenWidthPx,
      decoration: BoxDecoration(
          color: backgroundColor,
          image: DecorationImage(image: AssetImage('assests/images/isha_$randomNumber.jpg'),fit: BoxFit.cover)),
      //color: backgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(16),
          vertical: ScreenUtil().setHeight(40),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: ScreenUtil().setHeight(365),),
            Image.asset(
              "assests/images/quotes.png",
              color: Colors.white.withOpacity(0.4),
              width: ScreenUtil().setWidth(70),
              height: ScreenUtil().setHeight(70),
            ),
            Expanded(
              child: Text(
                quote,
                style: ThemeText.headline,
              ),
            ),
            Text(
              author,
              style: ThemeText.subhead,
            ),
          ],
        ),
      ),
    );
  }
}
