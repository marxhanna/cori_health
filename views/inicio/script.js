function selectBtn(id) {
    if (document.getElementById(id).classList.contains("selected")) {
        document.getElementById(id).classList.remove("selected");
    }
    else {
        document.getElementById(id).classList.add("selected");
    }
}