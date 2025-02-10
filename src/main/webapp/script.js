const hamBurger = document.querySelector(".toggle-btn");

hamBurger.addEventListener("click", function () {
  const sidebar = document.querySelector("#sidebar");
  const mainContent = document.querySelector(".main");
  
  sidebar.classList.toggle("expand");
  mainContent.classList.toggle("loaded");
});

// Wait for the DOM to load fully
document.addEventListener('DOMContentLoaded', function() {
    // Add the 'loaded' class to the body to trigger the fade-in effect
    document.body.classList.add('loaded');
    
    // Also ensure the main content fades in
    const mainContent = document.querySelector('.main');
    if (mainContent) {
        mainContent.classList.add('loaded');
    }
});
