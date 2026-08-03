# Architecture reseau

## Vue d'ensemble

Schema logique de l'architecture reseau mise en place :

```
Internet
   |
[Firewall perimetrique]
   |
   +-- VLAN 10 - Administration (postes IT, acces restreint)
   +-- VLAN 20 - Utilisateurs (postes bureautique)
   +-- VLAN 30 - Serveurs (AD, fichiers, applications)
   +-- VLAN 40 - Invites (acces internet uniquement)
   |
[Passerelle VPN] -- Tunnel site-a-site -- [Site distant]
   |
[Acces VPN nomade] -- Utilisateurs distants
```

## Zones de securite

| VLAN | Nom | Acces autorises |
|------|-----|------------------|
| 10 | Administration | Tous les VLAN (administration) |
| 20 | Utilisateurs | VLAN 30 (serveurs), Internet |
| 30 | Serveurs | VLAN 10, VLAN 20 (services publies) |
| 40 | Invites | Internet uniquement |

## Regles de filtrage

- Politique par defaut : deny all
- Autorisation explicite des flux necessaires (partage de fichiers, DNS, DHCP, HTTP/HTTPS sortant)
- Journalisation des flux rejetes pour analyse

## Supervision

La disponibilite des services et des equipements est supervisee via Nagios, avec analyse reguliere des journaux du firewall.
