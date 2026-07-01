# ZX0 Decompression for Pico-8

[ZX0](https://github.com/einar-saukas/ZX0) is a data compressor that provides a tradeoff between high compression ratio, and extremely simple fast decompression. It's especially appropriate for low-end platforms, including 8-bit computers like the ZX Spectrum.

This is an implementation of ZX0 decompression for Pico-8.

The decompressor function uses 168 tokens, thanks to some creative token optimisation by @pancelor and @noelle on the Pico-8 Discord. If you also need to optimise the character count, run the code through [Shrinko8](https://github.com/thisismypassport/shrinko8) to replace readable names with single characters, etc.


## Compress

Compress data outside Pico-8 using one of the [ZX0 implementations](https://github.com/einar-saukas/ZX0).

To save space and tokens, the Pico-8 decompressor does not support ZX0's "classic", "prefixed", or "backward" modes.


## Decompress

Include `zx0.inc.p8` into your program.

Call `zx0_decompress(get_input_byte, get_output_byte, set_output_byte)` to decompress data. The function parameters are three "adapter" functions to read compressed data and generate uncompressed data that your program can use.

For example, the following call uncompresses data from string _s_ into memory at address 0x8000:

```lua
#include zx0.inc.p8
#include zx0-str-get.inc.p8
#include zx0-mem-get.inc.p8
#include zx0-mem-set.inc.p8

zx0_decompress(str_get(s), mem_get(0x8000), mem_set(0x8000))
```

The expected behaviours of the adapter functions are:

```
get_input_byte: (offset) -> byte
```

Return the next byte of compressed data.  The offset from the start of the stream is passed as a parameter, which can be used to simplify the implementation when the compressed data is being fetched from indexable storage, such as memory or a string.

```
get_output_byte: (offset) -> byte
```

Return a byte of uncompressed data that was stored previously during decompression.  The offset of the byte from the start of the output data is passed as a parameter and must be used to calculate the real index of the byte in the output data.

```
set_output_byte: (offset, byte) -> nil
```

Append a byte to the uncompressed output. The offset from the start of the output data is passed as a parameter, which can be used to simplify the implementation when the uncompressed data is being written to indexable storage, such as memory.

The offset parameters are zero-based.  E.g. the first byte has offset 0, the second byte has offset 1, and so on. 


## Predefined Input and Output Adapters

ZX0-Pico-8 defines adapter functions that read/write from memory, strings, and tables. You can #include only the functions you need to save tokens.

### Memory

`#include zx0-mem-get.inc.p8`

`mem_get(a)` returns a function that gets bytes from memory, at an offset from base address _a_. It can be used for both input and output.

`#include zx0-mem-set.inc.p8`

`mem_set(a)` returns a function that sets bytes into memory, at an offset from base address _a_.


### Strings

`#include zx0-str-get.inc.p8`

`str_get(s)` returns a function that gets bytes from string `s`. It can only be used for the _get_input_byte_ parameter, because the string _s_ is immutable.  To decompress into a string, use the `strvar` variants (see below).

The function translates zero-based byte offsets to 1-based character indices. E.g. the byte with offset 0 is at character index 1.


### String variables

`#include zx0-strvar-io.inc.p8`

`strvar_get(table, name)` returns a function that reads bytes from a string stored as property _name_ in table _table_.
`strvar_set(table, name)` returns a function that writes bytes into a string stored as property _name_ in table _table_.

This pair of functions can be used to uncompress data into a string:

```lua
compressed_data = ... -- a string of compressed data
local t = {""} -- declare a table holding an empty string
zx0_decompress(str_get(compressed_data), strvar_get(t,1), strvar_set(t,1))
-- now t[1] contains the uncompressed data 
```

Both functions translate zero-based byte offsets to 1-based character indices. E.g. the byte with offset 0 is at character index 1.

### Tables

`#include zx0-table-get.inc.p8`

`table_get(t)` returns a function that gets bytes from list table _t_. 

`table_set(t)` returns a function that sets bytes into list table _t_.

Both functions translate zero-based byte offsets to 1-based table indices. E.g. the byte with offset 0 is at table index 1.


# Discussion

You can discuss this library in the Pico-8 Discord here: https://discord.com/channels/215267007245975552/1519953142312210553.

Or on the Pico-8 BBS here: https://www.lexaloffle.com/bbs/?tid=157760
