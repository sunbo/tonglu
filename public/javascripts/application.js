// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function showhidediv(divname)
{
    var obj = document.getElementById(divname)
    if (obj.style.display=='none')
    obj.style.display='block';
    else
    obj.style.display='none';
}

function showhidespan(spanname)
{
    var obj = document.getElementById(spanname)
    if (obj.style.display=='none')
    obj.style.display='inline-block';
    else
    obj.style.display='none';
}