div#header, header
    {
    border-bottom: 1px solid #aaa;
    margin-bottom: 0.5em;
    }

.title /* Pandoc title header (h1.title) */
    {
    text-align: center;
    }

.author, .date /* Pandoc author(s) and date headers (h2.author and h3.date) */
    {
    text-align: center;
    }

/* Pandoc table of contents DIV when using the --toc option.
   NOTE: this doesn't support Pandoc's --id-prefix option for #TOC and #header. 
   Probably would need to use div[id$='TOC'] and div[id$='header'] as selectors.
*/

div#TOC, nav#TOC
    {
    /* Put border on bottom to separate it from body. */
    border-bottom: 1px solid #aaa;
    margin-bottom: 0.5em;
    }

@media print
    {
    div#TOC, nav#TOC
        {
        /* Don't display TOC in print */
        display: none;
        }
    }

/* ---- Headers and sections ---- */

h1, h2, h3, h4, h5, h6
{
    font-family: "Helvetica Neue", Helvetica, "Liberation Sans", Calibri, Arial, sans-serif; /* Sans-serif headers */

    /* font-family: "Liberation Serif", "Georgia", "Times New Roman", serif; /* Serif headers */

    page-break-after: avoid; /* Firefox, Chrome, and Safari do not support the property value "avoid" */
}

/* Pandoc with --section-divs option */

div div, section section /* Nested sections */
    {
    margin-left: 2em; /* This will increasingly indent nested header sections */
    }

p {}

blockquote
    { 
    font-style: italic;
    }

li /* All list items */
    {
    }

li > p /* Loosely spaced list item */
    {
    margin-top: 1em; /* IE: lack of space above a <li> when the item is inside a <p> */
    }

ul /* Whole unordered list */
    {
    }

ul li /* Unordered list item */
    {
    }

ol /* Whole ordered list */
    {
    }

ol li /* Ordered list item */
    {
    }

hr {}

/* ---- Some span elements --- */

sub /* Subscripts. Pandoc: H~2~O */
    {
    }

sup /* Superscripts. Pandoc: The 2^nd^ try. */
    {
    }
    
em /* Emphasis. Markdown: *emphasis* or _emphasis_ */
    {
    }
    
em > em /* Emphasis within emphasis: *This is all *emphasized* except that* */
    {
    font-style: normal;
    }

strong /* Markdown **strong** or __strong__ */
    {
    }

/* ---- Links (anchors) ---- */

a /* All links */
    {
    /* Keep links clean. On screen, they are colored; in print, they do nothing anyway. */
    text-decoration: none;
    }

@media screen
    {
    a:hover
        {
        /* On hover, we indicate a bit more that it is a link. */
