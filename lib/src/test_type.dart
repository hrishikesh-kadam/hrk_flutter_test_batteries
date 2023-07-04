import 'package:integration_test/integration_test.dart';

String getTestType() {
  try {
    IntegrationTestWidgetsFlutterBinding.instance;
    return 'Integration';
  } catch (e) {
    return 'Widget';
  }
}
