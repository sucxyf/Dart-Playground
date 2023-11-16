import 'dart:io';

void main() {
  // Map of all expenses
  Map<String, double> expenses = {};
  double totalExpenses = 0.0;

  // Main menu
  while (true) {
    print('Expense Tracker Menu');
    print('1. Add expense');
    print('2. View expenses');
    print('3. Exit');

    // Get the user's choice
    int choice = int.parse(stdin.readLineSync()!);

    // Switch statement to handle the user's choice
    switch (choice) {
      case 1:
        // Add expense
        print('Enter expense name: ');
        String expenseName = stdin.readLineSync()!;

        print('Enter expense amount: ');
        double expenseAmount = double.parse(stdin.readLineSync()!);

        expenses[expenseName] = expenseAmount;
        totalExpenses += expenseAmount;

        print('Expense added successfully!');
        break;
      case 2:
        // View expenses
        print('List of all expenses:');
        // for (MapEntry<String, double> entry in expenses.entries) {
        //   print('${entry.key}: \$${entry.value}');
        // }
        expenses.forEach((key, value) {
        print('$key: \$$value');
      });
        print('Total expenses: \$$totalExpenses');
        break;
      case 3:
        // Exit
        print('Goodbye!');
        exit(0);
      default:
        print('Invalid choice!');
        break;
    }
  }
}
