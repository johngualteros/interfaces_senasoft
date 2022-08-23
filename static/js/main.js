const openModal = document.querySelector(".open-modal");
const modal = document.querySelector(".modal");
const closeModal = document.querySelector(".modal__close");
const form = document.getElementById("formLogin");
const email = document.getElementById("email");
const password = document.getElementById("password");
const error = document.getElementById("error");
const btnLogin = document.getElementById("btnLogin");
const errorPassword = document.getElementById("errorPassword");

window.addEventListener("keydown", function (event) {
  let regex =
    /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;

  if (!regex.test(email.value)) {
    error.innerHTML = "<img src='../util/icons-template/icons/icon-check.svg' width='100'/>";
    error.style.display = "block";
    btnLogin.disabled = true;
  } else {
    error.style.display = "none";
    btnLogin.disabled = false;
  }
  if (password.value.length < 8) {
    errorPassword.innerHTML = "Password must be at least 8 characters long";
    errorPassword.style.display = "block";

    btnLogin.disabled = true;
  } else {
    errorPassword.style.display = "none";
    btnLogin.disabled = false;
  }
});

openModal.addEventListener("click", (e) => {
  e.preventDefault();
  modal.classList.add("modal--show");
});

closeModal.addEventListener("click", (e) => {
  e.preventDefault();
  modal.classList.remove("modal--show");
});
