with Ada.Float_Text_IO;           use Ada.Float_Text_IO;
with Ada.Integer_Text_IO;         use Ada.Integer_Text_IO;
with Ada.Text_IO;                 use Ada.Text_IO;          
       
procedure Uppgift_01 is
   S : String (1..5);
   N : Integer;
   F: Float;
   C: Character;
begin
   Ada.Text_IO.Put("Skriv in ett heltal: ");
   Ada.Integer_Text_IO.get(N);
   Ada.Text_IO.Put("Du skrev in talet: ");
   Ada.Integer_Text_IO.Put(N, Width => 0);
   New_Line(2);
   Skip_Line;
   
   Ada.Text_IO.Put("Skriv in fem heltal: ");
   Ada.Integer_Text_IO.get(N);
   
   Ada.Text_IO.Put("Du skrev in talen: ");
   Ada.Integer_Text_IO.Put(N, 0);
   Ada.Text_IO.Put(" ");
   Ada.Integer_Text_IO.get(N);
   Ada.Integer_Text_IO.Put(N, 0);
   Ada.Text_IO.Put(" ");
   Ada.Integer_Text_IO.get(N);
   Ada.Integer_Text_IO.Put(N, 0);
   Ada.Text_IO.Put(" ");
   Ada.Integer_Text_IO.get(N);
   Ada.Integer_Text_IO.Put(N, 0);
   Ada.Text_IO.Put(" ");
   Ada.Integer_Text_IO.get(N);
   Ada.Integer_Text_IO.Put(N, 0);
   Skip_Line;
   New_Line(2);
   
   --ett flyttal
   Ada.Text_IO.Put("Skriv in ett flyttal: ");
   Ada.Float_Text_IO.Get(F);
   Ada.Text_IO.Put("Du skrev in flyttalet: ");
   Ada.Float_Text_IO.put(F, Fore => 1, aft =>3, Exp =>0);
   New_Line(2);
   Skip_Line;
   
   --heltal och flyttal
   Ada.Text_IO.Put("Skriv in ett heltal och ett flyttal: ");
   Ada.Integer_Text_IO.Get(N);
   Ada.Float_Text_IO.Get(F);
   Ada.Text_IO.Put("Du skrev in heltalet: ");
   Put(n,Width => 9);
   New_Line;
   Ada.Text_IO.Put("Du skrev in flyttalet:");
   Ada.Float_Text_IO.Put(F, Fore => 4, aft =>4, Exp =>0);
   New_Line(2);
   Skip_Line;
   
   --ett tecken
   Put("Skriv in ett tecken: ");
   Get(C);
   Put("Du skrev in tecknet: ");
   Put(C);
   New_Line(2);
   Skip_Line;
   
   --fem tecken
   Ada.Text_IO.Put("Skriv in en sträng med 5 tecken: ");
   Get(S(1..5));
   Ada.Text_IO.Put("Du skrev in strängen: ");
   Put(S(1..5));
   New_Line(2);
   Skip_Line;
   
   --tre tecken
   Ada.Text_IO.Put("Skriv in en sträng med 3 tecken: ");
   Get(S(1..3));
   Ada.Text_IO.Put("Du skrev in strängen: ");
   Put(S(1..3));
   New_Line(2);
   Skip_Line;
   
   Ada.Text_IO.Put("Skriv in ett heltal och en sträng med 5 tecken: ");
   Ada.Integer_Text_IO.get(N);
   Ada.Text_IO.Get(C);
   Ada.Text_IO.get(S(1..5));
   Skip_Line;
   
   Put("Du skrev in talet |");
   Ada.Integer_Text_IO.Put(N, Width => 0);
   Put("| och strängen |");
   Put(S(1..5));
   Put("|.");
   New_Line(2);
   
   Ada.Text_IO.Put("Skriv in en sträng med 3 tecken och ett flyttal: ");
   Ada.Text_IO.Get(S(1..3));
   Ada.Float_Text_IO.Get(F);
   Skip_Line;
   Ada.Text_IO.Put("Du skrev in """);
   Ada.Float_Text_IO.Put(F, Fore => 2, aft =>3, Exp =>0);
   Ada.Text_IO.Put(""" och """);
   Ada.Text_IO.Put(S(1..3)); 
   Put(""".");
   New_Line(2);
   
   Ada.Text_IO.Put("Skriv in en sträng som är maximalt 5 tecken: ");
   Get_line(S, N);
   Ada.Text_IO.Put("Du skrev in strängen: ");
   Ada.Text_IO.Put(S(1..N));
   New_Line(2);
   
   if S'Length = N then 
      Skip_Line;
   end if;
   
   Ada.Text_IO.Put("Skriv in en sträng som är maximalt 5 tecken: ");
   Get_line(S, N);
   Ada.Text_IO.Put("Du skrev in strängen: ");
   Ada.Text_IO.Put(S(1..n));
end Uppgift_01;
 
