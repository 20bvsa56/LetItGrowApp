import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letItGrow/src/ui/career_page/career_page.dart';
import 'package:letItGrow/src/ui/contact_page/contact_page.dart';
import 'package:letItGrow/src/ui/home_page/home_page.dart';
import 'package:letItGrow/src/ui/services_page/services_page.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  CareerPageClickedEvent,
  ContactPageClickedEvent,
  ServicesPageClickedEvent
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc(NavigationStates initialState) : super(HomePage());

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.CareerPageClickedEvent:
        yield CareerPage();
        break;
      case NavigationEvents.ContactPageClickedEvent:
        yield ContactPage();
        break;
      case NavigationEvents.ServicesPageClickedEvent:
        yield ServicesPage();
        break;
    }
  }
}
