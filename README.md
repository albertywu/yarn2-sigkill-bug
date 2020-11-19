### yarn2-termination-bug
repro of yarn2 termination issue

### Summary

When running `yarn <cmd>` where `cmd` is defined in `package.json` scripts, processes spawned in `scripts` are not terminated when the parent yarn process id is terminated using SIGTERM kill signal. This is different from yarn v1 behavior, where a SIGTERM kill signal on the parent yarn process id would terminate processes spawned in scripts.

### Repro

Failing case:
```
(
  cd yarn2-bug
  ./repro.sh
)
```

Passing case:
```
(
  cd yarn1-working
  ./repro.sh
)
```
