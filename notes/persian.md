# Persian transformations

The following changes are made by [persian.xsl](../persian.xsl):

1. Update `<repository>` to *Oriental Manuscripts*.
2. Update `<collection>` to *Persian Manuscripts*.
3. Update `@calendar="Hijri-qamari"` to `@calendar="Hijri qamari"` to comply with how it's recorded in IAMS.
4. Update `@mainLang="per"` to `@mainLang="fa"`.


## Outstanding issues

The following issues need to be addressed before importing into IAMS:

1. *Persian Manuscripts* is an unknown ProjectCollection term.
2. `<msContents>` should have a `<textLang>` child element (could add a generic one but it won't match those 
    in `<msItem>`).
3. Required `@rend` elements missing, this should be fixed by the new schema.
4. The content model for element `<msItem>` does not allow character content (e.g. Uk_IO_Islamic_3968.xml)
5. Bengali-Fasli is an unknown CreationDateCalendar term (e.g. Uk_IO_Islamic_4455.xml)
6. The `@notAfter` attribute of the origin element (in history) must have a value that is either greater than or equal to `@notBefore` (e.g Uk_IO_Islamic_4454.xml).
7. The origin element must have either `@when` or `@to`/`@from` or `@notAfter`/`@notBefore` or an `<origDate>` child element (e.g. Uk_IO_Islamic_4455.xml).
