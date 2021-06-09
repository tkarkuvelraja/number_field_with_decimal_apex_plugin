/*
 * Number Field.
 * Plug-in Type: Itenm
 * Summary: Plugin In to allow only Numeric Values and allow Only one DOT in a Number Field.
 *
 * ----- Contact information ----
 *
 * Developed by * Evaluate Consulting Services, Bangalore
 * Contact: info@evaluatecs.com
 * Website: https://evaluatecs.com
 *
 * @author Karkuvelraja Thangamariappan - tkarkuvelraja@gmail.com
 * Profile: https://www.linkedin.com/in/karkuvelrajathangamariappan
 * Twitter: https://twitter.com/tkarkuvelraja
 * Blog: http://orclking.blogspot.com/
 * Reference: https://stackoverflow.com/questions/9799505/allow-only-numbers-and-dot-in-script
 */
 
function isNumberKey(id,decimalpoints) {
    if (event.keyCode > 47 && event.keyCode < 58 || event.keyCode == 46) {
        //  var txtbx=document.getElementById(txt);
        var amount = document.getElementById(id).value;
        var dotpresent = 0;
        var count = 0;
console.log (dotpresent);
console.log (count);
//console.log (amount.indexOf(".", dotpresent));
        if ( amount.indexOf(".", dotpresent + 1)); {
            // alert('0');
        }

        do {
            dotpresent = amount.indexOf(".", dotpresent);
            if (dotpresent != -1) {
                count++;
                dotpresent++;
            }
        }
        while (dotpresent != -1);
        if (dotpresent == -1 && amount.length == 0 && event.keyCode == 46) {
            event.keyCode = 0;
            alert("Wrong position of decimal point not  allowed !!");
            return false;
        }

        if (count >= 1 && event.keyCode == 46) {

            event.keyCode = 0;
            alert("Only one decimal point is allowed !!");
            return false;
        }
		
		 if (amount.length > 0 && count >= 1 && event.keyCode == 46) {

            event.keyCode = 0;
            alert("Only one decimal point is allowed !!");
            return false;
        }
		
        if (count == 1) {
            var lastdigits = amount.substring(amount.indexOf(".") + 1, amount.length);
            if (lastdigits.length >= decimalpoints) {
				let str = decimalpoints;
				str += ' ';
				str += 'decimal places only allowed';
				str;
                alert(str);
                event.keyCode = 0;
                return false;
            }
        }
        return true;
    } else {
        event.keyCode = 0;
        alert("Only Numbers with dot allowed !!");
        return false;
    }

}
