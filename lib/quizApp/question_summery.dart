import 'package:flutter/material.dart';
import 'package:flutter_poc/quizApp/Summary_item.dart';

class QuestionSummery extends StatelessWidget {
  const QuestionSummery({super.key, required this.summeryData});

  final List<Map<String, Object>> summeryData;

  @override
  Widget build(BuildContext context) {
    print("ye hain mera summeryData ${summeryData}");
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: summeryData.map((data) {
            return SummaryItem(itemData: data);
          }).toList(),
        ),
      ),
    );
  }
}
