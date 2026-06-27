
pico8=/Applications/PICO-8.app/Contents/MacOS/pico8

released=zx0-demo zx0-tests
outdir=out/pico8
VERSION?=dev$(shell date +%Y-%m-%dt%H:%M)

incs=$(wildcard *.inc.p8)

all: $(released:%=$(outdir)/%.p8.png)

$(outdir)/%.p8.png: %.p8 $(incs)
	@mkdir -p $(dir $@)
	$(pico8) -export "-f $(outdir)/$*.p8.png" $<

clean:
	rm -rf $(outdir)/

.PRECIOUS: $(outdir)/%.p8.png $(outdir)/%-orig.p8.png
.PRECIOUS: $(outdir)/%_html/index.html
.PRECIOUS: build/docs/%.png
