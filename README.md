# ZX0 Decompression for Pico-8

## Decompress

Include `zx0.inc.p8` into your program.

Call `zx0_decompress(get_input_byte, get_output_byte, set_output_byte)` to decompress data. The function takes three parameters that are functions to read compressed data and generate uncompressed data that your program can use. ZX0-Pico-8 defines functions to read/write from memory, strings, and tables. You can #include only the functions you need, to save tokens.

For example, the following call uncompresses data from string _s_ into memory at address 0x8000:

```lua
#include zx0.inc.p8
#include zx0-str-get.inc.p8
#include zx0-mem-get.inc.p8
#include zx0-mem-set.inc.p8

zx0_decompress(str_get(s), mem_get(0x8000), mem_set(0x8000))
```

## Input and Output Adapters

### Memory

`#include zx0-mem-get.inc.p8`

`mem_get(a)` returns a function that gets bytes from memory from base address _a_. It can be used for both input and output. For example, a cart can store compressed data in the map area of the ROM and copies it to the high memory address 0x8000 on start-up. You can then decompress the data by passing `mem_get(0x8000)` as the _get_input_byte_ parameter.

`#include zx0-mem-set.inc.p8`

`mem_set(a)` returns a function that sets bytes into memory from base address _a_.


### Strings

`#include zx0-str-get.inc.p8`

`str_get(s)` returns a function that gets byte from string `s`. This form can only be used for the _get_input_byte_ parameter, because strings are immutable.  To use a string for output, use the `strvar` variants.


### String variables

`#include zx0-strvar-io.inc.p8`

`strvar_get(table, name)` returns a function that reads bytes from a string stored as property _name_ in table _table_.
`strvar_set(table, name)` returns a function that writes bytes into a string stored as property _name_ in table _table_.

This pair of functions can be used to uncompress data into a string stored in a table:

```
compressed_data = "..." -- compressed data here
t = {s=""}
zx0_decompress(str_get(compressed_data), strvar_get(t,s), strvar_set(t,s))
```

### Tables

`#include zx0-table-get.inc.p8`

`table_get(t)` returns a function that gets bytes from list table _t_. 

`table_set(t)` returns a function that sets bytes into list table _t_.

Both functions translate zero-based byte offsets to 1-based table indices.  E.g. the first byte is at index 1, not at index 0.
