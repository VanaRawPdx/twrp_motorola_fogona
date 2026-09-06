# OrangeFox device-tree skeleton for Motorola fogona

This directory is intended to be checked out as:

`device/motorola/fogona`

It is an evidence-based **phase-1 skeleton**, not a declared bootable release. Read the repository-level `FOGONA_STOCK_ANALYSIS.md` before using it.

## Deliberate design choices

- Dedicated A/B `recovery` output, not vendor-boot-as-recovery.
- Header v4, LZ4 recovery ramdisk, and zero embedded kernel.
- Exact stock physical and dynamic partition sizes.
- EROFS logical partitions; F2FS metadata and userdata.
- Stock recovery USB setup and early charger-module actions.
- Stock `vendor_boot` and `dtbo` remain external and untouched.
- Data decryption and the OrangeFox self-flashing ZIP are disabled for initial bring-up.

The zero-byte `prebuilt/kernel` file is intentional. It exists only to satisfy build-system prebuilt-kernel checks; `BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE` must keep the built recovery's kernel size at zero.

## Initial build

Use an OrangeFox `fox_12.1` source tree:

```sh
source build/envsetup.sh
lunch twrp_fogona-eng
mka recoveryimage
```

Do not publish or test the image until it passes every offline condition in `FOGONA_STOCK_ANALYSIS.md`.

## Known bring-up gates

1. Confirm the source tree actually provides every package in `device.mk`; trim only packages that the build proves unavailable.
2. Confirm the recovery output is 104,857,600-byte header-v4 with `kernel_size=0` and an AVB hash footer for `recovery`.
3. Confirm the runtime backlight node; the DTBO covers panel variants with different brightness ceilings.
4. Confirm boot/display/touch/ADB/storage before enabling decryption.
5. Replace the stock-recovery-derived `/data` crypto flag only with evidence from the currently installed ROM.

