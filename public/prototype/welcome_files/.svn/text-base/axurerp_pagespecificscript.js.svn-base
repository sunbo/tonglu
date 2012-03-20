
var PageName = 'welcome';
var PageId = 'pd8ecf91c114c414280ec6a4d7eb71420'
var PageUrl = 'welcome.html'
document.title = 'welcome';

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

var u1 = document.getElementById('u1');
gv_vAlignTable['u1'] = 'center';
var u0 = document.getElementById('u0');

u0.style.cursor = 'pointer';
if (bIE) u0.attachEvent("onclick", ClickLinkToReferencePageu0);
else u0.addEventListener("click", ClickLinkToReferencePageu0, true);
function ClickLinkToReferencePageu0(e)
{
    self.location.href="index_1.html" + GetQuerystring();
}

x = 0;
y = (u0.offsetHeight) - 4;
InsertAfterBegin(u0ann, "<img src='Resources/newwindow.gif' id='u0PagePopup' style='cursor:pointer;position:absolute;z-index:500;left:" + x + ";top:" + y + "'>");

var u0PagePopup = document.getElementById('u0PagePopup');
if (bIE) u0PagePopup.attachEvent("onclick", u0PagePopupHandler);
else u0PagePopup.addEventListener("click", u0PagePopupHandler, true);

function u0PagePopupHandler(event)
{
    window.open("index_1.html" + GetQuerystring());
}

if (window.OnLoad) OnLoad();
