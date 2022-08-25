const openModal = document.querySelector('.open-modal');
const modal = document.querySelector('.modal');
const closeModal = document.querySelector('.modal__close');
const form = document.getElementById('formLogin');
const email = document.getElementById('email');
const password = document.getElementById('password');
const error = document.getElementById('error');
const btnLogin = document.getElementById('btnLogin');
const errorPassword = document.getElementById('errorPassword');
btnLogin.disabled = true;

window.addEventListener('keydown', function (event) {
  let regex =
    /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;

  //

  if (!regex.test(email.value)) {
    error.innerHTML =
      "<img src='../../util/icons-template/icons/x.svg' width='40' />";
    error.style.display = 'block';
    btnLogin.disabled = true;
  } else if (regex.test(email.value)) {
    error.innerHTML =
      "<img src='../../util/icons-template/icons/check.svg' width='40' />";
    error.style.display = 'block';
    btnLogin.disabled = false;
  } else {
    error.style.display = 'none';
    btnLogin.disabled = false;
  }

  if (password.value.length < 8) {
    errorPassword.innerHTML =
      "<img src='../../util/icons-template/icons/x.svg' width='40' />";
    errorPassword.style.display = 'block';

    btnLogin.disabled = true;
  } else if (password.value.length >= 8) {
    errorPassword.innerHTML =
      "<img src='../../util/icons-template/icons/check.svg' width='40' />";
    errorPassword.style.display = 'block';
    btnLogin.disabled = false;
  } else {
    errorPassword.style.display = 'none';
    btnLogin.disabled = false;
  }
});
