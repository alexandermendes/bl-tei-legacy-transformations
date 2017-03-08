# Persian transformations

In addition to the changes listed in [global.md](global.md) the following changes are made by 
[persian.xsl](../persian.xsl):

1. Update processing instructions for Oxygen and Altova Authentic.
2. Update the following elements in `<msIdentifier>`:

```
<country>UK</country>
<settlement>London</settlement>
<institution>British Library</institution>
<repository>Oriental Manuscripts</repository>
<collection>Persian Manuscripts</collection>
```

3. Add `<availability @status=“free”>` (if no `<availability>` tag exists).
4. Remove *Anonymous* `<persName>` elements from `<msItem>`.
5. Remove empty `<persName>` elements from `<msItem>`.
6. Remove empty `<title>` elements from `<msItem>`.
7. Remove empty `<altIdentifier>` elements.
8. Update *Hijri-qamari* to *Hijri qamari* to comply with how it's recorded in IAMS.
9. Update `@mainLang` language code from *per* to *fa*.
10. Add `<textLang mainLang="fa">Persian</textLang>` to `<msContents>` (if it doesn't exist).
11. Remove `@rend` attributes.
12. Remove empty `<recordHist>`.