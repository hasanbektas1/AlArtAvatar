import 'package:flutter/material.dart';

class PromptSuggestions extends StatefulWidget {
  @override
  _PromptSuggestionsState createState() => _PromptSuggestionsState();
}

class _PromptSuggestionsState extends State<PromptSuggestions>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: _toggleExpand,
          child: Row(
            children: [
              const Text(
                'Prompt Suggestions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Icon(
                _isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                size: 32,
              ),
            ],
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: _isExpanded ? 200 : 0,
          child: _isExpanded
              ? ListView(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // İşlemler
                      },
                      child: const Text('Öneri 1'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // İşlemler
                      },
                      child: Text('Öneri 2'),
                    ),
                    // Diğer öneri butonları
                  ],
                )
              : null,
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Prompt Suggestions')),
      body: Center(
        child: PromptSuggestions(),
      ),
    ),
  ));
}
