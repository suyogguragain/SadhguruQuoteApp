import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:quote_app/ui/common/quotes_widget.dart';
import 'package:random_color/random_color.dart';

class QuoteScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final RandomColor _randomColor = RandomColor();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,width: 350,height: 660);
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('quotes').snapshots(),
        builder: ( BuildContext context, AsyncSnapshot <QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return _LoadingIndicator();
          return PageView.builder(
            physics: ClampingScrollPhysics(),
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot data = snapshot.data.docs[index];
              Map getDocs = data.data();
                return QuoteWidget(
                  backgroundColor: _randomColor.randomColor(colorBrightness: ColorBrightness.dark),
                  quote: getDocs['quote'],
                  author: getDocs['author'],
                );
              },
          );
        },
      ),
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
