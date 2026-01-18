with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;     use Ada.Float_Text_IO;
with Ada.Text_IO;           use Ada.Text_IO;
procedure ptest is 
   
   function "+" (LHV: in Float;
		   RHV: in Integer) return Float is 
   begin
      return Float'(LHV + Float(RHV));
   end "+";
   
   ----------------------------------------------------------------
   
   function String_Maker(N, X : in Integer) return String is
      
     X_Len : Integer            := Integer'Image(X)'Length;
     X_Str : String(1 .. X_Len) := Integer'Image(X)(1 .. X_Len) ;
     
     Str   : String(1 .. N * X_Len);
     A, B  : Integer            := 0;
   begin

      for I in 1..N loop
     
	 A := 1 + B;
	 B := (X_Len)*I;
         --Put(A);
	 --Put(B);
	 Str(A .. B) := X_Str;
	 
	 
      end loop;
      
      return Str;
   end String_Maker;
      
   ----------------------------------------------------------------   
   
   procedure Get_And_Add(I : out Integer;
			 F : out Float;
			 R : out Integer) is 
   begin
      Put("Mata in ett heltal: ");
      Get(I);
      Skip_Line;
      
      Put("Mata in ett flyttal: ");
      Get(F);
      Skip_Line;
      
      R := Integer(Float'Rounding(Float(I) + F));
      
   end Get_And_Add;
   F :Float;
   I :Integer;
   
   N, X : Integer;
begin
   Put("skriv in ett heltal: ");
   get(I);
   Put("skriv in ett Flyttal: ");
   Get(F);
   Skip_Line;
   
   Put("Resultatet blir:");
   Put(F + I, Fore => 0, Aft => 0, Exp =>0);
   New_Line(2);
   
   Put("skriv in ett heltal: ");
   get(X);
   
   Put("skriv in hur många gånger du vill ha talet: ");
   Get(N);
   Put("du fick strängen: ");
   Put(String_Maker(N, X));
end ptest;
