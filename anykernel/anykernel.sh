# AnyKernel3 конфиг для Xiaomi Redmi 8 (olive)
# Также подходит для Redmi 8A (olivelite) и Redmi 8A Dual (olivewood)
# ─────────────────────────────────────────────────────────────────
# AnyKernel properties
properties() { '
kernel.string=Mi-Thorium KSU Next + SUSFS — Mi439/Olive by kernel-olive-builder
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=olive
device.name2=olivelite
device.name3=olivewood
device.name4=Mi439
device.name5=
supported.versions=
'; }

# ─────────────────────────────────────────────────────────────────
# AnyKernel methods (не трогать)
. tools/ak3-core.sh;

# ─────────────────────────────────────────────────────────────────
# Скрипт прошивки
dump_boot;

write_boot;

