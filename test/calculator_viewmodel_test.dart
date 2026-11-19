import 'package:calculator/models/input_type.dart';
import 'package:calculator/viewmodels/calculator_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CalculatorViewModel calculator;

  setUp(() {
    calculator = CalculatorViewModel();
  });

  tearDown(() {
    calculator.dispose();
  });

  void press(InputType input) {
    calculator.onPressButton(
      inputType: input,
      onTextOverflow: () => fail('Unexpected input overflow'),
    );
  }

  test('Delete leaves an empty display at zero', () {
    press(InputType.delete);
    press(InputType.delete);
    expect(calculator.displayText, '0');
  });

  test('Delete removes one digit and remains safe after deleting the last one',
      () {
    press(InputType.number1);
    press(InputType.number2);
    press(InputType.delete);
    expect(calculator.displayText, '1');
    press(InputType.delete);
    expect(calculator.displayText, '0');
    press(InputType.delete);
    expect(calculator.displayText, '0');
  });
}
