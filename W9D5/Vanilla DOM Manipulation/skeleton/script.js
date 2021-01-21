document.addEventListener("DOMContentLoaded", () => {
  
  // Phase I: Crossing off list items
  
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // Phase II: Adding list items

  // adding SF places as list items

  const handleFavoriteSubmit = (e) => {

    // "cancel" the event; if the event were not canceled the browser
    // would try to submit the form for real.
    e.preventDefault();

    // gets the input element, so we can get the value of it (in the following line)
    const favoriteInput = document.querySelector(".favorite-input");

    // favorite = whatever we wrote in the textbox (after hitting "Add to list")
    const favorite = favoriteInput.value;

    // clears the textbox after we hit "Add to list"
    favoriteInput.value = "";


    // create an li element
    const newListLi = document.createElement("li");
    // set the text of the li to be the value of the input field
    newListLi.textContent = favorite;

    // Get the ul of fav places to visit (underneath the text box)
    const favoritesList = document.getElementById("sf-places");

    // inserts the newListLi (with the text content of the place we submitted)
    // as the last item in the ul we just got.
    favoritesList.appendChild(newListLi);
  };

  // Event Listener
  const listSubmitButton = document.querySelector(".favorite-submit");
  listSubmitButton.addEventListener("click", handleFavoriteSubmit);



  // Phase III: Adding your own photos

  // adding new photos

  // Part 1 - shows the form (text box) for us to enter the image's link url

  const showPhotoForm = (e) => {
    const photoFormDiv = document.querySelector(".photo-form-container");

    // by setting the class to "photo-form-container hidden" and "photo-form-container"
    // -> this allows "hide" the photo form, and "show" it (aka toggle)

    if (photoFormDiv.className === "photo-form-container") {
      photoFormDiv.className = "photo-form-container hidden";
    } else {
      photoFormDiv.className = "photo-form-container";
    }
  };

  // Event Listener
  const photoFormShowButton = document.querySelector(".photo-show-button");
  photoFormShowButton.addEventListener("click", showPhotoForm);


  // Part 2 - adds the image from the url link to our photos 
  // (aftering hitting "Add photo")

  const handlePhotoSubmit = (e) => {
    e.preventDefault();

    const photoUrlInput = document.querySelector(".photo-url-input");
    const photoUrl = photoUrlInput.value;
    photoUrlInput.value = "";

    // these two lines creates the image from our entered url
    const newImg = document.createElement("img");
    newImg.src = photoUrl;


    // kinda confusing - so 1st we append the image to a new list element
    // -> then, in the last 2 lines, we append that new list elements 
    //    -> to our list of existing dog photos (?)
    const newPhotoLi = document.createElement("li");
    newPhotoLi.appendChild(newImg);

    const dogPhotosList = document.querySelector(".dog-photos");
    dogPhotosList.appendChild(newPhotoLi);
  };

  // Event Listener
  const photoSubmitButton = document.querySelector(".photo-url-submit");
  photoSubmitButton.addEventListener("click", handlePhotoSubmit);
  
});
