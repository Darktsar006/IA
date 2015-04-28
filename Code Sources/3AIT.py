#! /usr.bin/env python
# -*-coding:utf8-*-

'''
Une règle est un tuple formé de deux éléments :
- un tuple de string. Les premisses de la règle
- un string. La conclusion de la règle.
Les règles sont rangées dans une liste.
'''
regles = [
     (('Collectivite', 'Onereux',),
          'Avion'),
     (('Avion', '600 Places',),
          'Avion de ligne'),
     (('Avion', '20 Places',),
          'Avion de tourisme'),
     (('Collectivite', 'Onereux',),
          'Train'),
     (('Collectivite', 'Peu Onereux', 'Petrole',),
          'Bus'),
     (('Collectivite', 'Peu Onereux', 'Electricite',),
          'Metro'),

     (('Particulier','Vehicule a 4 Roues',),
          'Camion'),     
     (('Camion', 'Avec Remorque',),
          'Camion Avec Remorque'),
     (('Camion','Sans Remorque',),
          'Camion Sans Remorque '),


     (('Particulier','Vehicule a 4 Roues',),
          'Leger'),
     (('Leger', '4 Places'),
          'Voiture'),
     (('Leger', '5 Places'),
          'Camionnette'),
     

     
     (('Particulier', 'Vehicule a 2 Roues', 'Pedalier',),
          'Velo'),
     (('Particukier', 'Vehicule a 2 Roues', 'Motoriser',),
          'Motos'),
     (('Particulier','Navigants', 'Gros Navigants',),
          'Bateaux'),
     (('Particulier','Navigants', 'Petit Navigants',),
          'Jet Ski'),
]
'''
La fonction dansalors permet de trouver les règles accociées à une conclusion
'''

def dansalors(fait):
     results = list()
     for premisses, conclusion in regles:
         if conclusion == fait:
             results.append((premisses, conclusion))
     return results

'''
Initialisation de la mémoire et des faits initiaux
'''

memoire = {}

faits_initiaux = {
'Metro': True,
}

'''
La fonction connais interroge la mémoire (et les faits initiaux)
'''

def connais(fait):
     resultat = None
     # interrogation des faits prédefinis
     if faits_initiaux: resultat = faits_initiaux.get(fait, None)

     # Interrogation des faits mémorisés
     if resultat == None and memoire: resultat = memoire.get(fait, None)

     return resultat

'''
La fonction memorise sauvegarde un fait dans la mémoire
'''

def memorise(fait, resultat):
     global memoire
     memoire[fait] = resultat

'''
La fonction demander interroge l'utilisateur.
'''

def demander(fait, question='Est-il vrai que'):
     REPONSES={'o': True, 'n': False,}
     while True:
          choice = input("%s '%s' ?[o/n]" % (question, fait)).lower()
          if choice in REPONSES.keys(): return REPONSES[choice]
          else: print ("Merci de repondre avec o ou n")

'''
La fonction justifie qui, de manière récursive, vas parcourir les règles en
profondeur pour en déduire le but.
'''

def justifie(fait):
     #controle du fait en mémoire
     resultat = connais(fait)
     if resultat != None:
          return resultat

     # détermination des règles possible pour valider le fait courant
     regles = dansalors(fait)

     # Si nous sommes en présence d'une racine, poser la question
     if not regles:
          resultat = demander(fait)
          memorise(fait, resultat)
          return resultat

     # évaluation des règles
     for premisses, conclusion in regles:
          valider = True
          for f in premisses:
               # parcours en profondeur
               if not justifie(f):
                    valider = False
                    break
          if valider:
               print (" %s donc %s" % (" et ".join(premisses), fait))
               memorise(fait, True)
               return True

     # aucun fait ou règle trouvé
     return False


'''
La fonction depart qui cherche à prouver un des diagnostics
'''

def depart(diagnostics):
     # parcours depuis les faits diagnostics, les feuilles
     for fait in diagnostics:
          if justifie(fait):
               print ("Conclusion : donc %s" % fait)
               return True

     print ("Aucun diagnostics ne peut etre obtenu")
     return False


'''
Main programme Principale
'''

if __name__ == "__main__":

     # Affichage des règles
     print ("--- Règles chargées:")
     for premisses, conclusion in regles:
          print("Si %s alors %s" % (" et ".join(premisses), conclusion))
     print("---")

     # nous déterminons les feuilles de l'arbre.
     diagnostics = []
     for premisses, conclusion in regles:
          feuille = True
          for p, c in regles:
               if conclusion in p:
                    feuille = False
                    break
          if feuille:
               diagnostics.append(conclusion)

     # Affichage des diagnostics
     print ("--- Diagnostics")
     print (diagnostics)
     print ("----")

     depart(diagnostics)
