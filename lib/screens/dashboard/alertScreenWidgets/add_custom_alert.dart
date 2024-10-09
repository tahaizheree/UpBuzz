import 'package:flutter/material.dart';
import 'package:upalerts/res/res.dart';

class AddCustomAlertScreen extends StatefulWidget {
  const AddCustomAlertScreen({super.key});

  @override
  State<AddCustomAlertScreen> createState() => _AddCustomAlertScreenState();
}

class _AddCustomAlertScreenState extends State<AddCustomAlertScreen> {
  // Controllers for text input fields
  final TextEditingController _alertNameController = TextEditingController();
  final TextEditingController _positiveKeywordsController =
      TextEditingController();
  final TextEditingController _negativeKeywordsController =
      TextEditingController();
  final TextEditingController _minHourlyRateController =
      TextEditingController();
  final TextEditingController _maxHourlyRateController =
      TextEditingController();

  // State for the Dropdowns
  String _selectedPaymentMethod = 'Verified';
  String _selectedCountry = 'Anywhere in the world';

  // Keyword lists
  final List<String> _positiveKeywords = [];
  final List<String> _negativeKeywords = [];

  //Controllers disposing
  @override
  void dispose() {
    _alertNameController.dispose();
    _positiveKeywordsController.dispose();
    _negativeKeywordsController.dispose();
    _minHourlyRateController.dispose();
    _maxHourlyRateController.dispose();
    super.dispose();
  }

  // Adds keywords to the appropriate list when "Enter" is pressed
  void _addKeyword(String keyword, {required bool isPositive}) {
    if (keyword.isNotEmpty) {
      setState(() {
        if (isPositive) {
          _positiveKeywords.add(keyword);
        } else {
          _negativeKeywords.add(keyword);
        }
      });
    }
  }

  // Removes keywords from the list
  void _removeKeyword(String keyword, {required bool isPositive}) {
    setState(() {
      if (isPositive) {
        _positiveKeywords.remove(keyword);
      } else {
        _negativeKeywords.remove(keyword);
      }
    });
  }

  void _saveChanges() {
    String alertName = _alertNameController.text;
    String minRate = _minHourlyRateController.text;
    String maxRate = _maxHourlyRateController.text;

    if (alertName.isNotEmpty && minRate.isNotEmpty && maxRate.isNotEmpty) {
      //Send to firebase
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Alert saved successfully!")),
        
      );
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill out all fields.")),
      );
    }
  }

  // Cancel action
  void _cancel() {
    Navigator.pop(context);
  }

  // Handle key press for Enter to add keyword
  void _handleKeywordSubmission(
      TextEditingController controller, bool isPositive) {
    String keyword = controller.text;
    _addKeyword(keyword, isPositive: isPositive);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Add Custom Alert',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: getHeight() * 0.002, color: Colors.grey[300]),
              SizedBox(
                height: getHeight() * 0.005,
              ),
              // Description
              const Text(
                "You will get alerts whenever a new job contains keywords you will add here.",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // Alert Name TextField
              _buildTextField(
                  label: "Alert Name",
                  controller: _alertNameController,
                  isAlertName: true),
              SizedBox(height: getHeight() * 0.005),

              // Positive Keywords TextField
              _buildKeywordInput(
                label: "Positive Keywords",
                controller: _positiveKeywordsController,
                isPositive: true,
              ),
              SizedBox(height: getHeight() * 0.005),

              // Positive Keyword Chips
              _buildKeywordChips(
                keywords: _positiveKeywords,
                color: Colors.green,
                isPositive: true,
              ),
              SizedBox(height: getHeight() * 0.005),

              // Negative Keywords TextField and Add on Enter
              _buildKeywordInput(
                label: "Negative Keywords",
                controller: _negativeKeywordsController,
                isPositive: false,
              ),
             SizedBox(height: getHeight() * 0.005),

              // Negative Keyword Chips (Red)
              _buildKeywordChips(
                keywords: _negativeKeywords,
                color: Colors.red,
                isPositive: false,
              ),
             SizedBox(height: getHeight() * 0.005),
Container(height: getHeight() * 0.002, color: Colors.grey[300]),
 SizedBox(height: getHeight() * 0.005),
              // Client Info Section
              const Text(
                "Client Info",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: getHeight() * 0.005),

              // Minimum Hourly Rate
              _buildTextField(
                label: "Minimum Hourly Rate",
                controller: _minHourlyRateController,
                isAlertName: false,
              ),
             SizedBox(height: getHeight() * 0.005),

              // Maximum Hourly Rate
              _buildTextField(
                label: "Maximum Hourly Rate",
                controller: _maxHourlyRateController,
                isAlertName: false,
              ),
              SizedBox(height: getHeight() * 0.005),

              // Payment Method Dropdown
              _buildDropdownField(
                label: "Payment Method",
                value: _selectedPaymentMethod,
                items: ['Verified', 'Unverified'],
                onChanged: (newValue) {
                  setState(() {
                    _selectedPaymentMethod = newValue!;
                  });
                },
              ),
            SizedBox(height: getHeight() * 0.005),

              // Country Dropdown
              _buildDropdownField(
                label: "Country",
                value: _selectedCountry,
                items: [
                  'Anywhere in the world',
                  'United States',
                  'Europe',
                  'Asia'
                ],
                onChanged: (newValue) {
                  setState(() {
                    _selectedCountry = newValue!;
                  });
                },
              ),
              SizedBox(height: getHeight()*0.005,),

              // Save and Cancel buttons
              _buildActionButtons(),
 SizedBox(height: getHeight()*0.02,),
            ],
          ),
        ),
      ),
    );
  }

  // Custom reusable method for TextFields with floating labels
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required bool isAlertName,
  }) {
    return TextField(
      controller: controller,
      maxLength: isAlertName ? 100 : null,
      keyboardType: isAlertName ? TextInputType.name : TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        prefixText: isAlertName ? null : "\$ ",
        floatingLabelStyle: const TextStyle(color: Colors.green),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.green),
          
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.green),
        ),
      ),
    );
  }

  // Keyword input with add-on Enter functionality
  Widget _buildKeywordInput({
    required String label,
    required TextEditingController controller,
    required bool isPositive,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        floatingLabelStyle: const TextStyle(color: Colors.green),
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.green),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.green),
        ),
      ),
      onSubmitted: (value) {
        _handleKeywordSubmission(controller, isPositive);
      },
    );
  }

  // Custom widget for displaying keyword chips
  Widget _buildKeywordChips({
    required List<String> keywords,
    required Color color,
    required bool isPositive,
  }) {
    return Wrap(
      spacing: 8.0,
      children: keywords.map((keyword) {
        return Chip(
          label: Text(keyword),
          backgroundColor: color.withOpacity(0.1),
          labelStyle: TextStyle(color: color),
          deleteIconColor: color,
          onDeleted: () {
            _removeKeyword(keyword, isPositive: isPositive);
          },
        );
      }).toList(),
    );
  }

  // Custom widget for Dropdown fields
  Widget _buildDropdownField({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        floatingLabelStyle: const TextStyle(color:Colors.green),
        
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.green),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.green),
        ),
      ),
      onChanged: onChanged,
      items: items.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
    );
  }

  // Buttons
  Widget _buildActionButtons() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            onPressed: _saveChanges,
            child: const Text('Save Changes'),
          ),
        ),
        SizedBox(height: getWidth() * 0.01),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15),
              side: const BorderSide(color: Colors.green),
            ),
            onPressed: _cancel,
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.green),
            ),
          ),
        ),
      ],
    );
  }
}
