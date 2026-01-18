with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;     use Ada.Float_Text_IO;
with Ada.Text_IO;           use Ada.Text_IO;

procedure Ada_o32 is 
   
   --subtyper
   subtype Range_DS1_Subtype is
     Integer range 31..35;
   
   subtype Range_DS2_Subtype is
     Character range '5'..'9';
   
   subtype Char_Range_DS3_Subtype is
     Character range '4'..'8';
   
   subtype Int_Range_DS3_Subtype is
     Integer range 73..74;
   
   --typer
   type DS1_Array_Type is
     array (Range_DS1_Subtype) of Float; 
   
   type DS2_Sub_Array_Type is
     array (Range_DS2_Subtype) of String(1..5); 
   
   type DS2_Array_Type is
     array (Boolean'Range) of DS2_Sub_Array_Type;
   
   type DS3_Array_Type is
     array(Char_Range_DS3_Subtype, Int_Range_DS3_Subtype) of Integer;
   
   --get procedurer
   procedure Get(Item : out DS1_Array_Type) is
      
   begin
      
      for I in reverse Item'Range loop
	 
	 Get(Item(I));
      end loop;
   end Get;
   
   procedure Get(Item : out DS2_Sub_Array_Type) is
      
      Empty : Character;
   begin
      
      for C in reverse Item'Range loop 
	 
	 if Item'Last /= C then 
	    get(Empty);
	 end if;
	 
	 Get(Item(C));
      end loop;
   end Get;
   
   procedure Get(Item : out DS2_Array_Type) is
      
      Empty : Character;
   begin
      
      for I in Item'Range loop
	 
	 if I = Item'Last then 
	    Get(Empty);
	 end if;
	 
	 Get(Item(I));
      end loop;
   end Get;
   
   procedure Get(Item : out DS3_Array_Type ) is
      
   begin
      
      for I in Item'Range(2) loop
	 
	 for C in Item'Range(1) loop
	    
	    Get(Item(C,I));
	 end loop;
      end loop;
   end Get;
   
   --put procedurer
   procedure Put(Item : in DS1_Array_Type) is
      
   begin
      
      for I in reverse Item'Range loop
	 
	 Put(' ');
	 Put(Item(I), Fore => 0, Aft => 3, Exp =>0);
      end loop;
   end Put; 
   
   procedure Put(Item : in  DS2_Sub_Array_Type) is
      
   begin
      
      for C in reverse Item'Range loop
	 
	 Put(' ');
	 Put(Item(C));
      end loop;
   end Put;

   procedure Put(Item : in DS2_Array_Type) is
      
   begin
      
      for I in Item'Range loop
	 
	 Put(Item(I));
      end loop;
   end Put; 
   
   procedure Put(Item : in DS3_Array_Type) is
      
   begin
      
      for I in Item'Range(2) loop
	 
	 for C in Item'Range(1) loop
	    
	    Put(' ');
	    Put(Item(C,I), Width => 0);
	 end loop;
      end loop;
   end Put; 
   
   --------------------
   DS1 : DS1_Array_Type;
   DS2 : DS2_Array_Type;
   DS3 : DS3_Array_Type;
   
begin
   
   --DS1
   Put("För DS1:");
   New_Line;
   Put("Mata in datamängd: ");
   Get(DS1);
   Skip_Line;
   
   Put("Inmatad datamängd:");
   Put(DS1);
   New_Line(2);
   
   --DS2
   Put("För DS2:");
   New_Line;
   Put("Mata in datamängd: ");
   Get(DS2);
   Skip_Line;
   
   Put("Inmatad datamängd:");
   Put(DS2);
   New_Line(2);
   
   --DS3
   Put("För DS3:");
   New_Line;
   Put("Mata in datamängd: ");
   Get(DS3);
   Skip_Line;
   
   Put("Inmatad datamängd:");
   Put(DS3);
end Ada_O32;
