import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:love_store/data/provider/authentiaction_provider.dart';

import '../../ui/route/app_router.dart';
import '../../ui/route/route_gaurd.dart';

final appRouterProvider = Provider(
    ((ref) => AppRouter(routeGuard: RouteGuard(ref.read(tokenProvider)))));
