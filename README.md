# 💦 Spat

Tool for testing CLI tools and their outputs.

## Usage

```bash
spat spat.t

echo -e '\n# Or make test.sh executable and add the spat shebang.\n'

./spat.t
```
```
spat: sh spat.t > spat.t.new 2>&1
spat: All tests passed.

# Or make test.sh executable and add the spat shebang.

spat: sh ./spat.t > ./spat.t.new 2>&1
spat: All tests passed.
```

> You can change the shell with the `SPAT_SHELL` environment variable. If none is
> defined it will use `sh`.

## Snapshot

The snapshot file (`<script>.out`) is created by running the spat command while the output file
is not yet defined. You can re-create the snapshot file by removing the
snapshot and running the spat test again. You can also manually edit the
snapshot file while keeping your regular expressions.

The snapshot is a file that can be edited to account for
variable output. An example would be the current date.

```bash
head -n 7 spat.t
```
```
#!/usr/bin/env spat

set -x

# A variable line where we use a regex.
date -I

```

On every run the date can vary and the test can therefore fail for
the wrong reasons. This can be solved by replacing the line with a regex.

```bash
head -n 3 spat.t.out
```
```
  + date -I
\d{4}-[\d{2}]{2}
  + tmp=/tmp/spat.test.sh
```

Notice that we removed the 2 spaces and placed a regex accounts for the
variation while still checking if the output looks date like.

## Tips & Tricks

- Turn on `set -x` when writing your commands in a `sh` or `bash` script. This
  prints the command before it starts running it. This helps with debugging and
  writting more expressive pattern files.
