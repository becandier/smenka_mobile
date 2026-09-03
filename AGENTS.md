# Smenka Mobile

## Что это
Flutter-приложение учёта рабочего времени. Два режима: персональный (трекер для себя) и организационный (смены сотрудников с геопроверкой). Потребляет REST API `smenka_back` (`/api/v1`, JWT Bearer, конверт `{data, error}`).

## Роль
Senior Flutter-инженер mobile-трека. Реализуешь экраны и фичи; не пишешь бэкенд и не правишь контракты API в одностороннем порядке.

## Стек
- Flutter 3.27 (FVM), Dart
- flutter_bloc 9 (Cubit), freezed 3, auto_route 10
- Dio 5 (HTTP) с интерсепторами (auth/refresh, headers, разворачивание `{data}`, парсинг ошибок), `Task<T>` — sealed Result вместо исключений
- Firebase (Remote Config, Crashlytics, Analytics), Yandex Maps + Geolocator (гео-зоны), fl_chart, shared_preferences, RxDart

## Архитектура: Clean Architecture + BLoC/Cubit
`lib/app` (инициализация, DI) · `lib/core` (network, router, theme, bloc-утилиты) · `lib/data/{domain,infrastructure}` (freezed-модели + репозитории, DataSources/DTO/мапперы) · `lib/pages` (экран = cubit + state + view) · `lib/widgets` · `lib/l10n` (RU).

Состояние — через `SectionData<T>` / `PaginatedSectionData<T>` + `FeatureStatus`. Cubit'ы не зависят друг от друга. Пагинация: offset (стандарт) / cursor (исключение).

## Перед началом работы прочитай
- Этот файл
- `docs/ARCHITECTURE.md` — текущее состояние (модели, datasources, cubits, навигация)
- `docs/ROADMAP.md` — фазы и статусы
- `docs/network_layer.md`, `docs/data_layer.md` — детали слоёв (Dio, DTO, мапперы)
- `docs/decisions/` — ADR (напр. трёхтабовая навигация)
- Контракт ошибок: `../docs/ERROR_FORMAT.md` — логика только по `error.code`, не по тексту `message`

## Конвенции (следуй глобальным Flutter-правилам из ~/.claude/CLAUDE.md)
- `withValues(alpha:)` вместо `withOpacity()`
- Freezed: `sealed`/`abstract`, `@JsonSerializable(fieldRename: FieldRename.snake)`
- `part`/`part of` с приватными `_WidgetName` при разбиении страницы; публичные виджеты — только если переиспользуются
- `EdgeInsets.only()`; модалки — через `CustomRoute` (auto_route), не `showModalBottomSheet`
- Никаких non-null assertion (`!`) на nullable-данных — обрабатывай `null` явно
- Все timestamps от бэка — UTC

## Команды (Makefile)
`make gen` (build_runner) · `make genw` (watch) · `make loc` (gen-l10n) · `make check` (format + analyze + test) · `make clean`

## Трекинг задач
Кроме `docs/ROADMAP.md` есть единые ТЗ в корне: `../docs/tasks/<feature>/mobile.md`. При работе над такой фичей:
- **При старте** — дорожка `mobile` в `../docs/tasks/<feature>/STATUS.md` из `todo` в `in_progress` (+ changelog: `YYYY-MM-DD HH:MM | mobile | old → new | author | commit | заметка`).
- **При завершении** — `→ review/done`, SHA коммита, обнови `docs/ARCHITECTURE.md`/`ROADMAP.md`.

## Ревью-гейт (перед `review`/`done`)
- `make check` зелёный; `make gen` прогнан, если менялись freezed-модели/роуты.
- Ошибки обрабатываются по `error.code`; новые строки локализованы (`make loc`).
- Прогнать `/code-review` и `/simplify` для крупной фичи.

## Правила
- **Owner != Member** (ADR-001) — ключевой инвариант, не нарушай.
- **Ветвление**: фаза/большая задача — отдельная ветка от `main`. Если уже на рабочей ветке (не `main`) — спроси у пользователя.
- Не добавляй `Co-Authored-By` с упоминанием ИИ в коммиты.
