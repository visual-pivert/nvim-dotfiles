# Keymap memo

<leader> = " "

## 1. Fichier

f % -- Créer un nouveau fichier
f D -- Supprimer un fichier
f R -- Renommer un fichier
f i -- Change le mode de vue du navigateur de fichier

## 2. telescope (fuzzy finder)

n <leader>pv -- Ouvrir le navigateur de fichier (file mode: f)
n <leader>pf -- Trouver un fichier (fuzzyFinder)
n <leader>pg -- Grep


## 3. Language server

n <leader>r -- Voir l'erreur
n <leader>t -- Ouvir l'erreur
n ]d -- Prochain erreur
n [d -- Précedent erreur

i <C-n> -- Prochain choix de completion
i <C-p> -- Precedent choix de completion

:Mason -- Trouver et installer des LSP

## 4. Edition

v J -- Déplacer la selection vers le bas
v K -- Déplacer la selection vers le haut

:s/txt/new/g -- Change tous les occurences de "txt" en "new" vers le bas

## 5. Harpoon

n <leader>e -- Ouvrir Harpoon
n <leader>a -- Ajouter un buffer dans Harpoon
n <C-s> -- Buffer 1
n <C-t> -- Buffer 2
n <C-h> -- Buffer 3
n <C-n> -- Buffer 4

## 6. Motion

n L -- Aller vers le bas du fichier
n H -- Aller vers le haut du fichier

## 7. Packer
:PackerSync -- Synchronise les packages

## 8. Zoom et Dezoom

n <C-+> -- zoom
n <C--> -- dezoom
