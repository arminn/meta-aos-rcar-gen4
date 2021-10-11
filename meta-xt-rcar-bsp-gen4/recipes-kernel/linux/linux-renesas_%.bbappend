FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

RENESAS_BSP_URL = "git://github.com/renesas-rcar/linux-bsp.git"

BRANCH = "v5.10.41/rcar-5.1.3.rc5"
SRCREV = "${AUTOREV}"
LINUX_VERSION = "5.10.41"

COMPATIBLE_MACHINE .= "|spider"

SRC_URI_append = "\
    ${RENESAS_BSP_URL};nocheckout=1;branch=${BRANCH} \
    file://defconfig \
"

SRC_URI_remove = "\
    file://touch.cfg \
    file://add-intc_ex-for-r8a77961.patch \
    file://cpufreq-boost-for-rcar-5.0.0.rc4.patch \
    file://0001-arm64-dts-r8a77961-Fix-video-codec-relation-node.patch \
    file://0001-scripts-Add-module.lds-to-fix-out-of-tree-modules-bu.patch \
    file://0001-arm64-dts-r8a77995-Add-optee-node.patch \
    https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/r8a779x_usb3_v2.dlmem;md5sum=645db7e9056029efa15f158e51cc8a11 \
    https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/r8a779x_usb3_v3.dlmem;md5sum=687d5d42f38f9850f8d5a6071dca3109 \
    file://disable_fw_loader_user_helper.cfg \
    file://ulcb-ab.dtsi;subdir=git/arch/arm64/boot/dts/renesas \
"

##############################################################################
# Spider
###############################################################################
SRC_URI_append_spider = " \
    file://r8a779f0-spider-domd.dts \
    file://r8a779f0-spider-xen.dts \
    file://rswitch.cfg \
    file://dmatest.cfg \
"

KERNEL_MODULE_PROBECONF_spider += "rswitch"
module_conf_rswitch_spider = "blacklist rswitch"