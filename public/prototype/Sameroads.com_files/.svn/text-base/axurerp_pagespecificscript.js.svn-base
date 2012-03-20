
var PageName = 'Sameroads.com';
var PageId = 'p57275c07c9574bb38b003484b6e92d66'
var PageUrl = 'Sameroads.com.html'
document.title = 'Sameroads.com';

if (top.location != self.location)
{
	if (parent.HandleMainFrameChanged) {
		parent.HandleMainFrameChanged();
	}
}

var $OnLoadVariable = '';

var $CSUM;

var hasQuery = false;
var query = window.location.hash.substring(1);
if (query.length > 0) hasQuery = true;
var vars = query.split("&");
for (var i = 0; i < vars.length; i++) {
    var pair = vars[i].split("=");
    if (pair[0].length > 0) eval("$" + pair[0] + " = decodeURIComponent(pair[1]);");
} 

if (hasQuery && $CSUM != 1) {
alert('Prototype Warning: Variable values were truncated.');
}

function GetQuerystring() {
    return '#OnLoadVariable=' + encodeURIComponent($OnLoadVariable) + '&CSUM=1';
}

function PopulateVariables(value) {
  value = value.replace(/\[\[OnLoadVariable\]\]/g, $OnLoadVariable);
  value = value.replace(/\[\[PageName\]\]/g, PageName);
  return value;
}

function OnLoad() {

}

var u5 = document.getElementById('u5');
gv_vAlignTable['u5'] = 'center';
var u0 = document.getElementById('u0');

var u3 = document.getElementById('u3');
gv_vAlignTable['u3'] = 'center';
var u6 = document.getElementById('u6');

u6.style.cursor = 'pointer';
if (bIE) u6.attachEvent("onclick", ClickLinkToReferencePageu6);
else u6.addEventListener("click", ClickLinkToReferencePageu6, true);
function ClickLinkToReferencePageu6(e)
{
    self.location.href="index_1.html" + GetQuerystring();
}

x = 0;
y = (u6.offsetHeight) - 4;
InsertAfterBegin(u6ann, "<img src='Resources/newwindow.gif' id='u6PagePopup' style='cursor:pointer;position:absolute;z-index:500;left:" + x + ";top:" + y + "'>");

var u6PagePopup = document.getElementById('u6PagePopup');
if (bIE) u6PagePopup.attachEvent("onclick", u6PagePopupHandler);
else u6PagePopup.addEventListener("click", u6PagePopupHandler, true);

function u6PagePopupHandler(event)
{
    window.open("index_1.html" + GetQuerystring());
}

var u1 = document.getElementById('u1');
gv_vAlignTable['u1'] = 'center';
var u4 = document.getElementById('u4');

var u7 = document.getElementById('u7');
gv_vAlignTable['u7'] = 'center';
var u2 = document.getElementById('u2');

if (window.OnLoad) OnLoad();
