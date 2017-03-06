function getLocation(id) {

    var xmlhttp = new XMLHttpRequest();
    var url = "../images/data.json";

    xmlhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            var myArr = JSON.parse(this.responseText);
            console.log(myArr);
        }
    };

    xmlhttp.open("GET", url, true);
    xmlhttp.send();
}
