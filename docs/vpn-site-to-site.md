# VPN site-a-site (IPsec)

## Objectif

Etablir un tunnel chiffre permanent entre deux sites afin d'interconnecter leurs reseaux locaux de maniere securisee.

## Prerequis

- Deux pare-feux/routeurs compatibles IPsec (IKEv2)
- Adresses IP publiques fixes sur les deux extremites
- Plages IP des reseaux locaux distincts (pas de chevauchement)

## Parametres de configuration recommandes

- Phase 1 (IKE) : chiffrement AES-256, hachage SHA-256, groupe Diffie-Hellman 14
- Phase 2 (IPsec) : AES-256-GCM, PFS active
- Duree de vie des cles : 8 heures (phase 1), 1 heure (phase 2)
- Authentification : cle pre-partagee forte ou certificats

## Etapes de mise en oeuvre

1. Definir les reseaux locaux et les plages a interconnecter sur chaque site
2. Configurer la phase 1 (IKE) avec les parametres de chiffrement ci-dessus
3. Configurer la phase 2 (IPsec) et les selecteurs de trafic (reseaux locaux concernes)
4. Ajouter les regles de pare-feu autorisant le trafic chiffre entre les deux sites
5. Tester la connectivite (ping, acces aux ressources partagees)
6. Mettre en place une supervision de l'etat du tunnel (alerte en cas de coupure)

## Verification

- Controler l'etablissement du tunnel (etat "up" des phases 1 et 2)
- Verifier le chiffrement effectif du trafic (capture reseau)
- Documenter les adresses IP et parametres dans un registre de configuration
