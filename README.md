Redundant
===================

Identify images in your asset directory that may no longer be used.

Installation
============

install the gem

    gem install redundant

Usage
=====

run redundant from the root directory of your rails app to see which files may no longer be used.

How it works
============

Redundant works cross referencing the image files (jpg, png, gif &webp) in your assets/images directory and cross referencing the image filenames that appear in files in assets/stylesheets, assets/javascripts, helpers & views.  If it doesn't find a reference it lets you know.

DISCLAIMER
==========

The results provided by redundant are a suggestion, i would advice you check wether you really want to get rid of them.