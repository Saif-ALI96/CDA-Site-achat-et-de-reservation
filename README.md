# CDA-Site-achat-et-de-reservation

## CONTEXTE  
Nous avons été contacté par un client qui nous a soumis son projet. Notre client souhaite créer une plateforme en ligne de vente et réservation de voiture. Cette plateforme construit ses propres voitures par le biais de sa production et propose ainsi trois modèles de voiture :

1. City - 1.5 ddCi – Diesel - City car, 90hp, prix : 21500€
2. Family - 1.2 Tfe - Gasoline - 130hp, prix : 33650€
3. Sportive - 2.0 Spi – Gasoline - 240hp, prix : 47750€

Avant toute action de réservation, l’utilisateur doit se créer un compte client et se connecter. Il pourra également modifier son compte ou le supprimer.

Une fois la connexion à son compte faite, il pourra choisir, personnaliser et réserver une voiture. Le tout à distance. La personnalisation dans la réservation comprend la sélection de la couleur de son choix et ajouter des options supplémentaires. Ces ajouts occasionnent des frais supplémentaire qui s’additionneront au prix de base du véhicule choisi.

**Colors (x3) :**  
black (450.00€),\
red (750.00€),\
metallic gray (1000.00€)

**Options (x3) :**\
Régulateur/limitateur de vitesse (350,00€)\
GPS (600,00€)\
Siège chauffant (900,00€)

Après avoir achevé l’étape ‘de personnalisation, il peut entamer la validation de sa réservation et payer. Une fois validé, la plateforme va envoyer en commande le véhicule réservé :

La fabrication va renvoyer des notifications à l’utilisateur pour l’informer de la date de début de production, la date de fin prévue et d’éventuels retard et au final lui notifier la date et le lieu de livraison

---

## UML

• **diagramme de cas d’utilisation**

Ici, le diagramme use case va refléter les actions que peut réaliser l’acteur de la plateforme. L’acteur, ici l’utilisateur (User), va pouvoir créer un compte client, accéder à son compte et le supprimer. Il pourra ainsi démarrer la personnalisation du véhicule puis sa réservation en terminant cette étape par le paiement et la validation de réservation. À cette étape le véhicule sera fabriquer et le client recevra une notification à chaque nouvelle étape de la production jusqu’à son acheminement.

Il pourra ainsi s’y connecter, supprimer son compte s’il le souhaite et se déconnecter. Après quoi, il sera possible de choisir un modèle et d’entamer la phase de réservation qui comprend la personnalisation du véhicule. Une fois la couleur choisi et les options supplémentaire ajoutées (ou non) par l’utilisateur, ce dernier pourra payer et, de ce fait, valider la réservation. Il lui sera également possible d’annuler la réservation.

**Les acteurs**:\
User

• **diagramme de classes**

- Classe User
- Classe Vehicle
- Classe Reservation
- Classe Notification

Les relations :
Classe User est lié Classe Vehicle
Classe Vehicle est lié à Classe Reservation
Classe Reservation est lié à Classe Notification

Attributs dans les différentes classes :
User : id_user, lastname, firstname, password, phone, birthday
Platform : id
Vehicle : id_car, model, color, options, base_price
Reservation : id_reservation, isConformed, isPayd, status
Notification : id_notif, message, notif_dt

---

## MERISE

• **Dictionnaire de données**

- **MCD**

---

## DESIGN PATTERNS

![Image-diag-classes](./illustrations/Cas%20d'utilisation-Diag.-classes%20final.drawio.png)

• **Observer**\
Nous avons opter pour un design patterns comportemental pour la fonctionnalité 'Notification' de la plateforme. En effet, il nous est apparu que l'Observer permet d'établir une relation entre objets, de manière à ce que lorsque l'état d'un objet change, tous les objets dépendants en soient informés et mis à jour automatiquement. Ici, ce DP permets de notifier le client du statut de sa réservation, c'est-à-dire à quel étape en est sa commande.

Son avantage : Améliore l'expérience client.

• **Factory**

Titre
Description du problème résolu
Structure et participants
Avantages et inconvénients
Mise en place dans le projet
Diagramme UML (optionnel)

prompt :
Reformule moi ce paragraphe avec une tournure formelle :
