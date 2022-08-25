const button = document.querySelector('#icon_mode')
const body = document.querySelector('body')
const text_link = document.querySelector('#link_navbar')

load();


window.addEventListener('load',e=>{
    if(body.classList.contains('darkmode')){
        button.innerHTML=`<img src="../util/icons-template/icons/brightness-high.svg" alt="" id="img_icon_mode" width="30">`;
    }else {
        button.innerHTML=`<img src="../util/icons-template/icons/moon.svg" alt="" id="img_icon_mode" width="30">`;
    }
})
button.addEventListener('click', e => {
    body.classList.toggle('darkmode');
    store(body.classList.contains('darkmode'));

    if (body.classList.contains('darkmode')) {
        button.innerHTML=`<img src="../util/icons-template/icons/brightness-high.svg" alt="" id="img_icon_mode" width="30">`;
    } else {
        button.innerHTML=`<img src="../util/icons-template/icons/moon.svg" alt="" id="img_icon_mode" width="30">`;
    }
})
function load() {
    const darkmode = localStorage.getItem('darkmode')

    if (!darkmode) {
        store('false');
    } else if (darkmode == 'true') {
        body.classList.add('darkmode');
    }
}
function store(value) {
    localStorage.setItem('darkmode', value)
}