
<!-- README.md is generated from README.Rmd. Please edit that file -->
hw07-lsloboda
=============

Overview
--------

**This repo contains the files relevant to STAT 545 Homework 07.** The homework file is located [here](https://github.com/STAT545-UBC-students/hw07-lsloboda/blob/master/hw07-lsloboda.md).

Purpose
-------

<table style="width:88%;">
<colgroup>
<col width="69%" />
<col width="18%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Item</strong></th>
<th><strong>Status</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><em>Add a function to the R powers package:</em></td>
<td></td>
</tr>
<tr class="even">
<td><em>Define &amp; export min. 1 new function</em></td>
<td>:thumbsup:</td>
</tr>
<tr class="odd">
<td><em>Give arguments sensible defaults</em></td>
<td>:thumbsup:</td>
</tr>
<tr class="even">
<td><em>Update the documentation</em></td>
<td>:thumbsup:</td>
</tr>
<tr class="odd">
<td><em>Perform min. 3 unit tests for common cases</em></td>
<td>:thumbsup:</td>
</tr>
<tr class="even">
<td><em>Pass 'check' without errors</em></td>
<td>:thumbsup:</td>
</tr>
<tr class="odd">
<td><em>Update the README and vignette</em></td>
<td>:thumbsup:</td>
</tr>
<tr class="even">
<td><em>Modify the instructions to tell someone how to install the package</em></td>
<td>:thumbsup:</td>
</tr>
</tbody>
</table>

[![Build Status](https://travis-ci.org/vincenzocoia/powers.svg?branch=master)](https://travis-ci.org/vincenzocoia/powers)

**Note**: This R package is not mean to be "serious". It's just for teaching purposes.

powers
======

This is an R package that gives `sqrt()` friends by providing other power functions.

Installation
------------

You can install powers from github with:

``` r
# install.packages("devtools")
#devtools::install_github("lsloboda/powers")
```

Example
-------

See the vignette for more extensive use, but here's an example of the boxcox function:

``` r
#powers::boxcox(1:10, 2)
```

For Developers
--------------

(Again, I don't actually intend for anyone to develop this silly package, but if I did, here's what I'd write.)

Use the internal `pow` function as the machinery for the front-end functions such as `square`, `cube`, `reciprocal`, and `boxcox`.
