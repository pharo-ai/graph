![Build status](https://github.com/pharo-ai/graph/workflows/CI/badge.svg)
[![Coverage Status](https://coveralls.io/repos/github/pharo-ai/graph/badge.svg?branch=master)](https://coveralls.io/github/pharo-ai/graph?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/pharo-ai/graph/master/LICENSE)

## Description

Graph algorithms for Pharo (Dijkstra, Kruskal, etc)

## How to install it?

To install the **graph** package, go to the Playground (Ctrl+OW) in your [Pharo](https://pharo.org/) image and execute the following Metacello script (select it and press Do-it button or Ctrl+D):

```Smalltalk
Metacello new
  baseline: 'AIGraph';
  repository: 'github://pharo-ai/graph/src';
  load.
```

## How to depend on it?

If you want to add a dependency on **graph** to your project, include the following lines into your baseline method:

```Smalltalk
spec
  baseline: 'AIGraph'
  with: [ spec repository: 'github://pharo-ai/graph/src' ].
```

If you are new to baselines and Metacello, check out the [Baselines](https://github.com/pharo-open-documentation/pharo-wiki/blob/master/General/Baselines.md) tutorial on Pharo Wiki.

## How to use it?

WiP
