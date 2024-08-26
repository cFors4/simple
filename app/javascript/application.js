// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('DOMContentLoaded', () => {
  const searchButton = document.getElementById('search-button');
  const searchOverlay = document.getElementById('search-overlay');
  const searchInput = document.getElementById('search-input');
  const closeSearch = document.getElementById('close-search');
  const searchResults = document.getElementById('search-results');

  searchButton.addEventListener('click', openSearch);
  closeSearch.addEventListener('click', closeSearchOverlay);
  searchInput.addEventListener('input', handleSearch);
  searchInput.addEventListener('keydown', handleInputNavigation);
  searchResults.addEventListener('keydown', handleResultNavigation);
  document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape') closeSearchOverlay();
  });
});

function openSearch() {
  const searchOverlay = document.getElementById('search-overlay');
  const searchInput = document.getElementById('search-input');
  searchOverlay.style.display = 'flex';
  setTimeout(() => {
    searchInput.focus();
  }, 100);
}

function closeSearchOverlay() {
  const searchOverlay = document.getElementById('search-overlay');
  const searchResults = document.getElementById('search-results');
  const searchInput = document.getElementById('search-input');
  searchOverlay.style.display = 'none';
  searchResults.innerHTML = '';
  searchInput.value = '';
}

async function handleSearch() {
  const query = document.getElementById('search-input').value;
  const searchResults = document.getElementById('search-results');
  
  if (query.length === 0) {
    searchResults.innerHTML = '';
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
    searchResults.innerHTML = '<div class="search-result">No results found</div>';
    return;
  }

  results.forEach((result, index) => {
    const resultElement = document.createElement('div');
    resultElement.className = 'search-result';
    resultElement.setAttribute('role', 'option');
    resultElement.setAttribute('tabindex', '-1');
    resultElement.setAttribute('data-url', result.url);
    resultElement.innerHTML = `
      <div class="search-result-page">${result.page}</div>
      <div class="search-result-content">${result.content}</div>
    `;
    resultElement.addEventListener('click', () => navigateToResult(result.url));
    searchResults.appendChild(resultElement);
  });
}

function handleInputNavigation(event) {
  const searchResults = document.getElementById('search-results');
  const results = searchResults.querySelectorAll('.search-result');

  if (event.key === 'ArrowDown' && results.length > 0) {
    event.preventDefault();
    results[0].focus();
  }
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
      } else {
        document.getElementById('search-input').focus();
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
  closeSearchOverlay();
}
