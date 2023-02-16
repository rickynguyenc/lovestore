import 'package:auto_route/auto_route.dart';

import '../../data/provider/authentiaction_provider.dart';
import 'app_router.dart';

//https://autoroute.vercel.app/advanced/route_guards
class RouteGuard extends AutoRouteGuard {
  RouteGuard(this._tokenNotifier);
  final TokenNotifier _tokenNotifier;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    // final id = resolver.route.pathParams.get('id');
    // final provider = AppWidget.instance.ref.read(userProvider.notifier);
    if (_tokenNotifier.isAuthentication) {
      // if user is authenticated we continue
      resolver.next();
    } else {
      // we redirect the user to our login page
      router.pushAndPopUntil(const LoginRoute(), predicate: (r) => true);
    }
  }
}
