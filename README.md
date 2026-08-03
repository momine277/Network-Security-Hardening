# Network-Security-Hardening

Documentation et scripts de securisation d'une infrastructure reseau : firewall, VPN site-a-site et nomade, segmentation, durcissement des equipements.

## Contexte

Ce depot documente une architecture reseau securisee telle que deployee dans le cadre d'une mission d'administration systemes, reseaux et securite : segmentation par VLAN, filtrage inter-VLAN, VPN site-a-site entre deux sites et acces VPN nomade pour les utilisateurs distants.

## Contenu

- `docs/architecture.md` : schema et description de l'architecture reseau (VLAN, zones de securite, flux autorises)
- `docs/vpn-site-to-site.md` : procedure de configuration d'un tunnel VPN site-a-site (IPsec)
- `docs/vpn-nomade.md` : procedure de configuration d'un acces VPN nomade (OpenVPN / IKEv2)
- `Scripts/Test-FirewallRules.ps1` : script de verification des regles de pare-feu Windows

## Principes de securisation appliques

- Segmentation reseau par VLAN (utilisateurs, serveurs, invites, administration)
- Filtrage par defaut en refus (deny by default) entre zones
- Chiffrement des flux VPN (IPsec / OpenVPN)
- Restriction des acces d'administration a un VLAN dedie
- Journalisation et supervision des flux inter-zones

## Avertissement

Ce depot est fourni a des fins de demonstration et de portfolio. Les exemples de configuration doivent etre adaptes et testes avant toute mise en production.

## Auteur

Mohamed-Amine - Administrateur Systemes, Reseaux et Securite
