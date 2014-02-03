// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@MirrorsUsed(override: '*')
import 'dart:mirrors';
import 'package:angular/angular.dart';
import 'my_router.dart' show MyRouteInitializer;

class MyAppModule extends Module {
  MyAppModule() {
    type(RouteInitializer, implementedBy: MyRouteInitializer);
    factory(NgRoutingUsePushState,
        (_) => new NgRoutingUsePushState.value(false));
  }
}

// Temporary, please follow https://github.com/angular/angular.dart/issues/476
@MirrorsUsed(
  targets: const ['my_router'],
  override: '*')
main() {
  ngBootstrap(module: new MyAppModule());
}
