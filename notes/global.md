# Global transformations

The following transformations will be made by [global.xsl](../global.xsl) (which should be imported by all other 
scripts):

1. Update processing instructions for Oxygen and Altova Authentic.
2. Update `<country>` to *UK*.
3. Update `<institution>` to *British Library*.
    
4. Add `<availability @status=“free”>` if no `<availability>` exists.
5. Remove *Anonymous* `<persName>` elements from `<msItem>`.
6. Remove empty `<persName>` elements from `<msItem>`.
7. Remove empty `<title>` elements from `<msItem>`.
8. Remove empty `<altIdentifier>` elements.
9. Remove `@rend` attributes.
10. Remove empty `<recordHist>`.
11. Remove empty `<listBibl>` elements.