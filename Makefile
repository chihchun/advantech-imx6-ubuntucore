all: out out/kernel.snap

out/kernel.snap: out
	cd kernel && \
	snapcraft --target-arch armhf -d snap --output ../out/kernel.snap

out: 
	-mkdir out

clean:
	cd kernel && snapcraft clean
	cd gadget && snapcraft clean
