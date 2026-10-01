# PalmArch Kernel — журнал

## Цель
Сборка кастомного ядра linux-palmarch 7.2.7 для PalmArch (Lenovo Legion).

## Текущее состояние
- Версия ядра: 7.2.7-arch1-1-palmarch
- Конфиг: config/config-7.2.7-palmarch
- Патчи/опции: SCHED_CLASS_EXT, BPF_SYSCALL, BPF_JIT, DEBUG_INFO_BTF
- Дерево исходников: src/linux-7.2.7 (симлинк на /usr/src/linux-palmarch)
- Готовые пакеты: backup/packages/linux-palmarch-*.pkg.tar.zst

## Команды
- Сборка:        pkgbuild/build.sh
- Бэкап:         pkgbuild/backup.sh
- Проверка опций: grep -E 'SCHED_CLASS_EXT|BPF' src/linux-7.2.7/.config

## История
- 2026-09-29 — первая успешная сборка ядра 7.2.7-palmarch (пакеты в /var/cache/pacman/pkg)
- 2026-09-30 — перенос проекта в ~/palmarch-kernel, наведён порядок

## 2026-10-01 — Переход на BORE
- Отключён sched_ext (`CONFIG_SCHED_CLASS_EXT`), включён BORE (`CONFIG_SCHED_BORE=y`)
- Наложен патч `patches/0001-bore.patch` (CachyOS mainline BORE для 7.2)
- `CONFIG_HZ_1000=y`, `CONFIG_MIN_BASE_SLICE_NS=2000000`
- Сборка: `makepkg -s --noextract`
