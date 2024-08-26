// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('DOMContentLoaded', () => {
  const searchInput = document.getElementById('search-input');
  const searchResults = document.getElementById('search-results');

  searchInput.addEventListener('input', debounce(handleSearch, 300));
  searchResults.addEventListener('keydown', handleResultNavigation);
});

function debounce(func, delay) {
  let timeoutId;
  return function (...args) {
    clearTimeout(timeoutId);
    timeoutId = setTimeout(() => func.apply(this, args), delay);
  };
}

async function handleSearch() {
  const query = document.getElementById('search-input').value;
  if (query.length < 3) {
    document.getElementById('search-results').style.display = 'none';
    return;
  }

  try {
    const response = await fetch(`/search?q=${encodeURIComponent(query)}`);
    const results = await response.json();
    displayResults(results);
  } catch (error) {
    console.error('Error fetching search results:', error);
  }
}

function displayResults(results) {
  const searchResults = document.getElementById('search-results');
  searchResults.innerHTML = '';

  if (results.length === 0) {
    searchResults.style.display = 'none';
    return;
  }

  results.forEach((result, index) => {
    const resultElement = document.createElement('div');
    resultElement.className = 'search-result';
    resultElement.tabIndex = 0;
    resultElement.innerHTML = `
      <div class="search-result-page">${result.page}</div>
      <div class="search-result-content">${result.content}</div>
    `;
    resultElement.addEventListener('click', () => navigateToResult(result.url));
    searchResults.appendChild(resultElement);
  });

  searchResults.style.display = 'block';
}

function handleResultNavigation(event) {
  const results = document.querySelectorAll('.search-result');
  const currentIndex = Array.from(results).findIndex(result => result === document.activeElement);

  switch (event.key) {
    case 'ArrowDown':
      event.preventDefault();
      if (currentIndex < results.length - 1) {
        results[currentIndex + 1].focus();
      }
      break;
    case 'ArrowUp':
      event.preventDefault();
      if (currentIndex > 0) {
        results[currentIndex - 1].focus();
      }
      break;
    case 'Enter':
      event.preventDefault();
      if (document.activeElement.classList.contains('search-result')) {
        navigateToResult(document.activeElement.dataset.url);
      }
      break;
  }
}

function navigateToResult(url) {
  window.location.href = url;
}
