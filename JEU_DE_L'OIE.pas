{le jeu de l'oie : le joueur est caractérisé par un nombre nommé "place" compris entre 0 et 66 qui situe sa
position sur le jeu de l'oie, sachant qu'il y a un jet de 2 dés, on applique les règles suivantes : on avance
du nombre de cases indiqués par la somme des dés, si on arrive juste sur la case 66, le jeu est terminé, sinon
on recule du nombre supérieur à 66, une oie ttes les 9 cases sauf en 63 double le déplacement, tête de mort en
case 58 renvoie en case 1, le jeu se joue seul, on s'efforcera d'utiliser un max de constante, on doit prod un
algo et un code lisible et clair, on doit insérer des coms, on doit vérifier si le jet de dés est valide entre
2 et 12, il est conseillé de use un mod pour tester si une case est un multiple de 9}

{ALGORITHME : JEU_DE_L_OIE

//BUT : faire un jeu de l'oie, avec les regles qui lui sont propres
//PRINCIPE : utiliser une boucle REPETER et des conditions
//ENTREES : place du joueur, son jet de des, et le nombre de tours, l'utilisateur ne saisit rien
//SORTIES : la place du joueur ainsi que son jet a chaque tour, avec a la fin le nombre de tours 

CONST

	CaseMort=58
	CaseVictoire=66

VAR

	place, jet, tour : ENTIER

DEBUT
	
	ALEATOIRE
	place<-1
	tour<-1

	ECRIRE "Bienvenue dans le jeu de l`oie. Appuyez sur entree pour continuer."
	LIRE

	REPETER
		jet<-(ALEATOIRE(10)+2)
		ECRIRE "Vous avez fait un jet de ", jet
		place<-place+jet
		SI (place>CaseVictoire) ALORS
			ECRIRE "Vous avez depasse ", CaseVictoire, ", vous reculez de ", place-CaseVictoire
			place<-CaseVictoire*2-place
		SINON SI (place MOD 9=0) ET (place<>63) ALORS
			ECRIRE "Vous etes sur une case multiple de 9 ! Votre prochain déplacement compte double"
			place<-place+jet
		SINON SI (place=CaseMort) ALORS
			place<-1
			ECRIRE "Vous etes arrive(e) sur la case tete de mort, vous revenez au debut."
		FINSI
		ECRIRE "Vous etes a la case", place
		LIRE
		tour<-tour+1
	JUSQU'A (place=CaseVictoire)

	ECRIRE "Vous etes arrive(e) sur la case", CaseVictoire, ", bravo, vous gagnez !", "Il vous aura fallu ", tour, " tours pour gagner !"
	LIRE

FIN}

PROGRAM JEU_DE_L_OIE;

USES crt;

//BUT : faire un jeu de l'oie, avec les règles qui lui sont propres
//PRINCIPE : utiliser une boucle REPETER et des conditions
//ENTREES : place du joueur, son jet de des, et le nombre de tours, l'utilisateur ne saisit rien
//SORTIES : la place du joueur ainsi que son jet a chaque tour, avec a la fin le nombre de tours 

CONST

	CaseMort=58;
	CaseVictoire=66;

VAR

	place : INTEGER;
	jet : INTEGER;
	tour: INTEGER;

BEGIN

	clrscr;
	RANDOMIZE;		//Cette fonction permet de rendre le jet aléatoire.
	place:=1;		//Initialisation des variables...
	tour:=1;

	writeln('Bienvenue dans le jeu de l`oie. Appuyez sur entree pour continuer.');
	readln;

	REPEAT		//Utilisation de la boucle REPEAT permettant d'utiliser plusieurs fois les instructions un nombre indéfini de fois.
		jet:=(RANDOM(10)+2);		//Le jet de dés représente un jet de 2 dés de 6, 0 et 1 sont donc impossibles.
		writeln('Vous avez fait un jet de ', jet);
		place:=place+jet;		
		IF (place>CaseVictoire) THEN		//Si la case du joueur est plus grande que la case victoire, alors le nombre supérieur à la case victoire se soustrait à la case du joueur.
		BEGIN
			writeln('Vous avez depasse ', CaseVictoire, ', vous reculez de ', place-CaseVictoire);
			place:=CaseVictoire*2-place;
		END
		ELSE IF (place MOD 9=0) AND (place<>63) THEN //Sinon s'il est sur une case multpile de 9, sauf 63, son jet compte double.
		BEGIN
			writeln('Vous etes sur une une case multiple de 9 ! Votre deplacement compte double !');
			place:=place+jet;
		END
		ELSE IF (place=CaseMort) THEN		//Sinon s'il arrive sur la case mort, alors il revient au début.
		BEGIN
			place:=1;
			writeln('Vous etes arrive(e) sur la case tete de mort, vous revenez au debut.');
		END;
		writeln('Vous etes a la case ', place);
		readln;
		tour:=tour+1
	UNTIL (place=CaseVictoire);		//La partie se termine lorsqu'il arrive sur la case 66.

	writeln('Vous etes arrive(e) sur la case ', CaseVictoire, ', bravo, vous gagnez ! Il vous aura fallu ', tour, ' tours pour gagner.');
	readln;

END.
