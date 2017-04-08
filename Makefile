all: out out/kernel.snap

out/kernel.snap: out
	cd kernel && \
	snapcraft --target-arch armhf -d snap --output ../out/kernel.snap

out/gadget.snap: out
	cd gadget && \
	snapcraft --target-arch armhf -d snap . --output ../out/gadget.snap

image:
	sudo ubuntu-image \
	    --channel stable \
	    --image-size 8G \
	    --extra-snaps snapweb \
	    --extra-snaps bluez \
	    --extra-snaps modem-manager \
	    --extra-snaps network-manager \
	    --extra-snaps out/kernel.snap \
	    --extra-snaps out/gadget.snap \
	    -o uc16.img \
	    model


out: 
	-mkdir out

clean:
	cd kernel && snapcraft clean
	cd gadget && snapcraft clean
