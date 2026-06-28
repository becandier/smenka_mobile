# Makefile

API_ISSUER = 7d118c9f-e508-4d2a-8445-f774b6f6c38e
KEY_ID = Q6WPLKL8NJ

# ANSI code for blue text
BLUE = \033[0;34m
GREEN = \033[0;32m
NC = \033[0m # No Color

# ==================== Development ====================

gen:
	flutter pub run build_runner build --delete-conflicting-outputs

genw:
	flutter pub run build_runner watch --delete-conflicting-outputs

loc:
	flutter gen-l10n

clean:
	@echo "$(BLUE)Cleaning project...$(NC)"
	flutter clean
	flutter pub get
	@echo "$(GREEN)Done!$(NC)"

get:
	flutter pub get

# ==================== Quality ====================

analyze:
	@echo "$(BLUE)Running analysis...$(NC)"
	flutter analyze
	@echo "$(GREEN)Analysis complete!$(NC)"

format:
	@echo "$(BLUE)Formatting code...$(NC)"
	dart format lib test
	@echo "$(GREEN)Formatting complete!$(NC)"

fix:
	@echo "$(BLUE)Applying fixes...$(NC)"
	dart fix --apply
	@echo "$(GREEN)Fixes applied!$(NC)"

test:
	@echo "$(BLUE)Running tests...$(NC)"
	flutter test
	@echo "$(GREEN)Tests complete!$(NC)"

test-coverage:
	@echo "$(BLUE)Running tests with coverage...$(NC)"
	flutter test --coverage
	@echo "$(GREEN)Coverage report generated!$(NC)"

check:
	@echo "$(BLUE)Running full check (format + analyze + test)...$(NC)"
	dart format lib test
	flutter analyze
	flutter test
	@echo "$(GREEN)All checks passed!$(NC)"

# ==================== Web ====================

build-web:
	@echo "$(BLUE)Building Flutter web (release, prod-флейвор)...$(NC)"
	flutter build web --release --csp --base-href=/
	@echo "$(GREEN)Web build complete: build/web$(NC)"

# Локальная проверка Docker-образа web (как в проде: nginx + SPA-fallback).
docker-web:
	@echo "$(BLUE)Building web Docker image...$(NC)"
	docker build -t smenka_web:local .
	@echo "$(GREEN)Image built: smenka_web:local (запуск: docker run --rm -p 8080:80 smenka_web:local)$(NC)"

# ==================== Icons ====================

icons:
	@echo "$(BLUE)Generating app icons...$(NC)"
	dart run flutter_launcher_icons
	@echo "$(GREEN)Icons generated!$(NC)"

# ==================== Localization ====================

testfl:
	@echo "$(BLUE)Проверьте включен ли у вас VPN и актуален ли код версии!$(NC)"
	flutter clean
	flutter pub get
	flutter build ipa
	xcrun altool --upload-app --type ios -f build/ios/ipa/*.ipa --apiKey $(KEY_ID) --apiIssuer $(API_ISSUER)

release:
	@echo "$(BLUE)Проверьте включен ли у вас VPN и актуален ли код версии!$(NC)"
	flutter clean
	flutter pub get
	flutter build ipa
	xcrun altool --upload-app --type ios -f build/ios/ipa/*.ipa --apiKey $(KEY_ID) --apiIssuer $(API_ISSUER)
	flutter build appbundle
debug:
	@echo "$(BLUE)Проверьте включен ли у вас VPN и актуален ли код версии!$(NC)"
	flutter clean
	flutter pub get
	flutter build ipa
	xcrun altool --upload-app --type ios -f build/ios/ipa/*.ipa --apiKey $(KEY_ID) --apiIssuer $(API_ISSUER)
	flutter build apk
	

# xcrun altool --upload-app --type ios -f build/ios/ipa/*.ipa --apiKey Q6WPLKL8NJ --apiIssuer 7d118c9f-e508-4d2a-8445-f774b6f6c38e