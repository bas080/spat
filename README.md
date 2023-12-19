# 💦 Spat

Tool for testing CLI tools and their outputs.

## Usage

```bash bash
spat spat.t

echo -e '\n# Or make test.sh executable and add the spat shebang.\n'

./spat.t
```

> You can change the shell with the `SPAT_SHELL` environment variable. If none is
> defined it will use `sh`.

You can update the snapshot with.

`SPAT_UPDATE=1 ./spat.t`

This will write stdout and stderr to `test.sh.out` and test.sh.err`.

> You can also export the `SPAT_SHELL` as environment
> variables if you don't want to write them everytime you run the spat test.

## Snapshot

The stderr and stdout snapshot are files that can be edited to account for
variable output. An example would be the current date.

Take the following script

```bash head -n 5 spat.t
```

On every run the date can vary and the test can therefore fail for
the wrong reasons. This can be solved by replacing the line with a regex.

```bash head -n 3 spat.t.out
```

Notice that we removed the 2 spaces and placed a regex that ignores the numbers
that represent the amount of ms.

## Tips & Tricks

- Turn on `set -x` when writing your commands in a `sh` or `bash` script. This
  prints the command before it starts running it. This helps with debugging and
  writting more expressive pattern files.
