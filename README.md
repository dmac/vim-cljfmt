# vim-cljfmt

Vim-cljfmt is a vim plugin for [cljfmt](https://github.com/cespare/goclj),
a Clojure formatting tool.

## Install

Install `cljfmt`:

    $ go get github.com/cespare/goclj/cljfmt

Install vim-cljfmt with your method of choice.

## Commands

    :CljFmt

        Run the current buffer through cljfmt.

## Settings

- `g:cljfmt_on_save` controls whether cljfmt automatically calls `:CljFmt` when
  saving a .clj or .cljs buffer. This is set to 1 by default.

