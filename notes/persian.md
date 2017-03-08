# Persian transformations

In addition to the changes listed in [global.md](global.md) the following changes are made by 
[persian.xsl](../persian.xsl):

1. Update `<repository>` to *Oriental Manuscripts*.
2. Update `<collection>` to *Persian Manuscripts*.
3. Update *Hijri-qamari* to *Hijri qamari* to comply with how it's recorded in IAMS.
4. Update `@mainLang` language code from *per* to *fa*.
5. Add `<textLang mainLang="fa">Persian</textLang>` to `<msContents>` (if it doesn't exist).
    

## Outstanding issues

The following issues need to be addressed before importing into IAMS:

1. *Persian Manuscripts* is an unknown ProjectCollection term.