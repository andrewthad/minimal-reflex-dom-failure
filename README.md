Instructions to reproduce the issue:

- run `stack build`
- open `.stack-work/dist/x86_64-linux/Cabal-2.2.0.1_ghcjs/build/minimal-reflex-dom-failure/minimal-reflex-dom-failure.jsexe/index.html` in google chrome

In the console tab in the developer tools tab, you will see the following error message:

    cyclic evaluation in fixIO

