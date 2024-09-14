import 'enumeration/contact_type.dart';

class ContactCategory {
  final String title;
  final ContactType type;

  const ContactCategory({
    required this.title,
    this.type = ContactType.alphabet,
  });
}
