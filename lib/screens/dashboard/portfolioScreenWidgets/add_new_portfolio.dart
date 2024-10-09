import 'package:flutter/material.dart';
import 'package:upalerts/models/portfolio.dart';

class AddPortfolioScreen extends StatefulWidget {
  const AddPortfolioScreen({super.key});

  @override
  State<AddPortfolioScreen> createState() => _AddPortfolioScreenState();
}

class _AddPortfolioScreenState extends State<AddPortfolioScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String selectedCategory = 'App Design';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Portfolio'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              maxLength: 200,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color:Colors.green)
                ),
               focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:Colors.green)
                ),
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedCategory,
              decoration: const InputDecoration(
                labelText: 'Select Category',
                 border: OutlineInputBorder(
                  borderSide: BorderSide(color:Colors.green)
                ),
               focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:Colors.green)
                ),
              ),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue!;
                });
              },
              items: <String>['App Design', 'Web Development', 'UI/UX Design']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _descriptionController,
              maxLength: 1500,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Description',
                 border: OutlineInputBorder(
                  borderSide: BorderSide(color:Colors.green)
                ),
               focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:Colors.green)
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      final newPortfolio = Portfolio(
                        title: _titleController.text,
                        category: selectedCategory,
                        description: _descriptionController.text,
                      );
                      Navigator.pop(context, newPortfolio); // Pass back the new portfolio
                    },
                    style: ElevatedButton.styleFrom(
                     //primary: Colors.green,
                    ),
                    child: const Text('Save Profile'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      //primary: Colors.red,
                    ),
                    child: Text('Cancel'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}