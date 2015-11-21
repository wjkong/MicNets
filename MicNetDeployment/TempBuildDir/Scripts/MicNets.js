function confirmation() {
    var agree = confirm("Are you sure you wish to continue?");
    if (agree)
        return true;
    else
        return false;
}

function Popup()
{
    if (document.getElementById("ctl00_content_hidPopupMeg") != null)
    {
	    var meg = document.getElementById("ctl00_content_hidPopupMeg").value;
	    
	    if (meg != null && meg.length > 0)
	    {	
		    alert(meg);
	    }
	}
}

function KeyPressNumbers()
{   
   if (event.keyCode < 48 || event.keyCode > 57)
      
      event.returnValue = false;
}

function KeyPressMoney()
{   
   if ((event.keyCode < 48 && event.keyCode != 46) || event.keyCode > 57 )
      
      event.returnValue = false;
}

function OpenAddressBook(controlID)
{
   window.open('PopupAddressBook.aspx?ControlID=' + controlID, 'addressBook', 'width=400, height=450, left=0, top=0')
}

function FormatNumber(num,pl)
{               
      var snum;

      if(isNaN(num))  
            return ""

      if(pl == 0)
      {
            snum = Math.round(num)
      }
      else
      {
            snum = num * 100;
            snum = Math.round(snum);
            snum = snum / 100;
            snum = snum + '';

            zeros = '0000000000';
            if(snum.indexOf('.') == -1)
            {
                  snum = snum + '.';
            }
            snum = snum + zeros;
            snum = snum.substring(0, snum.indexOf('.') + pl+1);
            if(snum.charAt(0) == '.')
            {
                  snum = '0' + snum;
            }
      }
      return snum;
}

function closePopup()
{
    if (window.opener == null || window.opener.closed) 
        self.close(); 
}

function GetPrefix()
{
    if (document.getElementById("hidPrefix"))
        return document.getElementById("hidPrefix").value;
}


function GetElementValue(ID)
{
    var elementID = GetPrefix() + ID;
    
    if (document.getElementById(elementID) == null)
        return null;
    else
        return document.getElementById(elementID).value;
}

function GetElement(ID)
{
    var elementID = GetPrefix() + ID;
    
    return document.getElementById(elementID);
}





