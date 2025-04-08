## Setup for new developer

This is step for a situation when project is ready and have been added new developer.

### 1. FVM

https://fvm.app/documentation/getting-started

You should be use fvm for work with project. This is guide for installation for your computer. The project already has fvm. Actual flutter version in pubcpec.yaml file.

  

### 2. flutter_gen

All assets add to project with flutter_gen. Check documentation. https://pub.dev/packages/flutter_gen

  

### 3. Localization

All text in UI should have localisation.

1 step. You add value in every .arb file (lib/l10n)

2 step. Generate locale make loc (flutter gen-l110n)

3 step. Use with context (context.l10n.hello)