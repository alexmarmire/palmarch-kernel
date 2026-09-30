#!/usr/bin/env bash
set -euo pipefail

KDIR="$HOME/palmarch-kernel"
SRC="$KDIR/src/linux-7.2.7"
CFG="$KDIR/config/config-7.2.7-palmarch"

echo "==> Копирую конфиг в дерево"
cp "$CFG" "$SRC/.config"

cd "$SRC"

echo "==> Применяю нужные опции (можно дополнять)"
./scripts/config --file .config \
  --enable SCHED_CLASS_EXT \
  --enable BPF_SYSCALL \
  --enable BPF_JIT \
  --enable DEBUG_INFO_BTF

echo "==> olddefconfig"
make olddefconfig

echo "==> Сохраняю актуальный конфиг обратно в проект"
cp .config "$CFG"

echo "==> Сборка (nproc=$(nproc))"
make -j"$(nproc)"

echo "==> Готово. vmlinux: $SRC/vmlinux"
