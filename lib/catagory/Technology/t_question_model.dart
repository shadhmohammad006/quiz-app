class Question {
  final String? question;
  final List<String>? options;
  final int indexOfAnswer;

  Question({this.question, this.options, required this.indexOfAnswer});
}

List<Question> questions = [
  Question(
    question: 'What do you call a portable computer?',
    options: ['Desktop', 'Laptop', 'Tablet', 'Smart Phone'],
    indexOfAnswer: 1,
  ),
  Question(
    question:
        "What is the device used to input letters, numbers, and commands into a computer?",
    options: ['Mouse', 'Keyboard', 'Monitor', 'Printer'],
    indexOfAnswer: 1,
  ),
  Question(
    question: "What is the main board inside a computer called?",
    options: ['CPU', 'RAM', 'Mother Board', 'Hard Drive'],
    indexOfAnswer: 2,
  ),
  Question(
    question: "What type of screen do most smartphones have?",
    options: ['Flip', 'Rotary', 'Slide', 'Touchscreen'],
    indexOfAnswer: 3,
  ),
  Question(
    question: "What is the programming language used for styling web pages?",
    options: ['HTML', 'Java Script', 'CSS', 'Python'],
    indexOfAnswer: 2,
  ),
  Question(
    question:
        "What do you call a unique string of numbers used to identify devices on a network?",
    options: ['IP Address', 'URL', 'ISP', 'DNS'],
    indexOfAnswer: 0,
  ),
];
