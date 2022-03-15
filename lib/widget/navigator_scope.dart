import 'package:flutter/material.dart';

/// Widget to maintain [BuildContext] when change screens
class NavigatorScope extends StatefulWidget {
  /// Builder of widget tree with navigator using home widget as parameter,
  /// return navigator has child of dependencies
  final Widget Function(BuildContext context, Navigator navigator) builder;

  /// Home widget of Navigator
  final Widget home;

  /// List of routes of this Navigator
  final Map<String, WidgetBuilder> routes;

  /// Callback to catch when navigator will pop
  final Future<bool> Function()? onWillPop;

  /// Default constructor
  NavigatorScope({
    Key? key,
    required this.routes,
    required this.builder,
    required this.home,
    this.onWillPop,
  }) : super(key: key);

  @override
  _NavigatorScopeState createState() => _NavigatorScopeState();
}

class _NavigatorScopeState extends State<NavigatorScope>
    with AutomaticKeepAliveClientMixin {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WillPopScope(
      onWillPop: () async {
        if (_navigatorKey.currentState!.canPop()) {
          _navigatorKey.currentState!.pop();
          return false;
        }

        final pop = await widget.onWillPop?.call();

        return pop ?? true;
      },
      child: widget.builder(context, _navigator(widget.home)),
    );
  }

  Navigator _navigator(Widget child) {
    return Navigator(
      key: _navigatorKey,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: widget.routes[settings.name]!,
          settings: settings,
        );
      },
      pages: [
        MaterialPage(child: child),
      ],
      onPopPage: (route, result) {
        if (route.isFirst) {
          Navigator.maybePop(context);
          return false;
        }

        return route.didPop(result);
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
