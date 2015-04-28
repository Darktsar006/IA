;Nom : TRAORE
;Prenom : Oumar
;IDBooster : 165366

; Exercice 1

; Question 1.1
; Ecrire une fonction (reorganiser1 '(les mouton) '(le loups)) -> '((les loups) le mouton)

(defun reorganise1 (liste1 liste2)
 (setq a  (car liste1))
 (setq b  (cadr liste1))
 (setq c  (car liste2))
 (setq d  (cadr liste2))
 (list (list a d) c b) 
)

; Question 1.2
; Ecrire une fonction (reorganise2 '(les mouton) '(le loups)) -> '(les loups le mouton)

(defun reorganise2 (liste1 liste2)
 (setq a  (car liste1))
 (setq b  (cadr liste1))
 (setq c  (car liste2))
 (setq d  (cadr liste2))
 (list a d c b) 
)

; Question 1.3
; Ecrire une fonction (reorganise3 '(les mouton) '(le loups)) -> '((les loups) (le mouton))

(defun reorganise3 (liste1 liste2)
 (setq a  (car liste1))
 (setq b  (cadr liste1))
 (setq c  (car liste2))
 (setq d  (cadr liste2))
 (list (list a d) (list c b)) 
)

; Question 1.4
; Ecrire une fonction (dupliquer 'a) -> (a a a)

(defun duplique (atome)
  (list atome atome atome)
)

; Question 1.5
; Ecrire une fonction (construireListe '(a) 'a '(a)) -> ((a) a (a))

(defun construireListe (atome1 atome2 atome3)
  (list atome1 atome2 atome3)
)

; Question 1.6
; Que vous donnent les interpretations suivantes:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 1- (reorganise1 (construireListe 'UN 'LA 'PHRASE) (reorganise1 (construireListe 'AVEZ 'BRAVO 'VOUS)(duplique 'GRAND))) 
; Reponse : ((UN GRAND) (AVEZ GRAND) LA)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 2 - (reorganise2 (construireListe 'UN 'LA 'PHRASE) (reorganise2 (construireListe 'AVEZ 'BRAVO 'VOUS)(duplique 'GRAND)))
; Reponse:  (UN GRAND AVEZ LA)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 3- (reorganise3 (construireListe 'UN 'LA 'PHRASE) (reorganise3 (construireListe 'AVEZ 'BRAVO 'VOUS)(duplique 'GRAND)))
; Reponse: ((UN (GRAND BRAVO)) ((AVEZ GRAND) LA))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Question 1.7
; Quelle interprŽtation, selon vous, ˆ lÕaide de 
; la Question 1.6 permet dÕavoir le meilleur rŽsultat
; expliquez et dŽtaillez.

; Analysons le retour de : 
; (duplique 'GRAND) -> (GRAND GRAND GRAND)
; (construireListe 'AVEZ 'BRAVO 'VOUS) -> (AVEZ BRAVO VOUS)

; Exercice 2

; Question 2.1 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Spécification :

; * Abscisse représenté par L'Atome : x
; * Ordonnée représenté par L'Atome : y

; * Point est une liste composée des Atomes Abscisse et Ordonnée : (x y)

; * Segment est une liste composé de 2 Points : (Point1 Point2) -> ((x1 y1) (x2 y2))
; Avec :
;   Point1 : (x1 y2)
;   Point2 : (x2 y2)

; * PointMilieu est representé par un point : PointMilieu = (Point) -> (x3 y3)
;   Les Atomes du PointMilieu x3 et y3 sont calculer de manière mathématique à l'aide des points (Point1 Point2) du segment.
;   Avec : 
;     x3 : ((x1 +x2)/2)
;     y3 : (y1 +y2)/2)
;   PointMilieu est donnée par la formule Mathématique: (((x1 + x2)/2) ((y1 + y2)/2)) 
;   En Langage Lisp : ((/ (+ x1 x2) 2)  ((/ (+ y1 y2) 2))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Le problème posé :
; Ecrire une fonction pointMilieu qui reçoit un segment en paramètre et renvoi en sorti le point Milieu
 
; La Fonction :
; pointMilieu(segment) -> PointMiLieu

; Nous avons donc :
;    *  pointMilieu(segment) -> PointMiLieu
;    *  pointMilieu(segment) -> (x3 y3).
;    *  pointMilieu(segment) - > (((x1 + x2)/2) ((y1 + y2)/2))

; NB : Selon Spécification Ci-dessus.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Processus de calcul des atomes x3 et y3.

; * NB - Rappel : pointMilieu(segment) - > (((x1 + x2)/2) ((y1 + y2)/2))

; Element participant à la réalisation :
; - Fonction Abscisse du point Milieu : pMA -> Pour le calcul de x3 = ((x1 + x2)/2)
; - Fonction Ordonnée du Point Milieu : pMO - > Pour le calcul de y3 = ((y1 + y2)/2)

; En Langae Lisp nous avons :
; (defun pointMilieu(segment)
;    (list (pMA segment) (pMO segment)) 
; )

; (defun pMA(segment)
;    (/ (+ x1 x2) 2)
; )

; (defun pM0(segment)
;    (/ (+ x1 x2) 2)
; )

;
; On parcours nos liste soit Gauche ou à droite.
; - Fonction decomposeDroite Nom : D
; - Fonction qui decompose à Gauche nomée : G
; NB : Suivant l'imbrication des applels des fonction D et G nous pouvons recuperer (x1 y1 x2 y2).

; (defun G(element)
;    (car element)
; )

; (defun D(element)
;    (cdr element)
; )

; Recuperer le Point1 : (G segment)
; Recuperer Abscisse Point1 x1 : (G (G segment))
; Recuperer Ordonnée Point1 y1 : (G (D (G segment)))

; Recuperer le Point2 : (G (D segment))
; Recuperer Abscisse Point2 x2 : (G (G (D segment)))
; Recuperer Ordonnée Point2 y2 : (G (D (G (D segment))))
;
; Nous pouvons donc re-écrire pMA et pMO
; (defun pMA(segment)
;    (/ (+ (G (G segment))  (G (G (D segment)))  ) 2)
; )

; (defun pMO(segment)
;    (/ (+ (G (D (G segment)))  (G (D (G (D segment))))  ) 2)
; )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Question 2.1 
; Ecrire le programme Lisp pointMilieur 'segment -> 'Point

(defun G(segment)
  (car segment)
)

(defun D(segment)
  (cdr segment)
)

(defun pMA(segment)
  (/ (+ (G (G segment))  (G (G (D segment)))  ) 2)
)

(defun pMO(segment)
  (/ (+ (G (D (G segment)))  (G (D (G (D segment))))  ) 2)
)

(defun pointMilieu(Segment)
  (list (pMA segment) (pMO segment))
)


