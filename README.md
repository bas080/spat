# 💦 Spat

Tool for testing CLI tools and their outputs.

## Usage

```bash bash
spat test.sh

# or make test.sh executable and add the spat shebang.

./test.sh
```

> You can change the shell with the `SPAT_SHELL` environment variable. If none is
> defined it will use `sh`.

You can update the snapshot with.

`SPAT_SHELL=bash SPAT_UPDATE=1 ./test.sh`

This will write stdout and stderr to `test.sh.out` and test.sh.err`.

> You can also export the `SPAT_SHELL` and `SPAT_UPDATE` as environment
> variables if you don't want to write them everytime you run the spat test.

## Snapshot

The stderr and stdout snapshot are files that can be edited to account for
variable output. An example would be the amount of time the running of a test
took.

Take the following stdout snapshot:

```
  All tests passed.

  23ms elapsed.
```

On every run the elapsed time varies and the test can therefore fail for
the wrong reason. This can be solved by replacing the line with a regex.

```
  All tests passed.

/ms elapsed\./
```

Notice that we removed the 2 spaces and placed a regex that ignores the numbers
that represent the amount of ms.
