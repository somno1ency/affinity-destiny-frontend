import '../component/enumeration/contact_type.dart';
import './navigation_title_args.dart';

class ContactCategory {
  final NavigationTitleArgs titleArgs;
  final ContactType type;

  const ContactCategory({
    required this.titleArgs,
    this.type = ContactType.alphabet,
  });
}
