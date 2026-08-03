# Acces VPN nomade

## Objectif

Permettre aux utilisateurs distants (teletravail, deplacements) d'acceder de maniere securisee aux ressources internes de l'entreprise.

## Solutions envisagees

- IKEv2/IPsec : integration native sur la plupart des systemes (Windows, macOS, mobiles)
- OpenVPN : solution flexible et largement supportee, chiffrement TLS

## Parametres de securite recommandes

- Authentification forte : certificat client + identifiant/mot de passe (ou MFA)
- Chiffrement : AES-256
- Attribution d'une plage d'adresses IP dediee aux clients nomades, isolee des autres VLAN
- Filtrage des flux entrants depuis le VLAN VPN nomade vers les ressources internes (acces limite au strict necessaire)

## Etapes de mise en oeuvre

1. Installer et configurer le serveur VPN (IKEv2 ou OpenVPN) sur le pare-feu/passerelle
2. Generer les certificats clients (ou configurer l'authentification MFA)
3. Definir une plage d'adresses dediee et les regles de filtrage associees
4. Distribuer la configuration client aux utilisateurs
5. Tester la connexion et l'acces aux ressources autorisees
6. Documenter la procedure de revocation d'acces (depart d'un collaborateur, perte d'un poste)

## Bonnes pratiques

- Revoquer immediatement les acces des utilisateurs quittant l'entreprise
- Journaliser les connexions VPN (date, duree, utilisateur)
- Sensibiliser les utilisateurs nomades aux bonnes pratiques de securite (reseaux Wi-Fi publics, verrouillage de session)
