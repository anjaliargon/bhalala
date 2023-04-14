import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';

import 'connectivity_provider.dart';

List<SingleChildWidget> providers = [
  //...independentServices,
  //...dependentServices,
  ...uiConsumableProviders,
];

List<SingleChildWidget> uiConsumableProviders = [
  ChangeNotifierProvider(create: (_) => ConnectivityProvider()),
];
