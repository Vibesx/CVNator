/**
 * Created by Leon on 6/5/2016.
 */
var typeSelect = document.getElementById("typeSelect");
var addNewOption = document.getElementById("addnewoption");
var removeOptionButton = document.getElementById("removeoption");
var options = document.getElementById("options");

var i = 0;

typeSelect.addEventListener("change", function() {
    if(typeSelect.value == "radio" || typeSelect.value == "dropdown" || typeSelect.value == "checkbox") {
        addNewOption.style.display = 'block';
        options.style.display = 'block';
    } else {
        addNewOption.style.display = 'none';
        options.style.display = 'none';
    }
});

addNewOption.addEventListener("click", function() {
    if(i < 6) {
        i++;
        var div = document.createElement('div');
        div.innerHTML = '<input type="text" name="option'+i+'" ><input type="button" id="removeoption" value="-" onclick="removeOption(this)">';
        options.appendChild(div);
    }
});

function removeOption(option) {
    options.removeChild(option.parentNode);
    i--;
}
