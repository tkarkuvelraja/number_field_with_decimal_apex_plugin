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
 */
 
function isNumberKey(element) {
    var keyPressed = (event.which) ? event.which : (window.event.keyCode) ? window.event.keyCode : -1;
	console.log (keyPressed); 
    if ((keyPressed >= 48) && (keyPressed <= 57)) {
        return true;
    }

    // '.' checking decimal point...
    else if (keyPressed == 46) {
        // Allow only 1 decimal point ('.')...  
        if ((element.value) && (element.value.indexOf('.') >= 0))
            return false;
        else
            return true;
    }
    return false;
}