# Test technique - 2 jours

## Brief

Votre client est un espace de coworking de Brest, qui propose un nombre
limité de places sous forme d'abonnement mensuel.
Ce service est en forte demande, et le client souhaite donner la possibilité aux
personnes intéressées de s'inscrire sur une liste d'attente.
L'inscription sur la liste d'attente se fait via un formulaire qui demande aux
utilisateurs

- le nom, le prénom,
- leur téléphone
- leur email

Lors de l'inscription sur la liste d'attente, un email doit être envoyé à la
personne intéressée, lui demandant de confirmer sa demande en cliquant
sur un lien contenu dans le mail.

Quand l'utilisateur confirme sa demande, il doit arriver sur une page qui lui
indique sa position dans la liste d'attente.
La position dans la liste d'attente se base sur le moment auquel l'utilisateur a
confirmé sa demande.

Tous les 15 jours, le client souhaite demander aux personnes inscrites sur la
liste d'attente de reconfirmer leur intérêt pour une place dans le coworking.
Un email doit être envoyé à la personne, afin de lui rappeler qu'elle est
toujours inscrite dans la liste d'attente. L'utilisateur aura le choix entre :

- Cliquer sur un lien pour reconfirmer ⇒ il doit arriver sur une page qui lui
confirme que sa demande a bien été reconfirmée et lui indique sa
position actuelle dans la liste d'attente.
- Cliquer sur un autre lien pour annuler sa demande ⇒ il doit arriver sur
une page qui lui confirme que sa demande à bien été supprimé de la
liste d'attente
- Ne rien faire - dans ce cas l'utilisateur verra sa demande annulée
automatiquement au bout de 20 jours après la dernière confirmation.
Un email devra prévenir l'utilisateur que sa demande a été annulée.

## Consignes :

- le principal critère d'évaluation c'est la satisfaction client : l'appli doit
répondre à ses besoins. Pour cela n'hésitez pas à poser des questions si
vous avez besoin de clarifications.
- le code doit être écrit en anglais ( les classes, les attributs, les variables,
etc).
- d'un point de vue technique, rajouter des tests est un plus.
- déployer le code pour que le client puisse tester est un plus.
- l'évaluation se fait sur le côté backend. Le front-end doit être
simplement fonctionnel.
- pas besoin de créer une interface d'administration pour la liste d’attente
- prenez 2 jours maximum pour réaliser cette appli (ou l'équivalent, si
vous ne pouvez pas réserver 2 jours complets).
