
pico8=/Applications/PICO-8.app/Contents/MacOS/pico8
gimp=/Applications/GIMP-2.10.app/Contents/MacOS/gimp --no-interface

released=zx0-demo zx0-tests
outdir=out/pico8
VERSION?=dev$(shell date +%Y-%m-%dt%H:%M)

all: $(released:%=$(outdir)/%.p8.png)

$(outdir)/%.p8.png: %.p8
	@mkdir -p $(dir $@)
	$(pico8) -export "-f $(outdir)/$*.p8.png" $<

clean:
	rm -rf $(outdir)/

.PRECIOUS: $(outdir)/%.p8.png $(outdir)/%-orig.p8.png
.PRECIOUS: $(outdir)/%_html/index.html
.PRECIOUS: build/docs/%.png
