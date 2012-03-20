/*----------------------------------------------------------------------------
 * jQuery Clipboard Copy
 * ---------------------------------------------------------------------------
 * Version: 1.2.0
 * jQuery:  1.2.x compatible
 * Keyword: copy,clipboard,copy all,jquery copy, jquery selector copy
 *
 * Author:  Stephen Blum
 *
 * Files:   jquery.copy.js          ## Source
 *          jquery.copy.examples.js ## Example Usage
 *          jquery.copy.min.js      ## Minified JS
 *          jquery.copy.swf         ## Flash SWF
 *          jsminify.pl             ## Perl JS Minifier
 *          jquery-1.2.5.min.js     ## Standard jQuery Library
 *
 * Summary: Cross-browser text copy plugin usable in the jQuery dot notation
 *          fashion $("#elmID").copy(). This plugin will copy all text inside
 *          the matching jQuery selector. There exists another implementation
 *          of this idea, however it seems a bit complex.  This plugin is
 *          much easier to use and works with jQuery's famous chains and
 *          selectors.
 * 
 * ---------------------------------------------------------------------------
 * USAGE TYPE 1: Basic (Simply copy text inside a div to the Clipboard)
 * ---------------------------------------------------------------------------
 * $("div#my-div-id").copy();
 *
 * ---------------------------------------------------------------------------
 * USAGE TYPE 2: Delimiter (Copy Multiple items with a Delimiter)
 * ---------------------------------------------------------------------------
 * $("input.copy-class").copy('\n');
 *
 * ---------------------------------------------------------------------------
 * USAGE TYPE 3: Utility (Copy JS Variable)
 * ---------------------------------------------------------------------------
 * var my_string = "text";
 * $.copy(my_string);
 *
 * ---------------------------------------------------------------------------
 * EXAMPLE 1: Copy text from a DIV on button click event.
 * ---------------------------------------------------------------------------
 * // Copy all text inside "div#my-div-element-id" div.
 * $("input#my-button-id").bind( 'click', function() {
 *     $("div#my-div-element-id").copy(); 
 * });
 *
 * ---------------------------------------------------------------------------
 * EXAMPLE 2: Copy all INPUT elements inside a form on button click.
 * ---------------------------------------------------------------------------
 * // Copy all textboxes inside "#my-div-form-id".
 * $("input#my-button-id").bind( 'click', function() {
 *     $("form#my-form-id input").copy(); 
 * });
 *----------------------------------------------------------------------------
 */
jQuery.copy = function(data) { return jQuery.fn.copy.call({}, data); };
jQuery.fn.copy = function(delimiter) {
    var me = this,
    flashcopier = (function(fid) {
        return document.getElementById(fid) || (function() {
            var divnode    = document.createElement('div');
                divnode.id = fid;
            document.body.appendChild(divnode);
            return divnode;
        })();
    })('_flash_copier'),
    data = jQuery.map(me, function(bit) {
        return typeof bit === 'object' ? bit.value || bit.innerHTML.replace(/<.+>/g, '') : '';
    }).join( delimiter || '' ).replace(/^\s+|\s+$/g, '') || delimiter,
    divinfo = '<embed src="jquery.copy.swf" FlashVars="clipboard='
            + encodeURIComponent(data)
            + '" width="0" height="0" '
            + 'type="application/x-shockwave-flash"></embed>';
    flashcopier.innerHTML = divinfo;
    return this;
};
