import 'contact_category.dart';

class NavigationArgs {
  final int index;
  final String args0;
  final String args1;
  final ContactCategory args2;
  final String args3;
  final String args4;

  const NavigationArgs({
    this.index = 0,
    this.args0 = '',
    this.args1 = '',
    this.args2 = const ContactCategory(title: ''),
    this.args3 = '',
    this.args4 = '',
  });
}
