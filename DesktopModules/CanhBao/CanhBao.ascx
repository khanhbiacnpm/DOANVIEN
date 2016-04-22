<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CanhBao.ascx.cs" Inherits="VNPT.Modules.CanhBao.CanhBao" %>

<script src="http://github.com/tbranyen/FixedIE/raw/master/jquery.fixedie.js" type="text/javascript" charset="utf-8"></script>

<style type="text/css">   
    .canhbao 
    {
        bottom: 0px;
        direction: ltr;
        position:fixed ;        
        left: 0px;
        z-index: 3000;       
    }
</style>
<script type="text/javascript">
    function an_canhbao() {
        $('#canhbao').fadeOut(500);
    }

    function thunho_canhbao() {
        $('#canhbao').fadeOut(100);
    }

    function phongto_canhbao() {
        $('#canhbao').fadeIn(500);
    }

    $(function() {
        var htmlIS = $('#<%= noidungCanhbaco.ClientID %>').html();
        if (htmlIS.length > 0) {
            $('#canhbao').show();
        }
    });     
</script>


<div id="fixeddiv" style="position:absolute;width:200px;height:50px;right:10px;top:10px; padding-bottom:10px;_padding-bottom:0px;">
    <div id="canhbao" style="width: 300px; border: solid 1px #8fc2e4; text-align: left; display: none;">
    <div style="height: 20px;text-align:right; background-color:#bf3030; padding: 0px 2px 0px 10px;">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td style="width:20px;">
                    <img style="width:16px; height:16px;" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/alert.gif" alt=""/>
                </td>
                <td style="color: White;">
                    Cảnh báo
                </td>
                <td align="right" style="width:18px;">
                    <img src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/minimize.gif" alt="" onclick="thunho_canhbao()"/>
                </td>
                <td align="right" style="width:18px;">
                    <img src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/maximise.gif" alt="" onclick="phongto_canhbao()"/>
                </td>
                <td align="right" style="width:18px;">
                    <img src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/imgadmin/close.gif" alt="" onclick="an_canhbao()"/>
                </td>
            </tr>
        </table>
       
    </div>
    <div id="content" style="background-color: #fff; padding-left: 10px; font-size: 14px;">
        <div id="noidungCanhbaco" runat="server"></div>
    </div>    
</div>
</div>
<script type="text/javascript">

    fixedMenuId = 'fixeddiv';

    var fixedMenu =
{
    hasInner: typeof (window.innerWidth) == 'number',
    hasElement: document.documentElement != null
       && document.documentElement.clientWidth,

    menu: document.getElementById
        ? document.getElementById(fixedMenuId)
        : document.all
          ? document.all[fixedMenuId]
          : document.layers[fixedMenuId]
};

    fixedMenu.computeShifts = function() {
        fixedMenu.shiftX = fixedMenu.hasInner
        ? pageXOffset
        : fixedMenu.hasElement
          ? document.documentElement.scrollLeft
          : document.body.scrollLeft;
        if (fixedMenu.targetLeft > 0)
            fixedMenu.shiftX += fixedMenu.targetLeft;
        else {
            fixedMenu.shiftX +=
            (fixedMenu.hasElement
              ? document.documentElement.clientWidth
              : fixedMenu.hasInner
                ? window.innerWidth - 20
                : document.body.clientWidth)
            - fixedMenu.targetRight
            - fixedMenu.menu.offsetWidth;
        }

        fixedMenu.shiftY = fixedMenu.hasInner
        ? pageYOffset
        : fixedMenu.hasElement
          ? document.documentElement.scrollTop
          : document.body.scrollTop;
        if (fixedMenu.targetTop > 0)
            fixedMenu.shiftY += fixedMenu.targetTop;
        else {
            fixedMenu.shiftY +=
            (fixedMenu.hasElement
            ? document.documentElement.clientHeight
            : fixedMenu.hasInner
              ? window.innerHeight - 20
              : document.body.clientHeight)
            - fixedMenu.targetBottom
            - fixedMenu.menu.offsetHeight;
        }
    };

    fixedMenu.moveMenu = function() {
        fixedMenu.computeShifts();

        if (fixedMenu.currentX != fixedMenu.shiftX
        || fixedMenu.currentY != fixedMenu.shiftY) {
            fixedMenu.currentX = fixedMenu.shiftX;
            fixedMenu.currentY = fixedMenu.shiftY;

            if (document.layers) {
                fixedMenu.menu.left = fixedMenu.currentX;
                fixedMenu.menu.top = fixedMenu.currentY;
            }
            else {
                fixedMenu.menu.style.left = fixedMenu.currentX + 'px';
                fixedMenu.menu.style.top = fixedMenu.currentY + 'px';
            }
        }

        fixedMenu.menu.style.right = '';
        fixedMenu.menu.style.bottom = '';
    };

    fixedMenu.floatMenu = function() {
        fixedMenu.moveMenu();
        setTimeout('fixedMenu.floatMenu()', 20);
    };
    fixedMenu.addEvent = function(element, listener, handler) {
        if (typeof element[listener] != 'function' ||
       typeof element[listener + '_num'] == 'undefined') {
            element[listener + '_num'] = 0;
            if (typeof element[listener] == 'function') {
                element[listener + 0] = element[listener];
                element[listener + '_num']++;
            }
            element[listener] = function(e) {
                var r = true;
                e = (e) ? e : window.event;
                for (var i = 0; i < element[listener + '_num']; i++)
                    if (element[listener + i](e) === false)
                    r = false;
                return r;
            }
        }
        for (var i = 0; i < element[listener + '_num']; i++)
            if (element[listener + i] == handler)
            return;
        element[listener + element[listener + '_num']] = handler;
        element[listener + '_num']++;
    };

    fixedMenu.supportsFixed = function() {
        var testDiv = document.createElement("div");
        testDiv.id = "testingPositionFixed";
        testDiv.style.position = "fixed";
        testDiv.style.top = "0px";
        testDiv.style.right = "0px";
        document.body.appendChild(testDiv);
        var offset = 1;
        if (typeof testDiv.offsetTop == "number"
        && testDiv.offsetTop != null
        && testDiv.offsetTop != "undefined") {
            offset = parseInt(testDiv.offsetTop);
        }
        if (offset == 0) {
            return true;
        }

        return false;
    };
    function move_lower_left() {
        if (fixedMenu.menu.style.position == 'fixed') {
            fixedMenu.menu.style.left = '0px';
            fixedMenu.menu.style.top = '';
            fixedMenu.menu.style.right = '';
            fixedMenu.menu.style.bottom = '0px';
        }
        else {
            fixedMenu.targetLeft = 1;
            fixedMenu.targetTop = '';
            fixedMenu.targetRight = '';
            fixedMenu.targetBottom = 0;
        }
    }
    fixedMenu.init = function() {
        if (fixedMenu.supportsFixed())
            fixedMenu.menu.style.position = "fixed";
        else {
            var ob =
            document.layers
            ? fixedMenu.menu
            : fixedMenu.menu.style;

            fixedMenu.targetLeft = parseInt(ob.left);
            fixedMenu.targetTop = parseInt(ob.top);
            fixedMenu.targetRight = parseInt(ob.right);
            fixedMenu.targetBottom = parseInt(ob.bottom);

            if (document.layers) {
                menu.left = 0;
                menu.top = 0;
            }
            fixedMenu.addEvent(window, 'onscroll', fixedMenu.moveMenu);
            fixedMenu.floatMenu();
        }
        move_lower_left();
    };

    fixedMenu.addEvent(window, 'onload', fixedMenu.init);    
//--></script>


