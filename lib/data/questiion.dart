import 'package:flutter_poc/models/quiz_question.dart';

List<QuizQuestion> questions = [
  QuizQuestion(
    "What are the Main Building Blocks of Flutter Uis ?",
    ["Widgets", "Components", "Block", "Functions"],
  ),
  QuizQuestion("How are Flutter Uis built?", [
    "By Combining Widgets in Code",
    "By Combining Widgets.in visual editor",
    "By defining Widgets in Config files",
    "By using Xcode for ios and android studio for android"
  ]),
  QuizQuestion(
    'What\'s the purpose of a StatefulWidget?',
    [
      'Update UI as data changes',
      'Update data as UI changes',
      'Ignore data changes',
      'Render UI that does not depend on data',
    ],
  ),
  QuizQuestion(
    'What happens if you change data in a StatelessWidget?',
    [
      'The UI is not updated',
      'The UI is updated',
      'The closest StatefulWidget is updated',
      'Any nested StatefulWidgets are updated',
    ],
  ),
  QuizQuestion(
    'How should you update data inside of StatefulWidgets?',
    [
      'By calling setState()',
      'By calling updateData()',
      'By calling updateUI()',
      'By calling updateState()',
    ],
  ),
];
