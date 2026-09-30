#!/usr/bin/env bash
set -euo pipefail
KDIR="$HOME/palmarch-kernel"
STAMP="$(date +%Y%m%d-%H%M%S)"
SRC="$KDIR/src/linux-7.2.7"

echo "==> Бэкап конфига"
cp "$SRC/.config" "$KDIR/config/config-7.2.7-palmarch"
cp "$SRC/.config" "$KDIR/backup/configs/config-7.2.7-palmarch.$STAMP"

echo "==> Бэкап vmlinux + System.map (если есть)"
[ -f "$SRC/vmlinux" ]    && cp "$SRC/vmlinux"    "$KDIR/backup/vmlinux/vmlinux-$STAMP"
[ -f "$SRC/System.map" ] && cp "$SRC/System.map" "$KDIR/backup/vmlinux/System.map-$STAMP"

echo "==> Бэкап пакетов из pacman-кэша"
cp -v /var/cache/pacman/pkg/linux-palmarch-*.pkg.tar.zst "$KDIR/backup/packages/" 2>/dev/null || true

echo "==> Готово. Что в backup:"
find "$KDIR/backup" -type f -printf '%s\t%p\n' | sort -k2
