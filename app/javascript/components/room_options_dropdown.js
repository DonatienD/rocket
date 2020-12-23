const toggleDropdown = (dropdownMenu) => {
  // Toggle display / hide
  dropdownMenu.classList.toggle('hidden');
  dropdownMenu.classList.toggle('block');
};

export const roomOptionsDropdownAction = () => {
  // Select dropdown panel
  const dropdownPanel = document.querySelector('#room-options-dropdown-panel');
  // Select dropdown button
  const dropdownButton = document.querySelector('#room-options-dropdown-button');

  // Add event listener on dropdown button
  dropdownButton.addEventListener("click", (event) => {
    toggleDropdown(dropdownPanel);
  });
}
