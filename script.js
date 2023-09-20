document.addEventListener("DOMContentLoaded", function () {
    const searchInput = document.getElementById("search-input");
    const searchResults = document.getElementById("search-results");

    searchInput.addEventListener("input", function () {
        const searchTerm = searchInput.value.trim();

        if (searchTerm !== "") {
            // Send an AJAX request to suggestions.php
            fetch(`/suggestions.php?query=${encodeURIComponent(searchTerm)}`)
                .then((response) => response.json())
                .then((data) => {
                    displaySearchSuggestions(data);
                })
                .catch((error) => {
                    console.error("Error:", error);
                });
        } else {
            searchResults.innerHTML = "";
        }
    });

    function displaySearchSuggestions(suggestions) {
        searchResults.innerHTML = "";

        suggestions.forEach((suggestion) => {
            const suggestionItem = document.createElement("div");
            suggestionItem.classList.add("suggestion-item");
            suggestionItem.textContent = suggestion.title;

            suggestionItem.addEventListener("click", function () {
                searchInput.value = suggestion.title;
                searchResults.innerHTML = "";
                // You can trigger a search based on the selected suggestion here
            });

            searchResults.appendChild(suggestionItem);
        });
    }
});
s