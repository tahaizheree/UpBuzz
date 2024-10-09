import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upalerts/appAssets/assets.dart';
import 'package:upalerts/models/portfolio.dart';
import 'package:upalerts/providers/portfolio_provider.dart';
import 'package:upalerts/res/res.dart';
import 'package:upalerts/screens/dashboard/alertScreenWidgets/no_alert.dart';

class PortfolioScreen extends StatefulWidget {
  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Consumer<PortfolioProvider>(
      builder: (context, portfolioProvider, child) {
        final filteredPortfolios = portfolioProvider.portfolios
            .where((portfolio) =>
                portfolio.title
                    .toLowerCase()
                    .contains(_searchQuery.toLowerCase()) ||
                portfolio.description
                    .toLowerCase()
                    .contains(_searchQuery.toLowerCase()))
            .toList();

        return Column(
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 252, 252, 252),
                  borderRadius: BorderRadius.circular(15)),
              margin:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: TextField(
                onChanged: (query) {
                  setState(() {
                    _searchQuery = query;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(
                            255, 255, 255, 255)), // Gray color on focus
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(
                            255, 255, 255, 255)), // Gray color when enabled
                  ),
                  prefixIcon: Icon(Icons.search,
                      color: Color.fromARGB(
                          255, 0, 0, 0)), // Make icon gray as well
                ),
              ),
            ),
            // Portfolio List
            Expanded(
              child: filteredPortfolios.isEmpty
                  ? const NoAlertScreen(activeScreen: "Portfolio")
                  : ListView.builder(
                      itemCount: filteredPortfolios.length,
                      itemBuilder: (context, index) {
                        final portfolio = filteredPortfolios[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 3,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    portfolio.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    portfolio.description,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 8,
                                          horizontal: 16,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                            color: Colors.green,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Text(
                                          portfolio.category,
                                          style: const TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: const Icon(Icons.edit,
                                                color: Colors.green),
                                            onPressed: () {
                                              // Show the edit bottom sheet
                                              showModalBottomSheet(
                                                context: context,
                                                isScrollControlled: true,
                                                builder: (context) =>
                                                    EditPortfolioSheet(
                                                  portfolio: portfolio,
                                                  onSave: (updatedPortfolio) {
                                                    portfolioProvider
                                                        .updatePortfolio(
                                                            index,
                                                            updatedPortfolio);
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.delete,
                                                color: Colors.red),
                                            onPressed: () {
                                              showModalBottomSheet(
                                                context: context,
                                                builder: (context) =>
                                                    DeleteConfirmationDialog(
                                                  onConfirm: () {
                                                    portfolioProvider
                                                        .removePortfolio(index);
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        );
      },
    );
  }
}

// Edit Portfolio Bottom Sheet
class EditPortfolioSheet extends StatefulWidget {
  final Portfolio portfolio;
  final Function(Portfolio) onSave;

  const EditPortfolioSheet({
    required this.portfolio,
    required this.onSave,
  });

  @override
  _EditPortfolioSheetState createState() => _EditPortfolioSheetState();
}

class _EditPortfolioSheetState extends State<EditPortfolioSheet> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _categoryController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.portfolio.title);
    _descriptionController =
        TextEditingController(text: widget.portfolio.description);
    _categoryController =
        TextEditingController(text: widget.portfolio.category);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: const EdgeInsets.only(left:16.0,right:16,top:16,bottom:50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
           
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final updatedPortfolio = Portfolio(
                      title: _titleController.text,
                      description: _descriptionController.text,
                      category: _categoryController.text,
                    );
                    widget.onSave(updatedPortfolio);
                    Navigator.pop(context); // Close the bottom sheet
                  },
                  child: const Text('Save'),
                ),
                SizedBox(width:getWidth()*0.01),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the bottom sheet
                  },
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



class DeleteConfirmationDialog extends StatelessWidget {
  const DeleteConfirmationDialog({super.key, required this.onConfirm});
  final VoidCallback onConfirm;
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.white,
      height: getHeight() * 0.4,
      width: getWidth(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.deletePortfolio,height: getHeight()*0.05,colorBlendMode: BlendMode.colorBurn,),
            SizedBox(height: getHeight() * 0.01),
            const Text(
              "Are you sure ?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: getHeight() * 0.01),
            SizedBox(
                width: getWidth() * 0.2,
                child: const Text(
                  "Do you really want to delete this item ?",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                )),
            SizedBox(height: getHeight() * 0.01),
            ElevatedButton(
              onPressed: onConfirm,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shadowColor: Colors.white,
                splashFactory: InkSparkle.splashFactory,
                padding: EdgeInsets.symmetric(
                    vertical: 15, horizontal: getWidth() * 0.085),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                'Confirm',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(height: getHeight()*0.005,),
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[100],
                shadowColor: Colors.white,
                splashFactory: InkSparkle.splashFactory,
                padding: EdgeInsets.symmetric(
                    vertical: 15, horizontal: getWidth() * 0.085),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                'Cancel',
                style: TextStyle(fontSize: 16, color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
