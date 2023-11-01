class Question {
  final String? question;
  final List<String>? options;
  final int indexOfAnswer;

  Question({this.question, this.options, required this.indexOfAnswer});
}

List<Question> questions = [
  Question(
    question:
        'Who holds the record for the most Olympic gold medals of all time?',
    options: [
      'Usain Bolt',
      'Michael Phelps',
      'Serena Williams',
      'Simone Biles'
    ],
    indexOfAnswer: 1,
  ),
  Question(
    question: "Which country won the FIFA World Cup in 2022?",
    options: ['Brazil', 'Italy', 'France', 'Argentina'],
    indexOfAnswer: 3,
  ),
  Question(
    question: "Which sport is associated with Wimbledon?",
    options: ['Golf', 'Cricket', 'Tennis', 'Soccer'],
    indexOfAnswer: 2,
  ),
  Question(
    question: "In which sport would you perform a slam dunk?",
    options: ['Basketball', 'Volleyball', 'Ice Hockey', 'Gymnastics'],
    indexOfAnswer: 0,
  ),
  Question(
    question: "Who is known as 'The Rocket' in the world of snooker?",
    options: [
      'Judd Trump',
      ' Stephen Hendry',
      'Mark Selby',
      "Ronnie O'Sullivan"
    ],
    indexOfAnswer: 3,
  ),
  Question(
    question:
        "Which country is famous for its dominance in the sport of cricket?",
    options: ['Australia', 'England', 'India', 'South Africa'],
    indexOfAnswer: 2,
  ),
];
