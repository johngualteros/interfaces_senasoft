const flagsElement = document.getElementById("flags");

const textsToChange = document.querySelectorAll("[data-section]");

console.log(textsToChange);


const changeLanguage = async (language) => {
  const requestJson = await fetch(`../../public/languages/${language}.json`);
  const texts = await requestJson.json();

  console.log(requestJson, texts);


  for (let textToChange of textsToChange) {
    const section = textToChange.dataset.section;
    const value = textToChange.dataset.value;
    console.log(section, value);
    textToChange.innerHTML = texts[section][value];
    console.log(texts[section][value]);
  }
};
flagsElement.addEventListener("click", (event) => {
  console.log(event.target.parentElement.dataset.language)
  changeLanguage(event.target.parentElement.dataset.language);
});
