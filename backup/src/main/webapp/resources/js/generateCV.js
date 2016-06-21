/**
 * Created by Leon on 6/4/2016.
 */

/*var customFieldsArray = document.getElementById("customFields");

console.log(customFieldsArray.value);*/

document.getElementById("addNewFieldButton").addEventListener("click", function() {
    window.open("/addnewfield", null, "height=500, width=900, status=yes");
});

document.getElementById("parentButton").addEventListener("click", function() {
    var arr = document.getElementsByName('submitButton1');
    for(var i = 0; i < arr.length; i++) {
        arr[i].id = 'tempButtonId' + i;
    }
    for(i = 0; i < arr.length; i++) {
        document.getElementById('tempButtonId' + i).click();
    }
});




