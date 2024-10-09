import 'package:flutter/material.dart';
import 'package:upalerts/models/portfolio.dart';


class PortfolioProvider with ChangeNotifier {
 final List<Portfolio> _portfolios = [];

  List<Portfolio> get portfolios => _portfolios;

  void addPortfolio(Portfolio portfolio) {
    _portfolios.add(portfolio);
    notifyListeners(); 
  }

  void removePortfolio(int index) {
    _portfolios.removeAt(index);
    notifyListeners(); 
  }
    void updatePortfolio(int index, Portfolio updatedPortfolio) {
    if (index >= 0 && index < _portfolios.length) {
      _portfolios[index] = updatedPortfolio; 
      notifyListeners(); 
    }
  }
}