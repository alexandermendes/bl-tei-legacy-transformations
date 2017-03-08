# Global transformations

The following transformations are made by [global.xsl](../global.xsl):

1. Update processing instructions for Oxygen and Altova Authentic.
2. Remove all empty attributes.
3. Update `<country>` to *UK*.
4. Update `<institution>` to *British Library*.
5. Add `<availability @status=“free”>` if no `<availability>` exists.
6. Remove *Anonymous* `<persName>` elements from `<msItem>`.
7. Remove empty `<persName>` elements from `<msItem>`.
8. Remove empty `<title>` elements from `<msItem>`.
9. Remove empty `<altIdentifier>` elements.
10. Remove `@rend` attributes.
11. Remove empty `<recordHist>`.
12. Remove empty `<listBibl>` elements.
13. Remove all empty attributes.
14. Remove empty `<decoDesc>` elements.
15. Remove empty `<sealDesc>` elements.