
function _showElement(id)
{
	var element = document.getElementById(id);
	if(!element) return;
	var style = element.style;
	if(!style) return;
	style.display = "";
}

function _hideElement(id)
{
	var element = document.getElementById(id);
	if(!element) return;
	var style = element.style;
	if(!style) return;
	style.display = "none";
}

