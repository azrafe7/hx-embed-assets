hx-embed-assets
===============

Embedding assets in Haxe 3 + OpenFL 1.1.1 via metatags.

This little example shows how to embed and use assets via metadata tags 
(see [http://haxe.org/manual/tips_and_tricks#flash-specific-metadata](http://haxe.org/manual/tips_and_tricks#flash-specific-metadata)).

Showcases:

 - Font embedding (**@:font**)
 - BitmapData embedding (**@:bitmap**)
 - Sound embedding (**@:sound**)
 - File embedding (**@:file**)
 - XML embedding (**@:file** and **Xml** manipulation)

The great news is that now those metatags seem to be supported on _almost_ all platforms... 
and that the resources will actually be included in the executable, just like flash does 
(**they won't be copied over to the output folder!**).

Tested and working on windows targeting `flash`, `neko`, `cpp` and `android` (no luck with `html` for now).
