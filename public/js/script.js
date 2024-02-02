"use strict";
document.addEventListener("DOMContentLoaded", function () {
  // Récupération des éléments HTML pour le premier modèle de voiture
  const modelSelect = document.getElementById("modelSelect");
  const colorSelect = document.getElementById("colorSelect");
  const carImage = document.getElementById("carImage");

  // Récupération des éléments HTML pour le deuxième modèle de voiture
  const modelSelect2 = document.getElementById("modelSelect2");
  const colorSelect2 = document.getElementById("colorSelect2");
  const carImage2 = document.getElementById("carImage2");

  // Objets contenant les chemins d'accès aux images pour les modèles et couleurs de voitures
  const carImages = {
    model1: {
      red: "/public/images/first-model-red.png",
      blue: "/public/images/first-model-blue.png",
      silver: "/public/images/first-model-silver.png",
    },
    model2: {
      black: "/public/images/second-model-black.png",
      green: "/public/images/second-model-green.png",
      yallow: "/public/images/second-model-yallow.png",
    },
  };

  // Fonction pour mettre à jour l'image de la voiture en fonction de la sélection
  function updateCarImage(modelSelect, colorSelect, carImage) {
    const model = modelSelect.value;
    const color = colorSelect.value;
    carImage.src = carImages[model][color];
  }

  colorSelect.addEventListener("change", updateCarImage);

  colorSelect.addEventListener("change", () =>
    updateCarImage(modelSelect, colorSelect, carImage)
  );

  colorSelect2.addEventListener("change", () =>
    updateCarImage(modelSelect2, colorSelect2, carImage2)
  );

  // Gestionnaire d'événement pour le bouton de confirmation de la première voiture
  const confirmButton1 = document.getElementById("confirmButton1");
  confirmButton1.addEventListener("click", () => {
    const model = modelSelect.value;
    const color = colorSelect.value;
    showConfirmation(model, color);
  });

  // Gestionnaire d'événement pour le bouton de confirmation de la deuxième voiture
  const confirmButton2 = document.getElementById("confirmButton2");
  confirmButton2.addEventListener("click", () => {
    const model = modelSelect2.value;
    const color = colorSelect2.value;
    showConfirmation(model, color);
  });

  // Fonction pour afficher le message de confirmation
  function showConfirmation(model, color) {
    const message = `Vous avez choisi la couleur ${color} pour le  ${model}`;
    alert(message);
  }

  // Initialize with the first model and color
  // Initialise les images avec le modèle et la couleur par défaut
  updateCarImage(modelSelect, colorSelect, carImage);
  updateCarImage(modelSelect2, colorSelect2, carImage2);
});
