with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;

procedure Test_Exceptions is
   
   --undantag--
   Length_Error : exception;
   Format_Error : exception;
   Year_Error   : exception;
   Mounth_Error : exception;
   Day_Error    : exception;
   
   --Data_typer--
   type Date_Type is 
      record 
	 Y, M, D : Integer;
      end record;
   
   ----------------------------------------------------------------------
   -- Underprogram för att skriva ut meny och hantera menyval          --
   --                                                                  --
   -- Underprogrammet skriver ut de menyval som finns tillgängliga.    --
   -- Användaren får mata in menyval tills denne matat in ett          --
   -- korrekt menyval.                                                 --
   ----------------------------------------------------------------------
   function Menu_Selection return Integer is
      
      N : Integer;
      
   begin
      Put_Line("1. Felkontrollerad heltalsinläsning");
      Put_Line("2. Längdkontrollerad stränginläsning");
      Put_Line("3. Felkontrollerad datuminläsning");
      Put_Line("4. Avsluta programmet");
      
      loop
	 Put("Mata in N: ");
	 Get(N);
	 exit when N in 1 .. 4;	 
	 Put_Line("Felaktigt N, mata in igen!");
      end loop;
      
      return N;
   end Menu_Selection;
   
   ----------------------------------------------------------------------
   -- Underprogram för menyval 1: "felhantering av heltalsinmatning"   --
   --                                                                  --
   -- Underprogrammet låter användaren mata in ett intervall angivet   --
   -- med två heltal Min och Max. Get_Safe anropas                     --
   -- sedan med detta intervall och sköter felhanteringen av           --
   -- heltalsinläsningen där användaren får mata in värden tills       --
   -- korrekt värde matas in.                                          --
   ----------------------------------------------------------------------

   procedure put_min_max(Min, Max : in Integer) is

   begin 

      Put(Min, Width => 0);
      Put(" - ");
      Put(Max, Width => 0);
      Put("): ");
   end put_min_max;
   
   procedure Get_Safe(Value : out Integer;
		      min, max : in Integer) is

   begin 
      Put("Mata in värde (");
      loop
	 put_min_max(Min, Max);
         begin
            Get(Value);
	    
	    if Value < Min then
	       Put("För litet värde. Mata in värde (");

	    elsif Value > Max then
	       Put("För stort värde. Mata in värde (");
	    else 
	       exit;
	    end if;
         exception
            when Data_Error => 
               Skip_Line;
	       Put("Fel datatyp. Mata in värde (");
         end;
      end loop;
   end Get_Safe;
   
   
   procedure Upg1 is
      
      Value, Min, Max : Integer;
      
   begin      
      Put("Mata in Min och Max: ");
      Get(Min);
      Get(Max);
      
      Get_Safe(Value, Min, Max);
      Skip_Line;
      
      Put("Du matade in heltalet ");
      Put(Value, Width => 0);
      Put_Line(".");      
   end Upg1;
   
   ----------------------------------------------------------------------
   -- Underprogram för menyval 2: "felhantering av stränginmatning"    --
   --                                                                  --
   -- Underprogrammet skapar en sträng som är lika lång som parametern --
   -- Length. Underprogrammet skickar denna sträng till                --
   -- Get_Correct_String där felhanteringen av stränginmatningen sker. --
   -- Om användaren matar in en för kort sträng kommer                 --
   -- Get_Correct_String kasta/resa undantag vilket inte ska           --
   -- fångas här utan i huvudprogrammet.                               --
   ----------------------------------------------------------------------
   
   procedure Get_Correct_String(S : out string) is 
      
      C : Character;
   begin
      
      loop
	 Get(C);
	 
	 exit when C /= ' ';
      end loop;
      
      S(S'First) := C;
      
      for I in S'First + 1 .. S'Last loop
	 
	 if End_Of_Line then 
	    raise Length_Error;
	 end if;
	 
	 Get(S(I));
      end loop;
   end Get_Correct_String;
   
   
   procedure Upg2(Length : in Integer) is
      
      S : String(1 .. Length);
      
   begin 
      
      Put("Mata in en sträng med exakt ");
      Put(Length, Width => 0);
      Put(" tecken: ");
      
      Get_Correct_String(S);
      Skip_Line;
      
      Put_Line("Du matade in strängen " & S & ".");   
   end Upg2;
   
   ----------------------------------------------------------------------
   -- Underprogram för menyval 3: "felhantering av datuminmatning"     --
   --                                                                  --
   -- Underprogrammet anropar Get som i sin tur kommer läsa in och     -- 
   -- kontrollera ett datums format och rimlighet. Om datumet är       --
   -- felaktigt kommer Get kasta/resa undantag vilket detta            --
   -- underprogram ska fånga, skriva ut felmeddelande för och sedan    --
   -- anropa Get igen.                                                 --
   ----------------------------------------------------------------------'

   function Find_Format_Error (S : in String) return Boolean is
      
      Str : String(1..10) := S;
   begin 
      
      if Str(5) /= '-' or Str(8) /= '-' then
	 return True;
      end if;
      
      for I in 1..10 loop
	 if ((I in 1..4) or (I in 6..7) or (I in 9..10)) 
	   and not (Str(I) in '0' .. '9') then 
	    
	    return True;
	 end if; 
      end loop;
      
      return False;
   end Find_Format_Error;
   
   
   procedure String_To_Integer(S : in String;
			       Item : out Date_Type) is
      
      Str : String(1..10) := S;
   begin
      
      Item.Y := Integer'Value(Str(1..4));  
      Item.M := Integer'Value(Str(6..7));  
      Item.D := Integer'Value(Str(9..10)); 
   end String_To_Integer;
   
   
   function Find_Year_Error (Item : in Date_Type) return Boolean is
      
   begin 
      
      if not (Item.Y >= 1532 and Item.Y <= 9000) then
	 return True;
      end if;
      
      return False;
   end  Find_Year_Error;
   
   
   function Find_Mounth_Error (Item : in Date_Type) return Boolean is
      
   begin 
      
      if not (Item.M >= 1 and Item.M <= 12) then 
	 return True;
      end if;
      
      return False;
   end  Find_Mounth_Error;
   
   
   function Is_Leap_Year(Item : in Date_Type) return Boolean is 
      
   begin 
      
      if ( (Item.Y mod 400 = 0) 
	     or (Item.Y mod 100 /= 0 and Item.Y mod 4 = 0) ) then 
	 return True;
      end if;
      
      return False;
   end Is_Leap_Year;
   
   
   function Find_Day_Error (Item : in Date_Type) return Boolean is
      
   begin 
      
      if not (Item.D >= 1 and Item.D <= 31) then 
         return True;
      end if;
      
      if Item.M = 2 then
	 
	 if (Item.D > 29) 
	   or (Item.D = 29 and not Is_Leap_Year(Item)) then
	    return True;
	 end if;
      elsif ((Item.M = 4 or Item.M = 6 or Item.M = 9 or Item.M = 11) 
	     and not (Item.D <= 30)) then
         return True;
      end if;
      
      return False;
   end  Find_Day_Error;
   
   
   procedure Get(Item : out Date_Type) is

      S : string(1..10);
   begin

      begin
	 Get_Correct_String(S);
	 
	 if Find_Format_Error(S) then 
	    raise Format_Error;
	 end if;

	 String_To_Integer(S, Item);
	 
	 if Find_Year_Error(Item) then 
	    raise Year_Error;
	 elsif Find_Mounth_Error(Item) then 
	    raise Mounth_Error;
	 elsif Find_Day_Error(Item) then 
	    raise Day_Error;
	 end if;
	 
      exception
	 when Length_Error =>
	    raise Format_Error;
      end;
   end Get;	
   
   
   procedure Put_And_Add_Zero_If (Value : in Integer) is 
      
   begin  

      if Value < 10 then 
         put('0');
      end if;
      
      Put(Value, Width => 0);
   end Put_And_Add_Zero_If;
   
   
   procedure Put (Item : in Date_Type) is
      
   begin
      
      put(Item.Y, Width =>0);
      Put('-');

      Put_And_Add_Zero_If(Item.M);
      Put('-');
      
      Put_And_Add_Zero_If(Item.D);
   end Put;
   
   
   procedure Upg3 is
      
      Date : Date_Type;
   begin    
      
      Put("Mata in ett datum: ");
      loop
	 begin
	    Get(Date);
	    Skip_Line;
	    
	    Put("Du matade in ");
	    Put(Date);
	    New_Line;
	    exit;
	    
	 exception
	    when Format_Error =>
	       Put("Felaktigt format! Mata in ett datum: ");
	    when Year_Error =>
	       Put("Felaktigt år! Mata in ett datum: ");
	    when Mounth_Error =>
	       Put("Felaktig månad! Mata in ett datum: ");
	    when Day_Error =>
	       Put("Felaktig dag! Mata in ett datum: ");
	 end;
      end loop;
   end Upg3;
   
   ----------------------------------------------------------------------
   -- Huvudprogram                                                     --
   --                                                                  --
   -- Huvudprogrammet skriver ut och låter användaren välja val i en   --
   -- meny via underprogrammet Menu_Selection. Beroende på vilket      --
   -- menyval användaren valt kommer olika underprogram anropas.       --
   -- Observera att för menyval 2 kommer användaren få mata in längden -- 
   -- av en sträng vilket skickas vidare till underporgrammet Upg2 där --
   -- strängen i sig skapas.                                           --
   ----------------------------------------------------------------------
   Choice, Length : Integer;
   
begin  
   loop
      Choice := Menu_Selection;
      
      if Choice = 1 then
	 Upg1;
	 
      elsif Choice = 2 then
	 begin 
	    Put("Mata in en stränglängd: ");
	    Get(Length);
	    Skip_Line;
	    
	    Upg2(Length);
	 exception 
	    when Length_Error =>
	       Put("För få inmatade tecken!");
	       exit;
	 end;
      elsif Choice = 3 then
	 Upg3;
	 
      else
	 Put_Line("Programmet avslutas.");
	 exit;
      end if;  
   end loop;
end Test_Exceptions;
