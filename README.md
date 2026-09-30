# linux-palmarch 7.2.7-arch1-1

**Stock is a starting point, not a destination.**

This is a custom Arch Linux kernel built for people who refuse to settle for "good enough." Based on 7.2.7-arch1, tuned for responsiveness, hardened where it matters, and armed with sched_ext — the future of CPU scheduling, running live in BPF.

## What makes it different
- **sched_ext** (`CONFIG_SCHED_CLASS_EXT=y`) — swap schedulers at runtime. No rebuilds. No reboots. Just load `scx_lavd`, `scx_bpfland`, or write your own.
- **BTF** (`CONFIG_DEBUG_INFO_BTF=y`) — full BPF introspection, ready for modern tooling.
- **BPF JIT** (`CONFIG_BPF_JIT=y`, `CONFIG_BPF_JIT_ALWAYS_ON=y`) — native-speed BPF, always on.
- A config built around low latency and real-world responsiveness.

## Performance
- Tuned for low latency and snappy desktop response — not just benchmark numbers.
- sched_ext lets you pick the right scheduler for the job: gaming, desktop, throughput, or power saving.
- BPF JIT is always on, so tracing and scheduling overhead stays out of your way.
- Minimal dead weight: a focused config means less bloat, faster builds, and fewer moving parts at runtime.

## Security
- Hardened build with modern mitigations enabled by default.
- BPF runtime protections kept on — sched_ext is powerful, and we treat it that way.
- No unnecessary attack surface: disabled debug interfaces and legacy subsystems that serve no purpose on a modern desktop.
- Signed and reproducible package build via `makepkg`.

## Packages
- `linux-palmarch` — the kernel and its modules
- `linux-palmarch-headers` — headers for DKMS and external modules
- `linux-palmarch-docs` — documentation

## Install
```bash
sudo pacman -U linux-palmarch-headers-*.pkg.tar.zst linux-palmarch-*.pkg.tar.zst
sudo mkinitcpio -P
# update your bootloader
sudo reboot
