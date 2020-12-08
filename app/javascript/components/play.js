const flipCard = (currentFlashcard) => {
  // Get active side of current FC
  const currentFlashcardSide = currentFlashcard.querySelector(".flashcard-side.block");
  // Hide that side
  currentFlashcardSide.classList.remove("block");
  currentFlashcardSide.classList.add("hidden");
  // Show the other side
  currentFlashcardSide.nextElementSibling.classList.remove("hidden");
  currentFlashcardSide.nextElementSibling.classList.add("block");
};

// Select user answer and display it on other side of FC
const PromptUserAnswer = (currentFlashcard) => {
  // Select user answer
  const userAnswer = currentFlashcard.querySelector("textarea").value;
  currentFlashcard.querySelector(".insert-answer-here").innerText = userAnswer;
};

export const initPlay = () => {
  // Select all FC
  const flashcards = document.querySelectorAll(".flashcard");
  // Select flip button ('Voir la réponse')
  const flipCardButtons = document.querySelectorAll(".flip-card-front-button");

  // Select validate buttons
  const correctButton = document.querySelector("#correct");
  const incorrectButton = document.querySelector("#incorrect");
  // Select return button
  const returnButton = document.querySelector("#return");
  const topReturnButton = document.querySelector("#return-top");

  const goToNextCard = (event) => {
    // Select current FC (both sides)
    const currentFlashcard = document.querySelector(".flashcard.block");
    // Hide current FC
    currentFlashcard.classList.remove("block");
    currentFlashcard.classList.add("hidden");
    // If there are still cards to complete, show next card
    if (currentFlashcard.nextElementSibling) {
      currentFlashcard.nextElementSibling.classList.remove("hidden");
      currentFlashcard.nextElementSibling.classList.add("block");
      // Hide validation buttons
      correctButton.classList.remove("block");
      correctButton.classList.add("hidden");
      incorrectButton.classList.remove("block");
      incorrectButton.classList.add("hidden");
    } else {
      // Else, go back to first card
      flashcards[0].classList.remove("hidden");
      flashcards[0].classList.add("block");
    };
  };

  if (flashcards) {
    // Event listeners on validates buttons if FC is not empty
    // (allows the method to be run only on the play page)
    correctButton.addEventListener("click", goToNextCard);
    incorrectButton.addEventListener("click", goToNextCard);

    // Flip flashcard
    // Iterate over each flip button
    flipCardButtons.forEach((flipCardButton, index) => {
      // Add event listener to each button
      flipCardButton.addEventListener("click", (event) => {
        // Display user answer on other side of FC
        PromptUserAnswer(flashcards[index]);
        // Each button is associated with the action of flipping its card
        flipCard(flashcards[index]);
        // Check if last FC
        if (index === flashcards.length - 1) {
          // Display return button, to go back to subject
          returnButton.classList.remove("hidden");
          returnButton.classList.add("block");
          topReturnButton.classList.add("hidden");
        } else {
          // Display validation buttons, to go to next card
          correctButton.classList.remove("hidden");
          correctButton.classList.add("block");
          incorrectButton.classList.remove("hidden");
          incorrectButton.classList.add("block");
        };
      });
    });
  };
}
