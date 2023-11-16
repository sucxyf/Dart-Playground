import 'dart:math';

void main() {
  int passwordLength = 12; // Adjust the desired password length
  String newPassword = generateRandomPassword(passwordLength);
  
  print("Generated Password: $newPassword");
}

String generateRandomPassword(int length) {
  const String validChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()-_";
  Random random = Random();
  
  String password = '';
  for (int i = 0; i < length; i++) {
    int randomIndex = random.nextInt(validChars.length);
    password += validChars[randomIndex];
  }
  
  return password;
}
