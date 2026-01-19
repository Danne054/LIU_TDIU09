with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use  Ada.Float_Text_IO;

procedure momstabell is
   ForstaPris, SistaPris, Steg, MomsDecimal, StartPris: Float;
   R: Integer;
begin
   
   loop
      
      Put("Första pris: ");
      Get(ForstaPris);
      Skip_Line;
     
      if ForstaPris >  0.00 then
	 exit;
      else
	 
	 Put("Felaktigt värde!");
	 New_Line;
      end if;
   end loop;
   loop
      
      Put("Sista pris: ");
      Get(SistaPris);
      Skip_Line;
      
      if SistaPris >= ForstaPris then
	 exit;
      else
	 
	 Put("Felaktigt värde!");
	 New_Line;
      end if;
   end loop;
   loop
      
      Put("Steg: ");
      Get(Steg);
      Skip_Line;
      
      if Steg >  0.00 then
	 exit;
      else
	 
	 Put("Felaktigt värde!");
	 New_Line;
      end if;
      
   end loop;
   
   loop
      
      Put("Momsprocent: ");
      Get(MomsDecimal);
      Skip_Line;
      
      if (MomsDecimal >=  0.00) and (MomsDecimal <= 100.0) then
	 exit;
      else
	 Put("Felaktigt värde!");
	 New_Line;
      end if;
   end loop;
   
   --beräkninger utförda innan for loop
   
   --moms i förändringsfaktor 
   MomsDecimal := MomsDecimal*0.01 + 1.0;
   
   --
   R := Integer(Float'Floor((SistaPris - ForstaPris)/Steg)) + 1;
   
   
   New_Line;
   Put("============ Momstabell ============");
   New_Line;
   Put("Pris utan moms  Moms   Pris med moms");
   
   
   StartPris := ForstaPris;
   
   for I in 1 .. R  loop
      
      New_Line;
      
      --beräkninger
      ForstaPris := StartPris + Steg*Float(I-1);
      SistaPris := (MomsDecimal * ForstaPris);
      
      --outputs
      Put(ForstaPris, Fore => 6, Aft => 2, Exp => 0);
      Put((SistaPris - ForstaPris), Fore => 8, Aft => 2, Exp => 0);
      Put(SistaPris, Fore => 9, Aft => 2, Exp => 0);
   end loop;
end momstabell;
