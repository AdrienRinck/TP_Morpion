
{Algorithme Morpion
But
Entree
Sortie
CONST MAX=3
TYPE TypeTab=Tableau [1..MAX,1..MAX] de caractères
Procedure initPseudo(var Pseudo1:Chaine, var Pseudo2:Chaine);
begin
	Ecrire("Joueur 1 choisissez un pseudo");
	Lire(Pseudo1);
	Ecrire("Joueur 2 choisissez un pseudo");
	Lire(Pseudo2);
end;
Procedure initTab(var T1:TypeTab)
var
	i,j:entier
Debut
	Pour i<-1 a MAX Faire
		Pour j<-1 a MAX Faire
			T1[i,j]<-'.'
		FinPour
	FinPour
FinProcedure
Procedure TourJ1(var T1:TypeTab, Pseudo1:Chaine)
var
	Abs,ord:entier
Debut
	Repeter
		Ecrire(Pseudo1+,": Vous avez les X, ou voulez vous la placer (Abs Ord) ?")
		Lire(Abs,ord)
	Jusqu'a T1[Abs,Ord]='.'
	T1[Abs,Ord]<-'X'
FinProcedure
Procedure TourJ2(var T1:TypeTab, Pseudo2:Chaine)
var
	Abs,ord:entier
Debut
	Repeter
		Ecrire(Pseudo2+" : Vous avez les O, ou voulez vous la placer (Abs Ord) ?")
		Lire(Abs,ord)
	Jusqu'a T1[Abs,Ord]='.'
	T1[Abs,Ord]<-'O'
FinProcedure
Procedure AffichageTab(T1:TypeTab)
var
	i,j:entier
Debut
	Pour i<-1 a MAX faire
		Pour j<-1 a MAX faire
			Ecrire(T1[i,j])
		FinPour
	FinPour
FinProcedure
Fonction VictoireJ1(T1:TypeTab):Booleen
Debut
	VictoireJ1<-FAUX
	si (T1[1,1]='X') ET (T1[1,2]='X') ET (T1[1,3]='X') alors
		VictoireJ1<-VRAI
	si (T1[1,1]='X') ET (T1[2,1]='X') ET (T1[3,1]='X') alors
		VictoireJ1<-VRAI
	si (T1[1,1]='X') ET (T1[2,2]='X') ET (T1[3,3]='X') alors
		VictoireJ1<-VRAI
	si (T1[1,3]='X') ET (T1[2,3]='X') ET (T1[3,3]='X') alors
		VictoireJ1<-VRAI
	si (T1[3,1]='X') ET (T1[3,2]='X') ET (T1[3,3]='X') alors
		VictoireJ1<-VRAI
FinProcedure
Fonction VictoireJ2(T1:TypeTab):Boolean
Debut
	VictoireJ2<-FAUX
	if (T1[1,1]='O') ET (T1[1,2]='O') ET (T1[1,3]='O') alors
		VictoireJ2<-VRAI
	if (T1[1,1]='O') ET (T1[2,1]='O') ET (T1[3,1]='O') alors
		VictoireJ2<-VRAI
	if (T1[1,1]='O') ET (T1[2,2]='O') ET (T1[3,3]='O') alors
		VictoireJ2<-VRAI
	if (T1[1,3]='O') ET (T1[2,3]='O') ET (T1[3,3]='O') alors
		VictoireJ2<-VRAI
	if (T1[3,1]='O') ET (T1[3,2]='O') ET (T1[3,3]='O') alors
		VictoireJ2<-VRAI
FinProcedure
var
	T1:Tableau[1..MAX,1..MAX] de caractères
	x,y,nb:entier
Debut
	initTab(T1)
	Repeter	
		Repeter
			TourJ1(T1,Pseudo1)
			AffichageTab(T1)
			Si VictoireJ1(T1)=FAUX alors
				TourJ2(T1,Pseudo2)
				AffichageTab(T1)
			FinSi
			Si VictoireJ1(T1)=VRAI alors
				x<-x+1
				Ecrire('Victoire manche J1')
			FinSi
			Si VictoireJ2(T1)=VRAI alors
				y<-y+1
				Ecrire('Victoire manche J2')
			FinSi
		Jusqu'a VictoireJ1(T1)=VRAI OU VictoireJ2(T1)=VRAI
		InitTab(T1)
	Jusqu'a (x=Nb) OU (y=Nb)
	Si x=Nb Alors
		Ecrire('VICTOIRE J1')
	Si y=Nb Alors
		Ecrire('VICTOIRE J2')
Fin. }


Program Morpion;
uses crt;
Const MAX=3;
Type TypeTab=Array[1..MAX,1..MAX] of Char;
{
//------------------------------------------------------------------------------//
				Initialisation des pseudonymes des joueurs
//------------------------------------------------------------------------------//
}

Procedure initPseudo(var Pseudo1:string; var Pseudo2:string);
begin
	Writeln('Joueur 1 choisissez un pseudo');
	Readln(Pseudo1);
	Writeln('Joueur 2 choisissez un pseudo');
	Readln(Pseudo2);
end;

{
//------------------------------------------------------------------------------//
				Initialisation du plateau (RESET)
//------------------------------------------------------------------------------//
}

Procedure initTab(var T1:TypeTab);
var
	i,j:integer;
begin
	For i:=1 to MAX do
		begin 	
			For j:=1 to MAX do
				begin
					T1[i,j]:='.';
				end;
		End;
End;

{
//------------------------------------------------------------------------------//
						Tour du joueur ayant les 'X'
//------------------------------------------------------------------------------//
}

Procedure TourJ1(var T1:TypeTab; Pseudo1:string);
var
	Abs,ord:integer;
Begin	
	Repeat
		Writeln(Pseudo1,' : Vous avez les X, ou voulez vous la placer (Abs Ord) ?');
		Readln(Abs,Ord);
	Until (Abs<=MAX) AND (Ord<=MAX) AND (T1[Abs,Ord]='.');								//Verif de l'input
	T1[Abs,Ord]:='X';
end;

{
//------------------------------------------------------------------------------//
					Tour du joueur ayant les 'O'
//------------------------------------------------------------------------------//
}

Procedure TourJ2(var T1:TypeTab; Pseudo2:string);
var
	Abs,ord:integer;
begin
	Repeat
		Writeln(Pseudo2,' : Vous avez les O, ou voulez vous le placer (Abs Ord) ?');
		Readln(Abs,ord);
	Until (Abs<=MAX) AND (Ord<=MAX) AND (T1[Abs,Ord]='.');								//Verif de l'input
	T1[Abs,Ord]:='O';
end;

{
//------------------------------------------------------------------------------//
					Affichage du plateau de jeux
//------------------------------------------------------------------------------//
}

Procedure AffichageTab(T1:TypeTab);
var	
	i,j:integer;
begin
	For i:=1 to MAX do
		Begin
			For j:=1 to MAX do
				Begin
					Write(' ',T1[i,j],' | ');
				end;
			Writeln;
			Writeln('______________');
			Writeln;
		End;
End;

{
//------------------------------------------------------------------------------//
				Fonction booléenne de test de victoire pour les 'X'
//------------------------------------------------------------------------------//
}

Function VictoireJ1(T1:TypeTab):Boolean;
begin
	VictoireJ1:=False;
	if (T1[1,1]='X') AND (T1[1,2]='X') AND (T1[1,3]='X') then
		VictoireJ1:=True;
	if (T1[1,1]='X') AND (T1[2,1]='X') AND (T1[3,1]='X') then
		VictoireJ1:=True;
	if (T1[1,1]='X') AND (T1[2,2]='X') AND (T1[3,3]='X') then
		VictoireJ1:=True;
	if (T1[1,3]='X') AND (T1[2,3]='X') AND (T1[3,3]='X') then
		VictoireJ1:=True;
	if (T1[2,1]='X') AND (T1[2,2]='X') AND (T1[2,3]='X') then
		VictoireJ1:=True;
	if (T1[3,1]='X') AND (T1[3,2]='X') AND (T1[3,3]='X') then
		VictoireJ1:=True;
	if (T1[1,3]='X') AND (T1[2,2]='X') AND (T1[3,1]='X') then
		VictoireJ1:=True;
	if (T1[1,2]='X') AND (T1[2,2]='X') AND (T1[3,2]='X') then
		VictoireJ1:=True;
end;

{
//------------------------------------------------------------------------------//
				Fonction booléenne de test de victoire pour les 'O'
//------------------------------------------------------------------------------//
}

Function VictoireJ2(T1:TypeTab):Boolean;
begin
	VictoireJ2:=False;
	if (T1[1,1]='O') AND (T1[1,2]='O') AND (T1[1,3]='O') then
		VictoireJ2:=True;
	if (T1[1,1]='O') AND (T1[2,1]='O') AND (T1[3,1]='O') then
		VictoireJ2:=True;
	if (T1[1,1]='O') AND (T1[2,2]='O') AND (T1[3,3]='O') then
		VictoireJ2:=True;
	if (T1[1,3]='O') AND (T1[2,3]='O') AND (T1[3,3]='O') then
		VictoireJ2:=True;
	if (T1[2,1]='O') AND (T1[2,2]='O') AND (T1[2,3]='O') then
		VictoireJ2:=True;
	if (T1[3,1]='O') AND (T1[3,2]='O') AND (T1[3,3]='O') then
		VictoireJ2:=True;
	if (T1[1,3]='O') AND (T1[2,2]='O') AND (T1[3,1]='O') then
		VictoireJ2:=True;
	if (T1[1,2]='O') AND (T1[2,2]='O') AND (T1[3,2]='O') then
		VictoireJ2:=True;
end;
{
//------------------------------------------------------------------------------//
								MAIN
//------------------------------------------------------------------------------//
}
var
	T1:Array[1..MAX,1..MAX] of Char;
	x,y,Nb,Compteur:integer;
    Pseudo1,Pseudo2:string;
	FMorpion:Text;
Begin
	assign(FMorpion,'ResultatMorpion.txt');					//Ouverture d'un fichier de stockage des résultats
	Rewrite(FMorpion);
	clrscr;
	initTab(T1);
	initPseudo(Pseudo1,Pseudo2);
	Writeln('Combien de manches gagnantes voulez vous jouer ?');	//initialisation du nombre de tour de jeux
	Readln(Nb);
{
//------------------------------------------------------------------------------//
				Tour de jeux avec le joueur 'X' qui commence
//------------------------------------------------------------------------------//
}	
	Repeat
		Repeat
			clrscr;
			TourJ1(T1,Pseudo1);
			AffichageTab(T1);
			Compteur:=Compteur+1;
			Writeln('Appuyez sur entree');
			Readln;
			if (VictoireJ1(T1)=False) AND (Compteur<>9) then	//Condition d'entrée dans le tour de jeux
			begin
				clrscr;
				TourJ2(T1,Pseudo2);
				AffichageTab(T1);
				Compteur:=Compteur+1;
				Writeln('Appuyez sur entree');
				Readln;
			end;
			If VictoireJ1(T1)=True then
				begin
					x:=x+1;									//Variable de verif de victoire pour le joueur 1
					Writeln('Victoire manche ',Pseudo1);
					Compteur:=0;
					Writeln(Pseudo1,' : ',x,'/',y,' : ',Pseudo2);
				end;
			If VictoireJ2(T1)=True then
				begin
					y:=y+1;									//Variable de verif de victoire pour le joueur 2
					Writeln('Victoire manche ',Pseudo2);
					Compteur:=0;
					Writeln(Pseudo1,' : ',x,'/',y,' : ',Pseudo2);
				end;
				
		Until (VictoireJ1(T1)=True) OR (VictoireJ2(T1)=True) OR (Compteur=9) OR (x=NB) OR (y=NB);
		If (compteur=9) AND (VictoireJ1(T1)=False) AND (VictoireJ2(T1)=False) then
			Writeln('Pas de gagnant, on recommence !');
			
		InitTab(T1);
		Readln;
{
//------------------------------------------------------------------------------//
				Tour de jeux avec le joueur 'O' qui commence
//------------------------------------------------------------------------------//
}
//Meme chose qu'en haut, sauf que le joueur possédant les 'O' commence, pour respecter la parité entre les deux joueurs
		if (x<>NB) AND (y<>NB) then 						//Conditions d'entrée dans la nouvelle manche, vérif si un joueur a déjà gagner
		begin
			Repeat
				clrscr;
				TourJ2(T1,Pseudo2);
				AffichageTab(T1);
				Compteur:=Compteur+1;
				Writeln('Appuyez sur entree');
				Readln;
			if (VictoireJ2(T1)=False) AND (Compteur<>9) then 	//Condition d'entrée dans le tour de jeux
			begin
				clrscr;
				TourJ1(T1,Pseudo1);
				AffichageTab(T1);
				Compteur:=Compteur+1;
				Writeln('Appuyez sur entree');
				Readln;	
			end;
			If VictoireJ2(T1)=True then
				begin
					y:=y+1;
					Writeln('Victoire manche ',Pseudo2);
					Compteur:=0;
					Writeln(Pseudo1,' : ',x,'/',y,' : ',Pseudo2);
				end;
			If VictoireJ1(T1)=True then
				begin
					x:=x+1;
					Writeln('Victoire manche ',Pseudo1);
					Compteur:=0;
					Writeln(Pseudo1,' : ',x,'/',y,' : ',Pseudo2);
				end;
		Until (VictoireJ1(T1)=True) OR (VictoireJ2(T1)=True) OR (Compteur=9) OR (x=NB) OR (y=NB);
		If (compteur=9) AND (VictoireJ1(T1)=False) AND (VictoireJ2(T1)=False) then
			Writeln('Pas de gagnant, on recommence !');	
		Readln;	
		end;			
	initTab(T1);
	Until (x=Nb) or (y=Nb);
	If x=Nb then
	begin
		Writeln('VICTOIRE ',Pseudo1);
		Writeln(FMorpion,'Victoire : ',Pseudo1);
	end;
	If y=Nb then
	begin
		Writeln('VICTOIRE ',Pseudo2);
		Writeln(FMorpion,'Victoire : ',Pseudo2);
	end;
	Writeln(Pseudo1,' : ',x,'/',y,' : ',Pseudo2);					//Affichage du résultat
	Writeln(FMorpion,Pseudo1,' : ',x,'/',y,' : ',Pseudo2);			//Ecriture du résultat dans le fichier
	Close(FMorpion);
	Readln;
End.
