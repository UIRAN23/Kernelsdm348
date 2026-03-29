# kernel-olive-builder

GitHub Actions workflow для сборки ядра **Redmi 8 (olive / mi439)** с:
- ✅ **KernelSU Next** (последняя ветка `next`)
- ✅ **SUSFS** (скрытие root от приложений)
- ✅ Исходники от **Mi-Thorium** (`kernel_msm-4.19`, ветка `mithorium/a13/master`)
- ✅ Совместимость с **EvolutionX 16.0 (Android 16)** и другими 4.19-прошивками

---

## Как использовать

### 1. Создай репозиторий на GitHub
- Нажми **"New repository"** → назови `kernel-olive-builder`
- Загрузи все файлы из этого архива

### 2. Запусти сборку
- Зайди в **Actions** → **"Build Kernel — Mi439/Olive (KSU Next + SUSFS)"**
- Нажми **"Run workflow"**
- Дождись завершения (~30–60 минут)

### 3. Скачай результат
- В **Releases** появится ZIP файл вида `Kernel-Mi439-Olive-KSU_Next_XXXXX-SUSFS-YYYYMMDD.zip`
- ИЛИ в **Artifacts** вкладки Actions

### 4. Прошей
```
TWRP → Install → выбери ZIP → Swipe to Flash
```
или через ADB:
```bash
adb sideload Kernel-Mi439-Olive-KSU_Next_*.zip
```

---

## Почему оригинальный kernel zip не стартует

Проблема: в прошивке `tavukkdoner` KSU Next встроен **без SUSFS**, и версия ядра подписана под конкретную прошивку. При попытке вспышить другой готовый kernel zip — несовпадение DTB или версии KSU вызывает boot loop.

**Решение**: собрать своё ядро с нуля на том же исходнике (Mi-Thorium 4.19), добавив SUSFS патчи.

---

## Структура репозитория

```
.github/
  workflows/
    build-kernel.yml   ← главный workflow
anykernel3/
  anykernel.sh         ← конфиг для прошивки (olive/olivelite/olivewood)
README.md
```

---

## Поддерживаемые устройства

| Устройство      | Codename    |
|----------------|-------------|
| Redmi 8        | olive       |
| Redmi 8A       | olivelite   |
| Redmi 8A Dual  | olivewood   |

---

## Примечания

- KSU Next APK: https://github.com/KernelSU-Next/KernelSU-Next/releases
- Если сборка падает на SUSFS патче — скорее всего патч для 4.19 лежит по другому пути в `ksu_patches`. Посмотри в логах `find` что найдено, и открой issue или поправь путь в `build-kernel.yml` строке с `PATCH_419`.
- ROM source: https://github.com/tavukkdoner/rom
