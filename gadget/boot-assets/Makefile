all: boot.scr ../uboot.conf
boot.scr: boot.scr.in
	mkimage -T script -C none -n 'Ubuntu Core' -d boot.scr.in boot.scr

../uboot.conf: uboot.conf.in
	mkenvimage -r -s 131072  -o ../uboot.conf uboot.conf.in
