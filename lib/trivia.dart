import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'dart:math';
import 'dart:ui';

class TriviaPage extends StatefulWidget {
  const TriviaPage({super.key});

  @override
  _TriviaPageState createState() => _TriviaPageState();
}

class _TriviaPageState extends State<TriviaPage> {
  final List<Map<String, Object>> _questions = [
    {
      'question': 'Which goddess is worshipped during Durga Puja?',
      'options': ['Lakshmi', 'Saraswati', 'Durga', 'Kali'],
      'answer': 'Durga',
      'hint': 'She is the warrior goddess.'
    },
    {
      'question': 'How many days does Durga Puja last?',
      'options': ['5', '7', '9', '10'],
      'answer': '5',
      'hint': 'It usually starts with Mahalaya and ends with Dashami.'
    },
    {
      'question': 'Which goddess is worshipped during Durga Puja?',
      'options': ['Lakshmi', 'Saraswati', 'Durga', 'Kali'],
      'answer': 'Durga',
      'hint': 'She is the warrior goddess.'
    },
    {
      'question': 'How many days does Durga Puja last?',
      'options': ['5', '7', '9', '10'],
      'answer': '5',
      'hint': 'It usually starts with Mahalaya and ends with Dashami.'
    },
    {
      'question':
          'Which city is famous for the biggest Durga Puja celebration?',
      'options': ['Kolkata', 'Mumbai', 'Delhi', 'Chennai'],
      'answer': 'Kolkata',
      'hint': 'It is known as the cultural capital of India.'
    },
    {
      'question': 'Which festival follows Durga Puja in India?',
      'options': ['Diwali', 'Holi', 'Eid', 'Christmas'],
      'answer': 'Diwali',
      'hint': 'It is the festival of lights.'
    },
    {
      'question': 'On which day does the Durga Puja immersion take place?',
      'options': [
        'Maha Ashtami',
        'Maha Navami',
        'Vijaya Dashami',
        'Maha Saptami'
      ],
      'answer': 'Vijaya Dashami',
      'hint': 'It marks the end of the Puja.'
    },
    {
      'question': 'Which color is traditionally worn during Durga Puja?',
      'options': ['Red', 'Blue', 'Green', 'Yellow'],
      'answer': 'Red',
      'hint': 'It symbolizes passion and energy.'
    },
    {
      'question':
          'What is the name of the ten-armed goddess depicted in Durga Puja?',
      'options': ['Sita', 'Durga', 'Radha', 'Parvati'],
      'answer': 'Durga',
      'hint': 'She holds a weapon in each hand.'
    },
    {
      'question': 'Which flower is considered auspicious for Durga Puja?',
      'options': ['Rose', 'Marigold', 'Lotus', 'Jasmine'],
      'answer': 'Marigold',
      'hint': 'It is yellow or orange in color.'
    },
    {
      'question':
          'What is the name of Durga’s lion in the Durga Puja festivities?',
      'options': ['Simha', 'Shiva', 'Nandi', 'Mahisha'],
      'answer': 'Simha',
      'hint': 'It is known as the king of the jungle.'
    },
    {
      'question': 'What does “Mahalaya” signify in Durga Puja?',
      'options': [
        'Beginning of Navratri',
        'End of Dussehra',
        'Start of Puja preparations',
        'None of the above'
      ],
      'answer': 'Start of Puja preparations',
      'hint': 'It marks the start of festive preparations.'
    },
    {
      'question':
          'Who is the demon goddess Durga defeats in the legend of Durga Puja?',
      'options': ['Ravana', 'Kumbhakarna', 'Mahishasura', 'Shumbha'],
      'answer': 'Mahishasura',
      'hint': 'He is known as the buffalo demon.'
    },
    {
      'question': 'What is the significance of "Sindoor Khela" in Durga Puja?',
      'options': [
        'It is a dance ritual.',
        'It marks the end of the celebration.',
        'It is a ritual for married women.',
        'It is a worship of weapons.'
      ],
      'answer': 'It is a ritual for married women.',
      'hint': 'Women apply red powder on each other.'
    },
    {
      'question': 'Which traditional sweet is most associated with Durga Puja?',
      'options': ['Gulab Jamun', 'Rasgulla', 'Barfi', 'Jalebi'],
      'answer': 'Rasgulla',
      'hint': 'It is a round, syrupy dessert.'
    },
    {
      'question':
          'Which food is sacrificed in traditional Durga Puja ceremonies?',
      'options': ['Cucumber', 'Ash gourd', 'Pumpkin', 'Potatoe'],
      'answer': 'Ash Gourd',
      'hint': 'It is smaller than a gourd.'
    },
    {
      'question':
          'Durga Puja is mostly celebrated in which month of the Gregorian calendar?',
      'options': ['January', 'March', 'October', 'December'],
      'answer': 'October',
      'hint': 'It is usually around the time of autumn.'
    },
    // Add more questions here...
  ];

  int _currentQuestionIndex = 0;
  int _score = 0;
  String _selectedAnswer = '';
  String _feedbackMessage = '';
  Color _feedbackColor = Colors.black;

  void _submitAnswer(String answer) {
    setState(() {
      if (answer == _questions[_currentQuestionIndex]['answer']) {
        _score++;
        _feedbackMessage = 'Correct!';
        _feedbackColor = Colors.green;
      } else {
        _feedbackMessage =
            'Wrong! The correct answer is ${_questions[_currentQuestionIndex]['answer']}';
        _feedbackColor = Colors.red;
      }
      _currentQuestionIndex++;
      _selectedAnswer = '';
    });
  }

  void _showHint(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Hint'),
          titleTextStyle: const TextStyle(color: Colors.white),
          content: Text(_questions[_currentQuestionIndex]['hint'] as String),
          contentTextStyle: const TextStyle(color: Colors.white),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trivia Quiz'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          // Background Animation
          Positioned.fill(
            child: AnimatedBackground(),
          ),
          // Blur Effect
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          // Quiz Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _currentQuestionIndex < _questions.length
                ? _buildQuestion()
                : _buildResult(),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestion() {
    var currentQuestion = _questions[_currentQuestionIndex];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          currentQuestion['question'] as String,
          style: const TextStyle(fontSize: 24, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        ...(currentQuestion['options'] as List<String>).map((option) {
          return ListTile(
            title: Text(option, style: const TextStyle(color: Colors.white)),
            leading: Radio<String>(
              value: option,
              groupValue: _selectedAnswer,
              onChanged: (value) {
                setState(() {
                  _selectedAnswer = value!;
                });
              },
            ),
          );
        }).toList(),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _selectedAnswer.isEmpty
              ? null
              : () => _submitAnswer(_selectedAnswer),
          child: const Text('Submit Answer'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () => _showHint(context),
          child: const Text('Show Hint'),
        ),
        const SizedBox(height: 20),
        Text(
          _feedbackMessage,
          style: TextStyle(fontSize: 18, color: _feedbackColor),
        ),
      ],
    );
  }

  Widget _buildResult() {
    double correctPercentage =
        _questions.isNotEmpty ? (_score / _questions.length) * 100 : 0;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularPercentIndicator(
            radius: 150.0,
            lineWidth: 13.0,
            percent: correctPercentage / 100,
            center: Text(
              '${_score}/${_questions.length}',
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
            backgroundColor: Colors.grey[300]!,
            progressColor: Colors.green,
            circularStrokeCap: CircularStrokeCap.round,
            animation: true,
            animationDuration: 1000,
          ),
          const SizedBox(height: 20),
          Text(
            'You scored $_score out of ${_questions.length}',
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _currentQuestionIndex = 0;
                _score = 0;
                _selectedAnswer = '';
                _feedbackMessage = '';
                _feedbackColor = Colors.black;
              });
            },
            child: const Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }
}

class AnimatedBackground extends StatefulWidget {
  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(10, (index) {
        return AnimatedPositioned(
          duration: Duration(seconds: 5),
          left: Random().nextDouble() * MediaQuery.of(context).size.width,
          top: Random().nextDouble() * MediaQuery.of(context).size.height,
          child: AnimatedContainer(
            duration: Duration(seconds: 5),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color:
                  Colors.primaries[Random().nextInt(Colors.primaries.length)],
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        );
      }),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: TriviaPage(),
  ));
}
