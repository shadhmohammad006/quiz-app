class Question {
  final String? question;
  final List<String>? options;
  final int indexOfAnswer;

  Question({this.question, this.options, required this.indexOfAnswer});
}

List<Question> questions = [
  Question(
    question: 'What is 2 + 2?',
    options: ['4', '5', '6', '7'],
    indexOfAnswer: 0,
  ),
  Question(
    question: "What is the opposite of 'hot' ?",
    options: ['Touch', 'Cold', 'Normal', 'Heet'],
    indexOfAnswer: 1,
  ),
  Question(
    question: "What is the fastest land animal?",
    options: ['Jaguar', 'Eagle', 'Jet', 'Cheetah'],
    indexOfAnswer: 3,
  ),
  Question(
    question: "What is the official language of Kerala?",
    options: ['Kannada', 'Tamil', 'Malayalam', 'Hindi'],
    indexOfAnswer: 2,
  ),
  Question(
    question: "What is 5 + 5 ?",
    options: ['10', '16', '22', '9'],
    indexOfAnswer: 0,
  ),
  Question(
    question: "what is 100 - 40",
    options: ['30', '60', '70', '50'],
    indexOfAnswer: 1,
  ),
];
