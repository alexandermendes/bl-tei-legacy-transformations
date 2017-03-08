# Persian transformations

The following changes are made by [persian.xsl](../persian.xsl):

1. Update `<repository>` to *Oriental Manuscripts*.
2. Update `<collection>` to *Persian Manuscripts*.
3. Update *Hijri-qamari* to *Hijri qamari* to comply with how it's recorded in IAMS.
4. Update `@mainLang` language code from *per* to *fa*.


## Outstanding issues

The following issues need to be addressed before importing into IAMS:

1. *Persian Manuscripts* is an unknown ProjectCollection term.
2. `<msContents>` should have a `<textLang>` child element (could add a generic one but it won't match those 
    in `<msItem>`).
3. Required `@rend` elements missing, this should be fixed by the new schema.